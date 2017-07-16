# -*- coding: utf-8 -*-
import sys
import socket
import exceptions
import asyncore
import asynchat
try:
    import cPickle as pickle
except ImportError:
    import pickle


DEFAULT_PORT = 8748
PACKET_SIZE = 8192


class NetworkError (exceptions.StandardError):
    pass


class State(object):
    pass


class AsyncServerChannel(asynchat.async_chat):

    STATE_LENGTH = State()
    STATE_PACKET = State()

    def __init__(self, conn, addr, callback):
        self.addr = addr
        asynchat.async_chat.__init__(self, conn)
        self.pstate = self.STATE_LENGTH
        self.set_terminator(8)
        self._receive_buffer = []
        self.callback = callback

    def log(self, *items):
        print "log", self.__class__, items

    def collect_incoming_data(self, data):
        self._receive_buffer.append(data)

    def found_terminator(self):
        self._receive_buffer, data = [], ''.join(self._receive_buffer)

        if self.pstate is self.STATE_LENGTH:
            packet_length = int(data, 16)
            self.set_terminator(packet_length)
            self.pstate = self.STATE_PACKET
        else:
            self.set_terminator(8)
            self.pstate = self.STATE_LENGTH

            result = self.callback(self.addr, data) or ""

            self.push(('%08x' % len(result)) + result)


class AsyncServer(asyncore.dispatcher):

    def __init__(self, listen_addres=('', DEFAULT_PORT), handler_factory=AsyncServerChannel):
        asyncore.dispatcher.__init__(self)
        self._handler_factory = handler_factory
        self.create_socket(socket.AF_INET, socket.SOCK_STREAM)
        self.set_reuse_addr()
        self.bind(listen_addres)
        self.listen(128)

    def handle_accept(self):
        conn, addr = self.accept()
        print "Got connect", conn, addr
        self._handler_factory(conn, addr, self.on_received)

    def on_received(self, addr, data):
        return ''


class AsyncClient(asynchat.async_chat):

    STATE_LENGTH = State()
    STATE_PACKET = State()

    def __init__(self, address=('', DEFAULT_PORT), keep_alive=False):

        asynchat.async_chat.__init__(self)

        if isinstance(address, basestring):
            family = socket.AF_UNIX
        else:
            family = socket.AF_INET

        self.create_socket(family, socket.SOCK_STREAM)
        self._address = address
        self._request_fifo = []
        self._receive_buffer = []
        self._pstate = self.STATE_LENGTH
        self.set_terminator(8)
        self._connected = False
        self._keep_alive = keep_alive
        self.connect(self._address)

    def log(self, *items):
        print "log ", self.__class__, items

    def handle_connect(self):
        self._connected = True

    def close(self):
        self._connected = False
        self.flush_pending_requests('lost connection to rpc server')
        asynchat.async_chat.close(self)

    def flush_pending_requests(self, why):
        f = self._request_fifo
        while len(f):
            callback = f.pop(0)
            callback(why, None)

    def collect_incoming_data(self, data):
        print "incoming", len(data)
        self._receive_buffer.append(data)

    def found_terminator(self):
        self._receive_buffer, data = [], ''.join(self._receive_buffer)

        if self._pstate is self.STATE_LENGTH:
            packet_length = int(data, 16)
            self.set_terminator(packet_length)
            self._pstate = self.STATE_PACKET
        else:
            if self._keep_alive:
                self.set_terminator(8)
                self._pstate = self.STATE_LENGTH
            callback = self._request_fifo.pop(0)
            callback(data)
            if not self._keep_alive:
                self.close()

    def call(self, packet, callback):
        if not self._connected:
            # might be a unix socket...
            family, type = self.family_and_type
            self.create_socket(family, type)
            self.connect(self._address)
        # push the request out the socket
        self.push('%08x%s' % (len(packet), packet))
        self._request_fifo.append(callback)


class Client(object):

    def __init__(self, address, keep_alive=True):
        self._address = address
        self._socket = None
        self._keep_alive = keep_alive

    def connect(self):
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect(self._address)
        self._socket = s

    def receive_packet(self):
        s = self._socket.recv(8)
        if len(s) != 8:
            raise NetworkError("Could not receive packet")
        packet_len = int(s, 16)
        packet = []
        while packet_len:
            data = self._socket.recv(PACKET_SIZE)
            packet.append(data)
            packet_len = packet_len - len(data)
        return ''.join(packet)

    def send_packet(self, packet):
        self._socket.send('%08x%s' % (len(packet), packet))

    def call(self, data):
        if self._socket is None:
            self.connect()
        self.send_packet(data)
        result = self.receive_packet()
        if not self._keep_alive:
            self._socket.close()
            self._socket = None
        return result


class RpcCallMixIn(object):

    def _decode_call(self, data):
        (msg, args, kwargs) = pickle.loads(data)
        return (msg, args, kwargs)

    def _encode_result(self, error, result):
        return pickle.dumps((error, result), 2)

    def _encode_call(self, msg, args, kwargs):
        info = (msg, args, kwargs)
        data = pickle.dumps(info, 2)
        return data

    def _decode_result(self, data):
        error, value = pickle.loads(data)
        if error:
            raise error
        return value


class RpcServer(AsyncServer, RpcCallMixIn):

    def __init__(self, root=None, listen_address=('', DEFAULT_PORT), handler_factory=AsyncServerChannel):
        if root is None:
            root = self
        self._root = root
        AsyncServer.__init__(self, listen_address, handler_factory)

    def call(self, name, *args, **kwargs):
        method = getattr(self._root, name)
        return method(*args, **kwargs)

    def on_received(self, addr, data):
        (msg, args, kwargs) = self._decode_call(data)
        try:
            result = self.call(msg, *args, **kwargs)
            error = None
        except Exception, exc:
            error = exc
            result = None
        return self._encode_result(error, result)


class RpcClient(Client, RpcCallMixIn):

    def call(self, msg, *args, **kwargs):
        send_data = self._encode_call(msg, args, kwargs)
        receive_data = super(RpcClient, self).call(send_data)
        return self._decode_result(receive_data)

    def __getattr__(self, name):
        wrapper = lambda *args, **kwargs: self.call(name, *args, **kwargs)
        return wrapper


class _ResultCallback(object):

    def __init__(self, client, callback):
        self.client = client
        self.callback = callback

    def __call__(self, data):
        result = self.client._decode_result(data)
        return self.callback(result)


class AsyncRpcClient(AsyncClient, RpcCallMixIn):

    def call(self, msg, *args, **kwargs):
        callback = kwargs.pop("callback")
        packet = self._encode_call(msg, args, kwargs)
        AsyncClient.call(
            self, packet, callback=_ResultCallback(self, callback))

    def __getattr__(self, name):
        wrapper = lambda *args, **kwargs: self.call(name, *args, **kwargs)
        return wrapper


def async_event_loop():
    asyncore.loop()


if __name__ == "__main__":
    def client():
        def cb(result):
            print "got", result
        c = AsyncRpcClient(("localhost", DEFAULT_PORT))
        c.echo("foo", callback=cb)
        c.twice("bar", callback=cb)
        c.twice(2, callback=cb)
        c.error("Error!", callback=cb)
        async_event_loop()

    def server():
        class Service(object):

            def echo(self, val):
                return val

            def twice(self, val):
                return val * 2

            def error(self, msg):
                raise Exception(msg)
        address = ('', DEFAULT_PORT)
        server = RpcServer(root=Service(), listen_address=address)
        print "Server running at", address
        async_event_loop()

    if "-s" in sys.argv:
        server()
    else:
        client()
