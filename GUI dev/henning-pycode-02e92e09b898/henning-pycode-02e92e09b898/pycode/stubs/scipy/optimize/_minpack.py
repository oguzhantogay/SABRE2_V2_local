# encoding: utf-8
# module scipy.optimize._minpack
# from /usr/lib/python2.7/dist-packages/scipy/optimize/_minpack.so by generator 1.96
# no doc
# no imports

# Variables with simple values

__version__ = ' 1.10 '

# functions

# real signature unknown; restored from __doc__


def _chkder(m, n, x, fvec, fjac, ldfjac, xp, fvecp, mode, err):
    """ _chkder(m,n,x,fvec,fjac,ldfjac,xp,fvecp,mode,err) """
    pass


# real signature unknown; restored from __doc__
def _hybrd(fun, x0, args, full_output, xtol, maxfev, ml, mu, epsfcn, factor, diag):
    """ [x,infodict,info] = _hybrd(fun, x0, args, full_output, xtol, maxfev, ml, mu, epsfcn, factor, diag) """
    pass


# real signature unknown; restored from __doc__
def _hybrj(fun, Dfun, x0, args, full_output, col_deriv, xtol, maxfev, factor, diag):
    """ [x,infodict,info] = _hybrj(fun, Dfun, x0, args, full_output, col_deriv, xtol, maxfev, factor, diag) """
    pass


# real signature unknown; restored from __doc__
def _lmder(fun, Dfun, x0, args, full_output, col_deriv, ftol, xtol, gtol, maxfev, factor, diag):
    """ [x,infodict,info] = _lmder(fun, Dfun, x0, args, full_output, col_deriv, ftol, xtol, gtol, maxfev, factor, diag) """
    pass


# real signature unknown; restored from __doc__
def _lmdif(fun, x0, args, full_output, ftol, xtol, gtol, maxfev, epsfcn, factor, diag):
    """ [x,infodict,info] = _lmdif(fun, x0, args, full_output, ftol, xtol, gtol, maxfev, epsfcn, factor, diag) """
    pass


# classes

class error(Exception):
    # no doc

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default
