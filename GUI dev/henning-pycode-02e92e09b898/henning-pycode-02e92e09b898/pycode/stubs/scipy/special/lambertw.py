# encoding: utf-8
# module scipy.special.lambertw
# from /usr/lib/python2.7/dist-packages/scipy/special/lambertw.so by generator 1.96
# no doc

# imports
import warnings as warnings  # /usr/lib/python2.7/warnings.pyc
import __builtin__ as __builtins__  # <module '__builtin__' (built-in)>

# functions

# real signature unknown; NOTE: unreliably restored from __doc__


def lambertw(z, k=0, tol=1, *args, **kwargs):
    """
    lambertw(z, k=0, tol=1e-8)
    
        Lambert W function.
    
        The Lambert W function `W(z)` is defined as the inverse function
        of :math:`w \exp(w)`. In other words, the value of :math:`W(z)` is
        such that :math:`z = W(z) \exp(W(z))` for any complex number
        :math:`z`.
    
        The Lambert W function is a multivalued function with infinitely
        many branches. Each branch gives a separate solution of the
        equation :math:`w \exp(w)`. Here, the branches are indexed by the
        integer `k`.
        
        Parameters
        ----------
        z : array_like
            Input argument
        k : integer, optional
            Branch index
        tol : float
            Evaluation tolerance
    
        Notes
        -----
        All branches are supported by `lambertw`:
    
        * ``lambertw(z)`` gives the principal solution (branch 0)
        * ``lambertw(z, k)`` gives the solution on branch `k`
    
        The Lambert W function has two partially real branches: the
        principal branch (`k = 0`) is real for real `z > -1/e`, and the
        `k = -1` branch is real for `-1/e < z < 0`. All branches except
        `k = 0` have a logarithmic singularity at `z = 0`.
    
        .. rubric:: Possible issues
        
        The evaluation can become inaccurate very close to the branch point
        at `-1/e`. In some corner cases, :func:`lambertw` might currently
        fail to converge, or can end up on the wrong branch.
    
        .. rubric:: Algorithm
    
        Halley's iteration is used to invert `w \exp(w)`, using a first-order
        asymptotic approximation (`O(\log(w))` or `O(w)`) as the initial
        estimate.
    
        The definition, implementation and choice of branches is based
        on Corless et al, "On the Lambert W function", Adv. Comp. Math. 5
        (1996) 329-359, available online here:
        http://www.apmaths.uwo.ca/~djeffrey/Offprints/W-adv-cm.pdf
        
        TODO: use a series expansion when extremely close to the branch point
        at `-1/e` and make sure that the proper branch is chosen there
    
        Examples
        --------
        The Lambert W function is the inverse of `w \exp(w)`::
    
        >>> from scipy.special import lambertw
        >>> w = lambertw(1)
        >>> w
        0.56714329040978387299996866221035555
        >>> w*exp(w)
        1.0
    
        Any branch gives a valid inverse::
    
        >>> w = lambertw(1, k=3)
        >>> w
        (-2.8535817554090378072068187234910812 +
        17.113535539412145912607826671159289j)
        >>> w*exp(w)
        (1.0 + 3.5075477124212226194278700785075126e-36j)
    
        .. rubric:: Applications to equation-solving
    
        The Lambert W function may be used to solve various kinds of
        equations, such as finding the value of the infinite power
        tower `z^{z^{z^{\ldots}}}`::
    
        >>> def tower(z, n):
        ... if n == 0:
        ... return z
        ... return z ** tower(z, n-1)
        ...
        >>> tower(0.5, 100)
        0.641185744504986
        >>> -lambertw(-log(0.5))/log(0.5)
        0.6411857445049859844862004821148236665628209571911
    
        .. rubric:: Properties
    
        The Lambert W function grows roughly like the natural logarithm
        for large arguments::
    
        >>> lambertw(1000)
        5.2496028524016
        >>> log(1000)
        6.90775527898214
        >>> lambertw(10**100)
        224.843106445119
        >>> log(10**100)
        230.258509299405
        
        The principal branch of the Lambert W function has a rational
        Taylor series expansion around `z = 0`::
        
        >>> nprint(taylor(lambertw, 0, 6), 10)
        [0.0, 1.0, -1.0, 1.5, -2.666666667, 5.208333333, -10.8]
        
        Some special values and limits are::
        
        >>> lambertw(0)
        0.0
        >>> lambertw(1)
        0.567143290409784
        >>> lambertw(e)
        1.0
        >>> lambertw(inf)
        +inf
        >>> lambertw(0, k=-1)
        -inf
        >>> lambertw(0, k=3)
        -inf
        >>> lambertw(inf, k=3)
        (+inf + 18.8495559215388j)
    
        The `k = 0` and `k = -1` branches join at `z = -1/e` where
        `W(z) = -1` for both branches. Since `-1/e` can only be represented
        approximately with mpmath numbers, evaluating the Lambert W function
        at this point only gives `-1` approximately::
    
        >>> lambertw(-1/e, 0)
        -0.999999999999837133022867
        >>> lambertw(-1/e, -1)
        -1.00000000000016286697718
        
        If `-1/e` happens to round in the negative direction, there might be
        a small imaginary part::
        
        >>> lambertw(-1/e)
        (-1.0 + 8.22007971511612e-9j)
    """
    pass


