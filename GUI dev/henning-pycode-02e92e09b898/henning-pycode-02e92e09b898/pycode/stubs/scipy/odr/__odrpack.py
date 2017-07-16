# encoding: utf-8
# module scipy.odr.__odrpack
# from /usr/lib/python2.7/dist-packages/scipy/odr/__odrpack.so by generator 1.96
# no doc
# no imports

# functions

# real signature unknown; restored from __doc__


def odr(fcn, beta0, y, x, we=None, wd=None, fjacb=None, fjacd=None, extra_args=None, ifixx=None, ifixb=None, job=0, iprint=0, errfile=None, rptfile=None, ndigit=0, taufac=0.0, sstol=-1.0, partol=-1.0, maxit=-1, stpb=None, stpd=None, sclb=None, scld=None, work=None, iwork=None, full_output=0):
    """
    odr(fcn, beta0, y, x,
    we=None, wd=None, fjacb=None, fjacd=None,
    extra_args=None, ifixx=None, ifixb=None, job=0, iprint=0,
    errfile=None, rptfile=None, ndigit=0,
    taufac=0.0, sstol=-1.0, partol=-1.0,
    maxit=-1, stpb=None, stpd=None,
    sclb=None, scld=None, work=None, iwork=None,
    full_output=0)
    """
    pass


# classes

class odr_error(Exception):
    # no doc

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class odr_stop(Exception):
    # no doc

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default
