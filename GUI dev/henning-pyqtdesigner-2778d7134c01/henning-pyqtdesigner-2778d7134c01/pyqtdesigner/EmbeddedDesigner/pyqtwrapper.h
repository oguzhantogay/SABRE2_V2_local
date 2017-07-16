#ifndef PYQTWRAPPER_H
#define PYQTWRAPPER_H

#include <QObject>
#include <QMetaObject>
#include <QMap>
#include <QStringList>

#define REGISTER_CLASS(cls) PyQtWrapper::instance()->registerMetaObject(cls::staticMetaObject);
#define REGISTER_INSTANCE(obj) PyQtWrapper::instance()->registerObject(obj);


class PyQtWrapper : public QObject
{
    Q_OBJECT

public:
    explicit PyQtWrapper(QObject *parent = 0);
    static PyQtWrapper *instance();

public slots:
    void deleteLater();
    void* metaObjectByName(const QString &name);
    QObject* objectByName(const QString &name);
    QStringList availableClasses();
    QStringList availableObjects();
    void registerMetaObject(const QMetaObject &mo);
    void registerObject(const QObject &obj);

private:
    static PyQtWrapper *_instance;
    QMap<QString,const QMetaObject*> classes;
    QMap<QString,const QObject*> objects;
};


#endif // PYQTWRAPPER_H
