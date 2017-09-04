#ifndef CUSTOMWIDGET_H
#define CUSTOMWIDGET_H

#include <QMainWindow>

namespace Ui {
class CustomWidget;
}

class CustomWidget : public QMainWindow
{
    Q_OBJECT

public:
    explicit CustomWidget(QWidget *parent = 0);
    ~CustomWidget();

private slots:
    void on_pushButton_clicked();

private:
    Ui::CustomWidget *ui;
};

#endif // CUSTOMWIDGET_H
