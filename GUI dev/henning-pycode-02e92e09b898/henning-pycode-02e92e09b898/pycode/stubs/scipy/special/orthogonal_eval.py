# encoding: utf-8
# module scipy.special.orthogonal_eval
# from /usr/lib/python2.7/dist-packages/scipy/special/orthogonal_eval.so
# by generator 1.96
"""
Evaluate orthogonal polynomial values using recurrence relations.

References
----------

.. [AMS55] Abramowitz & Stegun, Section 22.5.

.. [MH] Mason & Handscombe, Chebyshev Polynomials, CRC Press (2003).
"""

# imports
import numpy as np  # /usr/lib/pymodules/python2.7/numpy/__init__.pyc
import __builtin__ as __builtins__  # <module '__builtin__' (built-in)>

# functions


def binom(*args, **kwargs):  # real signature unknown
    """ Binomial coefficient """
    pass


def eval_chebyc(*args, **kwargs):  # real signature unknown
    """ Evaluate Chebyshev C polynomial at a point. """
    pass


def eval_chebys(*args, **kwargs):  # real signature unknown
    """ Evaluate Chebyshev S polynomial at a point. """
    pass


def eval_chebyt(*args, **kwargs):  # real signature unknown
    """
    Evaluate Chebyshev T polynomial at a point.
    
        This routine is numerically stable for `x` in ``[-1, 1]`` at least
        up to order ``10000``.
    """
    pass


def eval_chebyu(*args, **kwargs):  # real signature unknown
    """ Evaluate Chebyshev U polynomial at a point. """
    pass


def eval_gegenbauer(*args, **kwargs):  # real signature unknown
    """ Evaluate Gegenbauer polynomial at a point. """
    pass


def eval_genlaguerre(*args, **kwargs):  # real signature unknown
    """ Evaluate generalized Laguerre polynomial at a point. """
    pass


def eval_hermite(*args, **kwargs):  # real signature unknown
    """ Evaluate Hermite polynomial at a point. """
    pass


def eval_hermitenorm(*args, **kwargs):  # real signature unknown
    """ Evaluate normalized Hermite polynomial at a point. """
    pass


def eval_jacobi(*args, **kwargs):  # real signature unknown
    """ Evaluate Jacobi polynomial at a point. """
    pass


def eval_laguerre(*args, **kwargs):  # real signature unknown
    """ Evaluate Laguerre polynomial at a point. """
    pass


def eval_legendre(*args, **kwargs):  # real signature unknown
    """ Evaluate Legendre polynomial at a point. """
    pass


def eval_sh_chebyt(*args, **kwargs):  # real signature unknown
    """ Evaluate shifted Chebyshev T polynomial at a point. """
    pass


def eval_sh_chebyu(*args, **kwargs):  # real signature unknown
    """ Evaluate shifted Chebyshev U polynomial at a point. """
    pass


def eval_sh_jacobi(*args, **kwargs):  # real signature unknown
    """ Evaluate shifted Jacobi polynomial at a point. """
    pass


def eval_sh_legendre(*args, **kwargs):  # real signature unknown
    """ Evaluate shifted Legendre polynomial at a point. """
    pass


def exp(x, out=None):  # real signature unknown; restored from __doc__
    """
    exp(x[, out])
    
    Calculate the exponential of all elements in the input array.
    
    Parameters
    ----------
    x : array_like
        Input values.
    
    Returns
    -------
    out : ndarray
        Output array, element-wise exponential of `x`.
    
    See Also
    --------
    expm1 : Calculate ``exp(x) - 1`` for all elements in the array.
    exp2  : Calculate ``2**x`` for all elements in the array.
    
    Notes
    -----
    The irrational number ``e`` is also known as Euler's number.  It is
    approximately 2.718281, and is the base of the natural logarithm,
    ``ln`` (this means that, if :math:`x = \ln y = \log_e y`,
    then :math:`e^x = y`. For real input, ``exp(x)`` is always positive.
    
    For complex arguments, ``x = a + ib``, we can write
    :math:`e^x = e^a e^{ib}`.  The first term, :math:`e^a`, is already
    known (it is the real argument, described above).  The second term,
    :math:`e^{ib}`, is :math:`\cos b + i \sin b`, a function with magnitude
    1 and a periodic phase.
    
    References
    ----------
    .. [1] Wikipedia, "Exponential function",
           http://en.wikipedia.org/wiki/Exponential_function
    .. [2] M. Abramovitz and I. A. Stegun, "Handbook of Mathematical Functions
           with Formulas, Graphs, and Mathematical Tables," Dover, 1964, p. 69,
           http://www.math.sfu.ca/~cbm/aands/page_69.htm
    
    Examples
    --------
    Plot the magnitude and phase of ``exp(x)`` in the complex plane:
    
    >>> import matplotlib.pyplot as plt
    
    >>> x = np.linspace(-2*np.pi, 2*np.pi, 100)
    >>> xx = x + 1j * x[:, np.newaxis] # a + ib over complex plane
    >>> out = np.exp(xx)
    
    >>> plt.subplot(121)
    >>> plt.imshow(np.abs(out),
    ...            extent=[-2*np.pi, 2*np.pi, -2*np.pi, 2*np.pi])
    >>> plt.title('Magnitude of exp(x)')
    
    >>> plt.subplot(122)
    >>> plt.imshow(np.angle(out),
    ...            extent=[-2*np.pi, 2*np.pi, -2*np.pi, 2*np.pi])
    >>> plt.title('Phase (angle) of exp(x)')
    >>> plt.show()
    """
    pass


