# -*- coding: utf-8 -*-
from threading import Thread

_async_method = None


def set_async_method(handler):
    global _async_method
    _async_method = handler


def sync_call(func, *args, **kwargs):
    callback = kwargs.pop("callback")
    result = func(*args, **kwargs)
    callback(result)


class _AsyncThread(Thread):

    def run(self):
        kwargs = self.kwargs
        callback = kwargs.pop("callback")
        func = self.args[0]
        args = self.args[1:]
        result = func(*args, **kwargs)
        callback(result)


def threaded_call(func, *args, **kwargs):
    t = _AsyncThread(args=(func,) + args, kwargs=kwargs)
    t.start()


def async(func):
    def wrapper(*args, **kwargs):
        _async_method(func, *args, **kwargs)
    return wrapper


class ServiceRoot(object):
    pass


root = ServiceRoot()


def register(func):
    root.__dict__[func.__name__] = func
    return func


def enable_ipc():
    from asyncipc import IpcServer, Connection, IpcClient

    def create_server():
        server = IpcServer(root)
        return server

    con = Connection(create_server)
    con.start()

    return IpcClient(con)
