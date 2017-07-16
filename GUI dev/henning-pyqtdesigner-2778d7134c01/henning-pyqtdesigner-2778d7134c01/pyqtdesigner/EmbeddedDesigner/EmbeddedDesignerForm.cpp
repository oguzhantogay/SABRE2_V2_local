#include <QDebug>
#include <QFile>
#include <QPluginLoader>
#include <QMdiSubWindow>
#include <QMessageBox>
#include <QDir>
#include <QCloseEvent>
#include <QScrollBar>
#include <QTextCodec>
#include <QtDesigner/QDesignerFormEditorInterface>
#include <QtDesigner/QDesignerComponents>
#include <QtDesigner/QDesignerWidgetBoxInterface>
#include <QtDesigner/QDesignerFormEditorPluginInterface>
#include <QtDesigner/QDesignerFormWindowManagerInterface>
#include <QtDesigner/QDesignerObjectInspectorInterface>
#include <QtDesigner/QDesignerPropertyEditorInterface>
#include "internals/qdesigner_integration_p.h"

#include "EmbeddedDesignerForm.h"
#include "ui_EmbeddedDesignerForm.h"

EmbeddedDesignerForm::EmbeddedDesignerForm(QWidget *parentWidget) :
    QWidget(parentWidget),
    ui(new Ui::EmbeddedDesignerForm)
{
    ui->setupUi(this);
    ui->splitter_2->setStretchFactor(1, 100);

    QDesignerFormEditorInterface *iface = QDesignerComponents::createFormEditor(this);
    QDesignerComponents::createTaskMenu(iface, parent());
    QDesignerComponents::initializePlugins( iface );
    QDesignerComponents::initializeResources();
    iface->setTopLevel(this);
    iface->setWidgetBox(QDesignerComponents::createWidgetBox(iface, this));

    iface->widgetBox()->setFileName(QLatin1String(":/trolltech/widgetbox/widgetbox.xml"));
    iface->widgetBox()->load();

    iface->setPropertyEditor(QDesignerComponents::createPropertyEditor(iface, 0));
    iface->setObjectInspector(QDesignerComponents::createObjectInspector(iface, 0));
    iface->setActionEditor(QDesignerComponents::createActionEditor(iface, 0));

    _designer = new qdesigner_internal::QDesignerIntegration(iface, this);
    iface->setIntegration(_designer);
    qdesigner_internal::QDesignerIntegration::initializePlugins( iface );

    QDesignerFormEditorPluginInterface *fep;
    foreach (QObject *plugin, QPluginLoader::staticInstances()) {
        if ( (fep = qobject_cast<QDesignerFormEditorPluginInterface*>(plugin)) ) {
            if (!fep->isInitialized())
                fep->initialize(_designer->core());

            QString actionText = fep->action()->text();
            if (actionText == "Edit Tab Order")
                _editTabAction = fep->action();

            if (actionText == "Edit Buddies")
                _editBuddies = fep->action();
        }
    }

    QWidget * widgetBox = _designer->core()->widgetBox();
    //QDesignerWidgetBoxInterface *widgetBox = QDesignerComponents::createWidgetBox(iface, 0);
    ui->widgetsPlace->layout()->addWidget(widgetBox);
    widgetBox->setObjectName("toolbox");

    QWidget * widgetObjectInspector = qobject_cast<QDesignerObjectInspectorInterface *>(_designer->core()->objectInspector());
    ui->objectsPlace->layout()->addWidget(widgetObjectInspector);
    widgetObjectInspector->setObjectName("inspector");

    QWidget * widgetPropertyEditor = qobject_cast<QDesignerPropertyEditorInterface * >(_designer->core()->propertyEditor());
    ui->propertyPlace->layout()->addWidget(widgetPropertyEditor);
    widgetPropertyEditor->setObjectName("properties");

    QWidget *signalSlotEditor = QDesignerComponents::createSignalSlotEditor(iface, 0);
    signalSlotEditor->hide();
    ui->propertyPlace->layout()->addWidget(signalSlotEditor);
    signalSlotEditor->setObjectName("signals2slots");
     
    //QWidget * actionEditor = qobject_cast<QDesignerActionEditorInterface * >(_designer->core()->actionEditor());
    QDesignerActionEditorInterface *actionEditor = QDesignerComponents::createActionEditor(iface, 0);
    iface->setActionEditor(actionEditor);
    //ui->propertyPlace->layout()->addWidget(actionEditor);


    connect(ui->editSwitch, SIGNAL(buttonPressed(QAbstractButton*)), SLOT(onEditSwithPressed(QAbstractButton*)));
    _modified = false;
}

