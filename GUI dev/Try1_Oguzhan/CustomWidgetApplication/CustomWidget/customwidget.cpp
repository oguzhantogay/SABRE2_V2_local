#include "customwidget.h"
#include "ui_customwidget.h"

CustomWidget::CustomWidget(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::CustomWidget)
{
    ui->setupUi(this);
}

CustomWidget::~CustomWidget()
{
    delete ui;
}

void CustomWidget::on_pushButton_clicked()
{
 ui->textEdit->setText("Hello");
}