def _lambertw(*args, **kwargs):  # real signature unknown
    """ (x1, x2, x3[, out]) """
    pass


# no classes
# variables with complex values

__test__ = {
    u'lambertw (line 193)': '\n    lambertw(z, k=0, tol=1e-8)\n\n    Lambert W function.\n\n    The Lambert W function `W(z)` is defined as the inverse function\n    of :math:`w \\exp(w)`. In other words, the value of :math:`W(z)` is\n    such that :math:`z = W(z) \\exp(W(z))` for any complex number\n    :math:`z`.\n\n    The Lambert W function is a multivalued function with infinitely\n    many branches. Each branch gives a separate solution of the\n    equation :math:`w \\exp(w)`. Here, the branches are indexed by the\n    integer `k`.\n    \n    Parameters\n    ----------\n    z : array_like\n        Input argument\n    k : integer, optional\n        Branch index\n    tol : float\n        Evaluation tolerance\n\n    Notes\n    -----\n    All branches are supported by `lambertw`:\n\n    * ``lambertw(z)`` gives the principal solution (branch 0)\n    * ``lambertw(z, k)`` gives the solution on branch `k`\n\n    The Lambert W function has two partially real branches: the\n    principal branch (`k = 0`) is real for real `z > -1/e`, and the\n    `k = -1` branch is real for `-1/e < z < 0`. All branches except\n    `k = 0` have a logarithmic singularity at `z = 0`.\n\n    .. rubric:: Possible issues\n    \n    The evaluation can become inaccurate very close to the branch point\n    at `-1/e`. In some corner cases, :func:`lambertw` might currently\n    fail to converge, or can end up on the wrong branch.\n\n    .. rubric:: Algorithm\n\n    Halley\'s iteration is used to invert `w \\exp(w)`, using a first-order\n    asymptotic approximation (`O(\\log(w))` or `O(w)`) as the initial\n    estimate.\n\n    The definition, implementation and choice of branches is based\n    on Corless et al, "On the Lambert W function", Adv. Comp. Math. 5\n    (1996) 329-359, available online here:\n    http://www.apmaths.uwo.ca/~djeffrey/Offprints/W-adv-cm.pdf\n    \n    TODO: use a series expansion when extremely close to the branch point\n    at `-1/e` and make sure that the proper branch is chosen there\n\n    Examples\n    --------\n    The Lambert W function is the inverse of `w \\exp(w)`::\n\n    >>> from scipy.special import lambertw\n    >>> w = lambertw(1)\n    >>> w\n    0.56714329040978387299996866221035555\n    >>> w*exp(w)\n    1.0\n\n    Any branch gives a valid inverse::\n\n    >>> w = lambertw(1, k=3)\n    >>> w\n    (-2.8535817554090378072068187234910812 +\n    17.113535539412145912607826671159289j)\n    >>> w*exp(w)\n    (1.0 + 3.5075477124212226194278700785075126e-36j)\n\n    .. rubric:: Applications to equation-solving\n\n    The Lambert W function may be used to solve various kinds of\n    equations, such as finding the value of the infinite power\n    tower `z^{z^{z^{\\ldots}}}`::\n\n    >>> def tower(z, n):\n    ... if n == 0:\n    ... return z\n    ... return z ** tower(z, n-1)\n    ...\n    >>> tower(0.5, 100)\n    0.641185744504986\n    >>> -lambertw(-log(0.5))/log(0.5)\n    0.6411857445049859844862004821148236665628209571911\n\n    .. rubric:: Properties\n\n    The Lambert W function grows roughly like the natural logarithm\n    for large arguments::\n\n    >>> lambertw(1000)\n    5.2496028524016\n    >>> log(1000)\n    6.90775527898214\n    >>> lambertw(10**100)\n    224.843106445119\n    >>> log(10**100)\n    230.258509299405\n    \n    The principal branch of the Lambert W function has a rational\n    Taylor series expansion around `z = 0`::\n    \n    >>> nprint(taylor(lambertw, 0, 6), 10)\n    [0.0, 1.0, -1.0, 1.5, -2.666666667, 5.208333333, -10.8]\n    \n    Some special values and limits are::\n    \n    >>> lambertw(0)\n    0.0\n    >>> lambertw(1)\n    0.567143290409784\n    >>> lambertw(e)\n    1.0\n    >>> lambertw(inf)\n    +inf\n    >>> lambertw(0, k=-1)\n    -inf\n    >>> lambertw(0, k=3)\n    -inf\n    >>> lambertw(inf, k=3)\n    (+inf + 18.8495559215388j)\n\n    The `k = 0` and `k = -1` branches join at `z = -1/e` where\n    `W(z) = -1` for both branches. Since `-1/e` can only be represented\n    approximately with mpmath numbers, evaluating the Lambert W function\n    at this point only gives `-1` approximately::\n\n    >>> lambertw(-1/e, 0)\n    -0.999999999999837133022867\n    >>> lambertw(-1/e, -1)\n    -1.00000000000016286697718\n    \n    If `-1/e` happens to round in the negative direction, there might be\n    a small imaginary part::\n    \n    >>> lambertw(-1/e)\n    (-1.0 + 8.22007971511612e-9j)\n\n    ',
}
