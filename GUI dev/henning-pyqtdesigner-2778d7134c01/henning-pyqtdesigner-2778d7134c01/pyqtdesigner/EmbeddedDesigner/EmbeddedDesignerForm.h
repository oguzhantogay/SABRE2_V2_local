#ifndef EMBEDEDDESIGNERFORM_H
#define EMBEDEDDESIGNERFORM_H

#include <QWidget>
#include <QAbstractButton>

namespace Ui {
    class EmbeddedDesignerForm;
}

namespace qdesigner_internal {
    class QDesignerIntegration;
}
class QDesignerFormWindowInterface;
class EmbeddedDesignerForm : public QWidget
{
    Q_OBJECT

public:
    explicit EmbeddedDesignerForm(QWidget *parent = 0);
    ~EmbeddedDesignerForm();
protected:
    void showEvent(QShowEvent *);
    void closeEvent(QCloseEvent *);
    bool loadFile(const QString & fileName);
    bool saveFile();
private:
    Ui::EmbeddedDesignerForm *ui;
    qdesigner_internal::QDesignerIntegration *_designer;
    QAction *_editTabAction;
    QAction *_editBuddies;
    bool _modified;
    QString _fileName;
    QDesignerFormWindowInterface * _form;

signals:
    void fileChanged();
private slots:
    void onEditSwithPressed(QAbstractButton*);
    void onFormChanged();
};

#endif // EMBEDEDDESIGNERFORM_H
