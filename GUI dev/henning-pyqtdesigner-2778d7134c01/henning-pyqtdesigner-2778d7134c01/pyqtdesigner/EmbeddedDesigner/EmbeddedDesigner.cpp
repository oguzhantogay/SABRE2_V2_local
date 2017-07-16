#include <QApplication>
#include "EmbeddedDesigner.h"
#include "pyqtwrapper.h"


EmbeddedDesigner::EmbeddedDesigner(QWidget* parent): EmbeddedDesignerForm(parent)
{
    //load("/home/jes/tmp/testprj/Project/NewProject.ui");
    connect(this, SIGNAL(fileChanged()), SLOT(onFileChanged()));
}

EmbeddedDesigner::~EmbeddedDesigner()
{

}

bool EmbeddedDesigner::load(const QString & fileName)
{
    return loadFile(fileName);
}

bool EmbeddedDesigner::save()
{
    return saveFile();
}

void EmbeddedDesigner::onFileChanged()
{
    emit changed();
}


extern "C"
{

   void *init() {
     PyQtWrapper *wrapper = new PyQtWrapper(QApplication::instance());
     wrapper->registerMetaObject(EmbeddedDesigner::staticMetaObject);
     return (void*)wrapper;
   }

}
