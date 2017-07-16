# encoding: utf-8
# module scipy.signal.spline
# from /usr/lib/python2.7/dist-packages/scipy/signal/spline.so by generator 1.96
# no doc
# no imports

# Variables with simple values

__version__ = '0.2'

# functions

# real signature unknown; NOTE: unreliably restored from __doc__


def cspline2d(input, *args, **kwargs):
    """
    cspline2d(input {, lambda, precision}) -> ck
    
      Description:
    
        Return the third-order B-spline coefficients over a regularly spacedi
        input grid for the two-dimensional input image.  The lambda argument
        specifies the amount of smoothing.  The precision argument allows specifying
        the precision used when computing the infinite sum needed to apply mirror-
        symmetric boundary conditions.
    """
    pass


# real signature unknown; NOTE: unreliably restored from __doc__
def qspline2d(input, *args, **kwargs):
    """
    qspline2d(input {, lambda, precision}) -> qk
    
      Description:
    
        Return the second-order B-spline coefficients over a regularly spaced
        input grid for the two-dimensional input image.  The lambda argument
        specifies the amount of smoothing.  The precision argument allows specifying
        the precision used when computing the infinite sum needed to apply mirror-
        symmetric boundary conditions.
    """
    pass


# real signature unknown; restored from __doc__
def sepfir2d(input, hrow, hcol):
    """
    sepfir2d(input, hrow, hcol) -> output
    
      Description:
    
        Convolve the rank-2 input array with the separable filter defined by the
        rank-1 arrays hrow, and hcol. Mirror symmetric boundary conditions are
        assumed.  This function can be used to find an image given its B-spline
        representation.
    """
    pass


# real signature unknown; NOTE: unreliably restored from __doc__
def symiirorder1(input, c0, z1, *args, **kwargs):
    """
    symiirorder1(input, c0, z1 {, precision}) -> output
    
      Description:
    
        Implement a smoothing IIR filter with mirror-symmetric boundary conditions
        using a cascade of first-order sections.  The second section uses a
        reversed sequence.  This implements a system with the following
        transfer function and mirror-symmetric boundary conditions.
    
                               c0              
               H(z) = ---------------------    
                       (1-z1/z) (1 - z1 z)     
    
        The resulting signal will have mirror symmetric boundary conditions as well.
    
      Inputs:
    
        input -- the input signal.
        c0, z1 -- parameters in the transfer function.
        precision -- specifies the precision for calculating initial conditions
                     of the recursive filter based on mirror-symmetric input.
    
      Output:
    
        output -- filtered signal.
    """
    pass


# real signature unknown; NOTE: unreliably restored from __doc__
def symiirorder2(input, r, omega, *args, **kwargs):
    """
    symiirorder2(input, r, omega {, precision}) -> output
    
      Description:
    
        Implement a smoothing IIR filter with mirror-symmetric boundary conditions
        using a cascade of second-order sections.  The second section uses a
        reversed sequence.  This implements the following transfer function:
    
                                            cs^2
                   H(z) = ---------------------------------------
                          (1 - a2/z - a3/z^2) (1 - a2 z - a3 z^2 )
    
        where a2 = (2 r cos omega)
              a3 = - r^2
              cs = 1 - 2 r cos omega + r^2
    
      Inputs:
    
        input -- the input signal.
        r, omega -- parameters in the transfer function.
        precision -- specifies the precision for calculating initial conditions
                     of the recursive filter based on mirror-symmetric input.
    
      Output:
    
        output -- filtered signal.
    """
    pass


# no classes
