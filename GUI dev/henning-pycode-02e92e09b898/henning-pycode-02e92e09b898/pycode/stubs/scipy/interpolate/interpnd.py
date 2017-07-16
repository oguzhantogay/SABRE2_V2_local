# encoding: utf-8
# module scipy.interpolate.interpnd
# from /usr/lib/python2.7/dist-packages/scipy/interpolate/interpnd.so by
# generator 1.96
"""
Simple N-D interpolation

.. versionadded:: 0.9
"""

# imports
import warnings as warnings  # /usr/lib/python2.7/warnings.pyc
import __builtin__ as __builtins__  # <module '__builtin__' (built-in)>
# /usr/lib/python2.7/dist-packages/scipy/spatial/qhull.so
import scipy.spatial.qhull as qhull
import numpy as np  # /usr/lib/pymodules/python2.7/numpy/__init__.pyc
import interpnd as __interpnd


# functions

def estimate_gradients_2d_global(*args, **kwargs):  # real signature unknown
    pass


def _ndim_coords_from_arrays(*args, **kwargs):  # real signature unknown
    """ Convert a tuple of coordinate arrays to a (..., ndim)-shaped array. """
    pass


# classes

class NDInterpolatorBase(object):

    """
    Common routines for interpolators.
    
        .. versionadded:: 0.9
    """

    def _check_call_shape(self, *args, **kwargs):  # real signature unknown
        pass

    def _check_init_shape(self, *args, **kwargs):  # real signature unknown
        """ Check shape of points and values arrays """
        pass

    def __call__(self, *args, **kwargs):  # real signature unknown
        """
        interpolator(xi)
        
                Evaluate interpolator at given points.
        
                Parameters
                ----------
                xi : ndarray of float, shape (..., ndim)
                    Points where to interpolate data at.
        """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        """
        Check shape of points and values arrays, and reshape values to
                (npoints, nvalues).  Ensure the `points` and values arrays are
                C-contiguous, and of correct type.
        """
        pass

    __weakref__ = property(lambda self: object())  # default

    __dict__ = None  # (!) real value is ''


class CloughTocher2DInterpolator(__interpnd.NDInterpolatorBase):

    """
    CloughTocher2DInterpolator(points, values, tol=1e-6)
    
        Piecewise cubic, C1 smooth, curvature-minimizing interpolant in 2D.
    
        .. versionadded:: 0.9
    
        Parameters
        ----------
        points : ndarray of floats, shape (npoints, ndims)
            Data point coordinates.
        values : ndarray of float or complex, shape (npoints, ...)
            Data values.
        fill_value : float, optional
            Value used to fill in for requested points outside of the
            convex hull of the input points.  If not provided, then
            the default is ``nan``.
        tol : float, optional
            Absolute/relative tolerance for gradient estimation.
        maxiter : int, optional
            Maximum number of iterations in gradient estimation.
    
        Notes
        -----
        The interpolant is constructed by triangulating the input data
        with Qhull [Qhull]_, and constructing a piecewise cubic
        interpolating Bezier polynomial on each triangle, using a
        Clough-Tocher scheme [CT]_.  The interpolant is guaranteed to be
        continuously differentiable.
    
        The gradients of the interpolant are chosen so that the curvature
        of the interpolating surface is approximatively minimized. The
        gradients necessary for this are estimated using the global
        algorithm described in [Nielson83,Renka84]_.
    
        References
        ----------
    
        .. [Qhull] http://www.qhull.org/
    
        .. [CT] See, for example,
           P. Alfeld,
           ''A trivariate Clough-Tocher scheme for tetrahedral data''.
           Computer Aided Geometric Design, 1, 169 (1984);
           G. Farin,
           ''Triangular Bernstein-Bezier patches''.
           Computer Aided Geometric Design, 3, 83 (1986).
    
        .. [Nielson83] G. Nielson,
           ''A method for interpolating scattered data based upon a minimum norm
           network''.
           Math. Comp., 40, 253 (1983).
    
        .. [Renka84] R. J. Renka and A. K. Cline.
           ''A Triangle-based C1 interpolation method.'',
           Rocky Mountain J. Math., 14, 223 (1984).
    """

    def _evaluate_complex(self, *args, **kwargs):  # real signature unknown
        pass

    def _evaluate_double(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


class GradientEstimationWarning(Warning):
    # no doc

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default


class LinearNDInterpolator(__interpnd.NDInterpolatorBase):

    """
    LinearNDInterpolator(points, values)
    
        Piecewise linear interpolant in N dimensions.
    
        .. versionadded:: 0.9
    
        Parameters
        ----------
        points : ndarray of floats, shape (npoints, ndims)
            Data point coordinates.
        values : ndarray of float or complex, shape (npoints, ...)
            Data values.
        fill_value : float, optional
            Value used to fill in for requested points outside of the
            convex hull of the input points.  If not provided, then
            the default is ``nan``.
    
        Notes
        -----
        The interpolant is constructed by triangulating the input data
        with Qhull [Qhull]_, and on each triangle performing linear
        barycentric interpolation.
    
        References
        ----------
        .. [Qhull] http://www.qhull.org/
    """

    def _evaluate_complex(self, *args, **kwargs):  # real signature unknown
        pass

    def _evaluate_double(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass


# variables with complex values

__test__ = {
    u'NDInterpolatorBase.__call__ (line 108)': '\n        interpolator(xi)\n\n        Evaluate interpolator at given points.\n\n        Parameters\n        ----------\n        xi : ndarray of float, shape (..., ndim)\n            Points where to interpolate data at.\n\n        ',
    u'NDInterpolatorBase.__init__ (line 54)': '\n        Check shape of points and values arrays, and reshape values to\n        (npoints, nvalues).  Ensure the `points` and values arrays are\n        C-contiguous, and of correct type.\n        ',
    u'NDInterpolatorBase._check_init_shape (line 87)': '\n        Check shape of points and values arrays\n\n        ',
    u'_ndim_coords_from_arrays (line 133)': '\n    Convert a tuple of coordinate arrays to a (..., ndim)-shaped array.\n\n    ',
}
