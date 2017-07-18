/********************************************************************************
** Form generated from reading UI file 'mywidget.ui'
**
** Created by: Qt User Interface Compiler version 5.9.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MYWIDGET_H
#define UI_MYWIDGET_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MyWidget
{
public:
    QHBoxLayout *horizontalLayout;
    QTextEdit *textEdit;
    QPushButton *pushButton;
    QPushButton *pushButton_2;

    void setupUi(QWidget *MyWidget)
    {
        if (MyWidget->objectName().isEmpty())
            MyWidget->setObjectName(QStringLiteral("MyWidget"));
        MyWidget->resize(477, 89);
        horizontalLayout = new QHBoxLayout(MyWidget);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        textEdit = new QTextEdit(MyWidget);
        textEdit->setObjectName(QStringLiteral("textEdit"));

        horizontalLayout->addWidget(textEdit);

        pushButton = new QPushButton(MyWidget);
        pushButton->setObjectName(QStringLiteral("pushButton"));

        horizontalLayout->addWidget(pushButton);

        pushButton_2 = new QPushButton(MyWidget);
        pushButton_2->setObjectName(QStringLiteral("pushButton_2"));

        horizontalLayout->addWidget(pushButton_2);


        retranslateUi(MyWidget);
        QObject::connect(pushButton_2, SIGNAL(clicked()), textEdit, SLOT(clear()));

        QMetaObject::connectSlotsByName(MyWidget);
    } // setupUi

    void retranslateUi(QWidget *MyWidget)
    {
        MyWidget->setWindowTitle(QApplication::translate("MyWidget", "Form", Q_NULLPTR));
        pushButton->setText(QApplication::translate("MyWidget", "PressMe", Q_NULLPTR));
        pushButton_2->setText(QApplication::translate("MyWidget", "Clear", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class MyWidget: public Ui_MyWidget {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MYWIDGET_H
