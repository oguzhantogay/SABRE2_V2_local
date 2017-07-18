/********************************************************************************
** Form generated from reading UI file 'customwidget.ui'
**
** Created by: Qt User Interface Compiler version 5.9.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_CUSTOMWIDGET_H
#define UI_CUSTOMWIDGET_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>
#include "QtDesigner/QDesignerCustomWidgetCollectionInterface"

QT_BEGIN_NAMESPACE

class Ui_CustomWidget
{
public:
    QWidget *centralWidget;
    QHBoxLayout *horizontalLayout;
    QTextEdit *textEdit;
    CustomWidget *pushButton;
    QPushButton *pushButton_2;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *CustomWidget)
    {
        if (CustomWidget->objectName().isEmpty())
            CustomWidget->setObjectName(QStringLiteral("CustomWidget"));
        CustomWidget->resize(464, 78);
        centralWidget = new QWidget(CustomWidget);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        horizontalLayout = new QHBoxLayout(centralWidget);
        horizontalLayout->setSpacing(6);
        horizontalLayout->setContentsMargins(11, 11, 11, 11);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        textEdit = new QTextEdit(centralWidget);
        textEdit->setObjectName(QStringLiteral("textEdit"));
        textEdit->setMaximumSize(QSize(16777215, 28));

        horizontalLayout->addWidget(textEdit);

        pushButton = new CustomWidget(centralWidget);
        pushButton->setObjectName(QStringLiteral("pushButton"));

        horizontalLayout->addWidget(pushButton);

        pushButton_2 = new QPushButton(centralWidget);
        pushButton_2->setObjectName(QStringLiteral("pushButton_2"));

        horizontalLayout->addWidget(pushButton_2);

        CustomWidget->setCentralWidget(centralWidget);
        mainToolBar = new QToolBar(CustomWidget);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        CustomWidget->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(CustomWidget);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        CustomWidget->setStatusBar(statusBar);

        retranslateUi(CustomWidget);
        QObject::connect(pushButton_2, SIGNAL(clicked()), textEdit, SLOT(clear()));

        QMetaObject::connectSlotsByName(CustomWidget);
    } // setupUi

    void retranslateUi(QMainWindow *CustomWidget)
    {
        CustomWidget->setWindowTitle(QApplication::translate("CustomWidget", "CustomWidget", Q_NULLPTR));
        pushButton->setText(QApplication::translate("CustomWidget", "Press Me", Q_NULLPTR));
        pushButton_2->setText(QApplication::translate("CustomWidget", "Clear", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class CustomWidget: public Ui_CustomWidget {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CUSTOMWIDGET_H
