#include "pyqtwrapper.h"
#include <QApplication>
#include <QVariant>
#include <QPushButton>
#include <qdebug.h>


PyQtWrapper *PyQtWrapper::_instance = 0;


PyQtWrapper::PyQtWrapper(QObject *parent) :
    QObject(parent)
{
    PyQtWrapper::_instance = this;
    setObjectName("PyQtWrapper");
    QApplication::instance()->setProperty("pyqtwrapper",
                                          qVariantFromValue((QObject*)this));
    //registerObject(this);
}


void PyQtWrapper::deleteLater() {
    QApplication::instance()->setProperty("pyqtwrapper",
                                          qVariantFromValue(NULL));
}



void* PyQtWrapper::metaObjectByName(const QString &name) {
    return (void*)classes[name];
}

QObject* PyQtWrapper::objectByName(const QString &name) {
    return (QObject*)objects[name];
}


QStringList PyQtWrapper::availableClasses() {
    return classes.keys();
}


QStringList PyQtWrapper::availableObjects() {
    return objects.keys();
}


void PyQtWrapper::registerMetaObject(const QMetaObject &mo) {
    classes[mo.className()] = &mo;
}


void PyQtWrapper::registerObject(const QObject &obj) {
    //connect(obj, SIGNAL(destroyed()), unregister_objec);
    objects[obj.objectName()] = &obj;
}

