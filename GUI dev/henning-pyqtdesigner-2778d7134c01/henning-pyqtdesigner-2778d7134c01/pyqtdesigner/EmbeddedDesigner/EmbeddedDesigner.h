#ifndef EMBEDEDDESIGNER_H
#define EMBEDEDDESIGNER_H

#include "EmbeddedDesigner_global.h"
#include "EmbeddedDesignerForm.h"

class EMBEDEDDESIGNERSHARED_EXPORT EmbeddedDesigner: public EmbeddedDesignerForm {
    Q_OBJECT
public:
    Q_INVOKABLE explicit EmbeddedDesigner(QWidget* parent = NULL);
    virtual ~EmbeddedDesigner();
public slots:
    bool load(const QString & fileName);
    bool save();
signals:
    void changed();
private slots:
    void onFileChanged();
};


extern "C"
{
  void *init();
}

#endif // EMBEDEDDESIGNER_H
