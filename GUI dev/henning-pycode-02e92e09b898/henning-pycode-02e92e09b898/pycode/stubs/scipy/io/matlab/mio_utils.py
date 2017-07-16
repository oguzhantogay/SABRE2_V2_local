# encoding: utf-8
# module scipy.io.matlab.mio_utils
# from /usr/lib/python2.7/dist-packages/scipy/io/matlab/mio_utils.so by
# generator 1.96
""" Utilities for generic processing of return arrays from read """

# imports
import __builtin__ as __builtins__  # <module '__builtin__' (built-in)>
import numpy as np  # /usr/lib/pymodules/python2.7/numpy/__init__.pyc

# functions


def chars_to_strings(*args, **kwargs):  # real signature unknown
    """
    Convert final axis of char array to strings
    
        Parameters
        ----------
        in_arr : array
           dtype of 'U1'
           
        Returns
        -------
        str_arr : array
           dtype of 'UN' where N is the length of the last dimension of
           ``arr``
    """
    pass


def cproduct(*args, **kwargs):  # real signature unknown
    pass


def squeeze_element(*args, **kwargs):  # real signature unknown
    """
    Return squeezed element
    
        The returned object may not be an ndarray - for example if we do
        ``arr.item`` to return a ``mat_struct`` object from a struct array
    """
    pass


# no classes
# variables with complex values

__test__ = {
    u'chars_to_strings (line 30)': " Convert final axis of char array to strings\n\n    Parameters\n    ----------\n    in_arr : array\n       dtype of 'U1'\n       \n    Returns\n    -------\n    str_arr : array\n       dtype of 'UN' where N is the length of the last dimension of\n       ``arr``\n    ",
    u'squeeze_element (line 17)': ' Return squeezed element\n\n    The returned object may not be an ndarray - for example if we do\n    ``arr.item`` to return a ``mat_struct`` object from a struct array ',
}
