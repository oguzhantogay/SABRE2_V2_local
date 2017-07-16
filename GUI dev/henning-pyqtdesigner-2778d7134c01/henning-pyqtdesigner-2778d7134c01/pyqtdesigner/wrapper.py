# -*- coding: utf-8 -*-
import ctypes

import sip
from PyQt4.QtCore import QObject, QMetaObject, pyqtSignal, Q_ARG


def cfunc(func, *args, **kwargs):
    result_type = kwargs.pop("type", None)
    if kwargs:
        raise TypeError("Unknown keyword argument(s): %r" % kwargs)
    ptr = func(*args)
    if isinstance(ptr, sip.voidptr):
        ptr = int(ptr)
    if result_type is not None:
        return sip.wrapinstance(ptr, result_type)
    return ptr


def new_instance(mo, *args, **properties):
    obj = None
    for mi in range(mo.constructorCount()):
        mm = mo.constructor(mi)
        names = [str(n) for n in mm.parameterNames()]
        types = [str(t).rstrip("&*") for t in mm.parameterTypes()]
        param_types = zip(names, types)
        if len(param_types) != len(args):
            continue
        arg_types = []
        for i, (pn, pt) in enumerate(param_types):
            a = args[i]
            classes = [type(a)]
            at = None
            for cls in classes:
                if cls.__name__ == pt:
                    at = cls
                    break
                for base in cls.__bases__:
                    if base not in classes:
                        classes.append(base)
            if not at:
                break
            arg_types.append(at)
        if len(arg_types) == len(args):
            obj = mo.newInstance(*[Q_ARG(at, an)
                                 for (at, an) in zip(arg_types, args)])
            obj.pyqtConfigure(**properties)
            if obj is not None:
                break

    if not obj:
        raise TypeError(
            "Could not find matching constructor for %s" % class_name)
    return obj


class LibWrapper(object):

    def __init__(self, filename):
        self._lib = ctypes.cdll.LoadLibrary(filename)
        self._instance = cfunc(self._lib.init, type=QObject)

    def __getattr__(self, name):
        mo = cfunc(self._instance.metaObjectByName, name, type=QMetaObject)
        if mo is not None:
            cls = lambda * \
                args, **properties: new_instance(mo, *args, **properties)
            setattr(self, name, cls)
            return cls
        else:
            obj = cfunc(self._instance.classByName, name, type=QObject)
            if obj is not None:
                setattr(self, name, obj)
                return obj
        raise AttributeError(name)
