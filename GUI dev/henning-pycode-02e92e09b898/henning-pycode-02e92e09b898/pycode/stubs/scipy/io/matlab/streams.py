# encoding: utf-8
# module scipy.io.matlab.streams
# from /usr/lib/python2.7/dist-packages/scipy/io/matlab/streams.so by generator 1.96
# no doc

# imports
import __builtin__ as __builtins__  # <module '__builtin__' (built-in)>
import sys as sys  # <module 'sys' (built-in)>

# functions


def make_stream(*args, **kwargs):  # real signature unknown
    """ Make stream of correct type for file-like `fobj` """
    pass


def _read_into(*args, **kwargs):  # real signature unknown
    pass


def _read_string(*args, **kwargs):  # real signature unknown
    pass


# classes

class GenericStream(object):
    # no doc

    def read(self, *args, **kwargs):  # real signature unknown
        pass

    def seek(self, *args, **kwargs):  # real signature unknown
        pass

    def tell(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    __pyx_vtable__ = None  # (!) real value is ''


class cStringStream(GenericStream):
    # no doc

    def seek(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    __pyx_vtable__ = None  # (!) real value is ''


class FileStream(GenericStream):
    # no doc

    def seek(self, *args, **kwargs):  # real signature unknown
        pass

    def tell(self, *args, **kwargs):  # real signature unknown
        pass

    def __del__(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    __pyx_vtable__ = None  # (!) real value is ''


# variables with complex values

__pyx_capi__ = {
    'make_stream': None,  # (!) real value is ''
}

__test__ = {
    u'make_stream (line 203)': ' Make stream of correct type for file-like `fobj`\n    ',
}
