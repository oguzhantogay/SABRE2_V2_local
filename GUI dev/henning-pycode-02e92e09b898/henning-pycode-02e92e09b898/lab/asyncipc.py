# -*- coding: utf-8 -*-
import atexit
from multiprocessing import Process, Queue
from threading import Thread


class Server(object):

    def __init__(self):
        pass

    def received(self, data):
        print "received", len(data), "bytes"
        return data


class Connection(object):

    def __init__(self, server_factory):
        self.server_factory = server_factory
        self.input_queue = Queue()
        self.output_queue = Queue()

    def _listen(self, server_factory, input_queue, output_queue):
        server = server_factory()
        while True:
            item = input_queue.get()
            if item is None:
                output_queue.put(None)
                break
            result = server.received(item)
            output_queue.put(result)

    def start(self):
        self.proc = Process(target=self._listen, args=(
            self.server_factory, self.input_queue, self.output_queue))
        self.proc.start()


class Client(object):

    def __init__(self, connection):
        self._connection = connection
        atexit.register(self._exit)
        self._callback_queue = []
        self._callback_thread = Thread(target=self._watch_results)
        self._callback_thread.setDaemon(True)
        self._callback_thread.start()

    def _exit(self):
        self._call(None, None)

    def _watch_results(self):
        while True:
            item = self._connection.output_queue.get()
            if item is None:
                break
            callback = self._callback_queue.pop()
            callback(item)

    def _call(self, data, callback):
        self._connection.input_queue.put(data)
        self._callback_queue.insert(0, callback)

    def call(self, data, callback):
        self._call(data, callback)


class IpcCallMixIn(object):

    def _decode_call(self, data):
        (msg, args, kwargs) = data
        return (msg, args, kwargs)

    def _encode_result(self, error, result):
        return (error, result)

    def _encode_call(self, msg, args, kwargs):
        info = (msg, args, kwargs)
        data = info
        return data

    def _decode_result(self, data):
        error, value = data
        if error:
            raise error
        return value


class IpcServer(Server, IpcCallMixIn):

    def __init__(self, root=None):
        Server.__init__(self)
        if root is None:
            root = self
        self._root = root

    def received(self, data):
        msg, args, kwargs = self._decode_call(data)
        method = getattr(self._root, msg)
        try:
            result = method(*args, **kwargs)
            error = None
        except Exception, error:
            result = None
        return self._encode_result(error, result)


class _ResultCallback(object):

    def __init__(self, client, callback):
        self.client = client
        self.callback = callback

    def __call__(self, data):
        result = self.client._decode_result(data)
        return self.callback(result)


class IpcClient(Client, IpcCallMixIn):

    def call(self, msg, *args, **kwargs):
        callback = kwargs.pop("callback")
        data = self._encode_call(msg, args, kwargs)
        return self._call(data, callback=_ResultCallback(self, callback))

    def __getattr__(self, name):
        method = lambda *args, **kwargs: self.call(name, *args, **kwargs)
        return method


if __name__ == "__main__":
    def cb(result):
        print "got", repr(result)

    def create_server():
        class Root(object):

            def foo(self):
                return "Foo!"

            def bar(self, count=1):
                return "BAR" * count
        server = IpcServer(Root())
        return server

    con = Connection(create_server)
    con.start()
    client = IpcClient(con)
    client.foo(callback=cb)
    client.bar(2, callback=cb)

    import time
    time.sleep(1)
    print "done"
