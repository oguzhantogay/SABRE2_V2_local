#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QtGui>
#include <QtCore>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    Statlabel = new QLabel(this);
    StatProgress = new QProgressBar(this);

    ui->statusBar->addPermanentWidget(Statlabel);
    ui->statusBar->addPermanentWidget(StatProgress,1);
    StatProgress->setTextVisible(false);
    Statlabel->setText("hello");
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_actionDo_Something_triggered()
{
    ui->statusBar->showMessage("Hello");
    StatProgress->setValue(45);
}
