#ifndef DENEME_H
#define DENEME_H

#include <QMainWindow>

namespace Ui {
class Deneme;
}

class Deneme : public QMainWindow
{
    Q_OBJECT

public:
    explicit Deneme(QWidget *parent = 0);
    ~Deneme();

private:
    Ui::Deneme *ui;
};

#endif // DENEME_H
