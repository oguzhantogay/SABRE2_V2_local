#include "deneme.h"
#include "ui_deneme.h"

Deneme::Deneme(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Deneme)
{
    ui->setupUi(this);
}

Deneme::~Deneme()
{
    delete ui;
}