def gamma(x, out=None):  # real signature unknown; restored from __doc__
    """
    gamma(x[, out])
    
    y=gamma(z) returns the gamma function of the argument.  The gamma
    function is often referred to as the generalized factorial since 
    z*gamma(z) = gamma(z+1) and gamma(n+1) = n! for natural number n.
    """
    pass


def gammaln(x, out=None):  # real signature unknown; restored from __doc__
    """
    gammaln(x[, out])
    
    y=gammaln(z) returns the base e logarithm of the absolute value of the
    gamma function of z: ln(|gamma(z)|)
    """
    pass


# real signature unknown; restored from __doc__
def hyp1f1(x1, x2, x3, out=None):
    """
    hyp1f1(x1, x2, x3[, out])
    
    y=hyp1f1(a,b,x) returns the confluent hypergeometeric function
    ( 1F1(a,b;x) ) evaluated at the values a, b, and x.
    """
    pass


# real signature unknown; restored from __doc__
def hyp2f1(x1, x2, x3, x4, out=None):
    """
    hyp2f1(x1, x2, x3, x4[, out])
    
    y=hyp2f1(a,b,c,z) returns the gauss hypergeometric function
    ( 2F1(a,b;c;z) ).
    """
    pass


def _eval_chebyt(*args, **kwargs):  # real signature unknown
    """ (x1, x2[, out]) """
    pass


# no classes
# variables with complex values

__test__ = {
    u'binom (line 96)': 'Binomial coefficient',
    u'eval_chebyc (line 145)': 'Evaluate Chebyshev C polynomial at a point.',
    u'eval_chebys (line 141)': 'Evaluate Chebyshev S polynomial at a point.',
    u'eval_chebyt (line 123)': '\n    Evaluate Chebyshev T polynomial at a point.\n\n    This routine is numerically stable for `x` in ``[-1, 1]`` at least\n    up to order ``10000``.\n    ',
    u'eval_chebyu (line 132)': 'Evaluate Chebyshev U polynomial at a point.',
    u'eval_gegenbauer (line 114)': 'Evaluate Gegenbauer polynomial at a point.',
    u'eval_genlaguerre (line 170)': 'Evaluate generalized Laguerre polynomial at a point.',
    u'eval_hermite (line 182)': 'Evaluate Hermite polynomial at a point.',
    u'eval_hermitenorm (line 204)': 'Evaluate normalized Hermite polynomial at a point.',
    u'eval_jacobi (line 100)': 'Evaluate Jacobi polynomial at a point.',
    u'eval_laguerre (line 178)': 'Evaluate Laguerre polynomial at a point.',
    u'eval_legendre (line 157)': 'Evaluate Legendre polynomial at a point.',
    u'eval_sh_chebyt (line 149)': 'Evaluate shifted Chebyshev T polynomial at a point.',
    u'eval_sh_chebyu (line 153)': 'Evaluate shifted Chebyshev U polynomial at a point.',
    u'eval_sh_jacobi (line 109)': 'Evaluate shifted Jacobi polynomial at a point.',
    u'eval_sh_legendre (line 166)': 'Evaluate shifted Legendre polynomial at a point.',
}