void EmbeddedDesignerForm::showEvent(QShowEvent *)
{
    QList<int> sizes;
    sizes << 250 << ui->splitter_2->width() - 450 << 250;
    ui->splitter_2->setSizes(sizes);
    //qDebug() << ui->formPlace->horizontalScrollBar()->value();
    //ui->formPlace->horizontalScrollBar()->setValue(-ui->formPlace->horizontalScrollBar()->value());
    //ui->formPlace->scroll(-ui->formPlace->horizontalScrollBar()->value(),0);
}

EmbeddedDesignerForm::~EmbeddedDesignerForm()
{
    delete ui;
}

bool EmbeddedDesignerForm::loadFile(const QString & fileName)
{
    if (QFile::exists(fileName)){
        QTextCodec::setCodecForCStrings(QTextCodec::codecForName("UTF-8"));
        _fileName = fileName;
        _form = _designer->core()->formWindowManager()->createFormWindow(this);
        _form->setFileName(_fileName);

        QFile f(fileName);
        f.open(QIODevice::ReadOnly | QIODevice::Text);
        _form->setContents(f.readAll());
        f.close();

        QMdiSubWindow *wnd = ui->formPlace->addSubWindow(_form, Qt::Window | Qt::CustomizeWindowHint | Qt::WindowTitleHint);
        const QSize containerSize = _form->mainContainer()->size();
        const QSize containerMinimumSize = _form->mainContainer()->minimumSize();
        const QSize containerMaximumSize = _form->mainContainer()->maximumSize();
        const QSize decorationSize = wnd->geometry().size() - wnd->contentsRect().size();
        qDebug() << containerSize;
        wnd->resize(containerSize+decorationSize);
        wnd->setMinimumSize(containerMinimumSize+decorationSize);
        if( containerMaximumSize == QSize(QWIDGETSIZE_MAX,QWIDGETSIZE_MAX) )
            wnd->setMaximumSize(containerMaximumSize);
        else
            wnd->setMaximumSize(containerMaximumSize+decorationSize);
        wnd->setWindowTitle( _form->mainContainer()->windowTitle() );

        connect(_form, SIGNAL(changed()), SLOT(onFormChanged()));
        _designer->core()->formWindowManager()->setActiveFormWindow(_form);
        _form->editWidgets();
        return true;
    }
    return false;
}

void EmbeddedDesignerForm::onEditSwithPressed(QAbstractButton* btn)
{
    QString id = btn->property("id").toString();
    if (id == "widgets") {
        QDesignerFormWindowManagerInterface *formWindowManager = _designer->core()->formWindowManager();
        for (int i=0; i<formWindowManager->formWindowCount(); ++i) {
            QDesignerFormWindowInterface *formWindow = formWindowManager->formWindow(i);
            formWindow->editWidgets();
        }
    }

    if (id == "tabs") {
        _editTabAction->trigger();
    }

    if (id == "buddies") {
        _editBuddies->trigger();
    }
}

bool EmbeddedDesignerForm::saveFile()
{
    QFile file(_fileName);
    if (file.open(QIODevice::WriteOnly | QIODevice::Text)){
        file.write(_form->contents().toUtf8());
        file.close();
        _modified = false;
        return true;
    }
    qDebug() << "cannot save file" << _fileName;
    return false;
}

void EmbeddedDesignerForm::onFormChanged()
{
    qDebug() << "Changed";
    _modified = true;
    emit fileChanged();
}

void EmbeddedDesignerForm::closeEvent(QCloseEvent *event)
{
    if (_modified){
        QMessageBox::StandardButton res = QMessageBox::question(this, "Close editor",
                        QString("The document \"%1\" has unsaved changes. Would you like to save them?").arg(_fileName),
                        QMessageBox::Yes | QMessageBox::No | QMessageBox::Cancel);
        if ( res == QMessageBox::Ok){
            saveFile();
        }
        if (res == QMessageBox::Cancel){
            event->ignore();
        }
    }
}
