# encoding: utf-8
# module scipy.spatial.qhull
# from /usr/lib/python2.7/dist-packages/scipy/spatial/qhull.so by
# generator 1.96
"""
Wrappers for Qhull triangulation, plus some additional N-D geometry utilities

.. versionadded:: 0.9
"""

# imports
import __builtin__ as __builtins__  # <module '__builtin__' (built-in)>
import threading as threading  # /usr/lib/python2.7/threading.pyc
import numpy as np  # /usr/lib/pymodules/python2.7/numpy/__init__.pyc

# functions


def tsearch(tri, xi):  # real signature unknown; restored from __doc__
    """
    tsearch(tri, xi)
    
        Find simplices containing the given points. This function does the
        same thing as Delaunay.find_simplex.
    
        .. versionadded:: 0.9
    
        See Also
        --------
        Delaunay.find_simplex
    """
    pass


def _construct_delaunay(*args, **kwargs):  # real signature unknown
    """ Perform Delaunay triangulation of the given set of points. """
    pass


def _get_barycentric_transforms(*args, **kwargs):  # real signature unknown
    """
    Compute barycentric affine coordinate transformations for given
        simplices.
    
        Returns
        -------
        Tinvs : array, shape (nsimplex, ndim+1, ndim)
            Barycentric transforms for each simplex.
    
            Tinvs[i,:ndim,:ndim] contains inverse of the matrix ``T``,
            and Tinvs[i,ndim,:] contains the vector ``r_n`` (see below).
    
        Notes
        -----
        Barycentric transform from ``x`` to ``c`` is defined by::
    
            T c = x - r_n
    
        where the ``r_1, ..., r_n`` are the vertices of the simplex.
        The matrix ``T`` is defined by the condition::
    
            T e_j = r_j - r_n
    
        where ``e_j`` is the unit axis vector, e.g, ``e_2 = [0,1,0,0,...]``
        This implies that ``T_ij = (r_j - r_n)_i``.
    
        For the barycentric transforms, we need to compute the inverse
        matrix ``T^-1`` and store the vectors ``r_n`` for each vertex.
        These are stacked into the `Tinvs` returned.
    """
    pass


def _qhull_get_facet_array(*args, **kwargs):  # real signature unknown
    """
    Return array of simplical facets currently in Qhull.
    
        Returns
        -------
        vertices : array of int, shape (nfacets, ndim+1)
            Indices of coordinates of vertices forming the simplical facets
        neighbors : array of int, shape (nfacets, ndim)
            Indices of neighboring facets.  The kth neighbor is opposite
            the kth vertex, and the first neighbor is the horizon facet
            for the first vertex.
    
            Facets extending to infinity are denoted with index -1.
    """
    pass


# classes

class Delaunay(object):

    """
    Delaunay(points)
    
        Delaunay tesselation in N dimensions
    
        .. versionadded:: 0.9
    
        Parameters
        ----------
        points : ndarray of floats, shape (npoints, ndim)
            Coordinates of points to triangulate
    
        Attributes
        ----------
        points : ndarray of double, shape (npoints, ndim)
            Points in the triangulation
        vertices : ndarray of ints, shape (nsimplex, ndim+1)
            Indices of vertices forming simplices in the triangulation
        neighbors : ndarray of ints, shape (nsimplex, ndim+1)
            Indices of neighbor simplices for each simplex.
            The kth neighbor is opposite to the kth vertex.
            For simplices at the boundary, -1 denotes no neighbor.
        equations : ndarray of double, shape (nsimplex, ndim+2)
            [normal, offset] forming the hyperplane equation of the facet
            on the paraboloid. (See [Qhull]_ documentation for more.)
        paraboloid_scale, paraboloid_shift : float
            Scale and shift for the extra paraboloid dimension.
            (See [Qhull]_ documentation for more.)
        transform : ndarray of double, shape (nsimplex, ndim+1, ndim)
            Affine transform from ``x`` to the barycentric coordinates ``c``.
            This is defined by::
    
                T c = x - r
    
            At vertex ``j``, ``c_j = 1`` and the other coordinates zero.
    
            For simplex ``i``, ``transform[i,:ndim,:ndim]`` contains
            inverse of the matrix ``T``, and ``transform[i,ndim,:]``
            contains the vector ``r``.
        vertex_to_simplex : ndarray of int, shape (npoints,)
            Lookup array, from a vertex, to some simplex which it is a part of.
        convex_hull : ndarray of int, shape (nfaces, ndim)
            Vertices of facets forming the convex hull of the point set.
            The array contains the indices of the points belonging to
            the (N-1)-dimensional facets that form the convex hull
            of the triangulation.
    
        Notes
        -----
        The tesselation is computed using the Qhull libary [Qhull]_.
    
        References
        ----------
    
        .. [Qhull] http://www.qhull.org/
    """
    # real signature unknown; restored from __doc__

    def find_simplex(self, xi, bruteforce=False):
        """
        find_simplex(xi, bruteforce=False)
        
                Find the simplices containing the given points.
        
                Parameters
                ----------
                tri : DelaunayInfo
                    Delaunay triangulation
                xi : ndarray of double, shape (..., ndim)
                    Points to locate
                bruteforce : bool, optional
                    Whether to only perform a brute-force search
        
                Returns
                -------
                i : ndarray of int, same shape as `xi`
                    Indices of simplices containing each point.
                    Points outside the triangulation get the value -1.
        
                Notes
                -----
                This uses an algorithm adapted from Qhull's qh_findbestfacet,
                which makes use of the connection between a convex hull and a
                Delaunay triangulation. After finding the simplex closest to
                the point in N+1 dimensions, the algorithm falls back to
                directed search in N dimensions.
        """
        pass

    # real signature unknown; restored from __doc__
    def lift_points(self, tri, x):
        """
        lift_points(tri, x)
        
                Lift points to the Qhull paraboloid.
        """
        pass

    # real signature unknown; restored from __doc__
    def plane_distance(self, xi):
        """
        plane_distance(xi)
        
                Compute hyperplane distances to the point `xi` from all simplices.
        """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    convex_hull = property(lambda self: object())  # default
    transform = property(lambda self: object())  # default
    vertex_to_simplex = property(lambda self: object())  # default
    __weakref__ = property(lambda self: object())  # default

    __dict__ = None  # (!) real value is ''


class RidgeIter2D(object):
    # no doc

    def next(self):  # real signature unknown; restored from __doc__
        """ x.next() -> the next value, or raise StopIteration """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    def __iter__(self):  # real signature unknown; restored from __doc__
        """ x.__iter__() <==> iter(x) """
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    def __next__(self, *args, **kwargs):  # real signature unknown
        pass


# variables with complex values

_qhull_lock = None  # (!) real value is ''

__all__ = [
    'Delaunay',
    'tsearch',
]

__pyx_capi__ = {
    '_RidgeIter2D_init': None,  # (!) real value is ''
    '_RidgeIter2D_next': None,  # (!) real value is ''
    '_barycentric_coordinate_single': None,  # (!) real value is ''
    '_barycentric_coordinates': None,  # (!) real value is ''
    '_barycentric_inside': None,  # (!) real value is ''
    '_distplane': None,  # (!) real value is ''
    '_find_simplex': None,  # (!) real value is ''
    '_find_simplex_bruteforce': None,  # (!) real value is ''
    '_find_simplex_directed': None,  # (!) real value is ''
    '_get_delaunay_info': None,  # (!) real value is ''
    '_is_point_fully_outside': None,  # (!) real value is ''
    '_lift_point': None,  # (!) real value is ''
}

__test__ = {
    u'Delaunay.convex_hull (line 987)': '\n        Vertices of facets forming the convex hull of the point set.\n\n        :type: ndarray of int, shape (nfaces, ndim)\n\n        The array contains the indices of the points\n        belonging to the (N-1)-dimensional facets that form the convex\n        hull of the triangulation.\n\n        ',
    u'Delaunay.find_simplex (line 1033)': "\n        find_simplex(xi, bruteforce=False)\n\n        Find the simplices containing the given points.\n\n        Parameters\n        ----------\n        tri : DelaunayInfo\n            Delaunay triangulation\n        xi : ndarray of double, shape (..., ndim)\n            Points to locate\n        bruteforce : bool, optional\n            Whether to only perform a brute-force search\n\n        Returns\n        -------\n        i : ndarray of int, same shape as `xi`\n            Indices of simplices containing each point.\n            Points outside the triangulation get the value -1.\n\n        Notes\n        -----\n        This uses an algorithm adapted from Qhull's qh_findbestfacet,\n        which makes use of the connection between a convex hull and a\n        Delaunay triangulation. After finding the simplex closest to\n        the point in N+1 dimensions, the algorithm falls back to\n        directed search in N dimensions.\n\n        ",
    u'Delaunay.lift_points (line 1136)': '\n        lift_points(tri, x)\n\n        Lift points to the Qhull paraboloid.\n\n        ',
    u'Delaunay.plane_distance (line 1103)': '\n        plane_distance(xi)\n\n        Compute hyperplane distances to the point `xi` from all simplices.\n\n        ',
    u'Delaunay.transform (line 934)': '\n        Affine transform from ``x`` to the barycentric coordinates ``c``.\n\n        :type: ndarray of double, shape (nsimplex, ndim+1, ndim)\n\n        This is defined by::\n\n            T c = x - r\n\n        At vertex ``j``, ``c_j = 1`` and the other coordinates zero.\n\n        For simplex ``i``, ``transform[i,:ndim,:ndim]`` contains\n        inverse of the matrix ``T``, and ``transform[i,ndim,:]``\n        contains the vector ``r``.\n\n        ',
    u'Delaunay.vertex_to_simplex (line 957)': '\n        Lookup array, from a vertex, to some simplex which it is a part of.\n\n        :type: ndarray of int, shape (npoints,)\n        ',
    u'_construct_delaunay (line 134)': '\n    Perform Delaunay triangulation of the given set of points.\n\n    ',
    u'_get_barycentric_transforms (line 278)': '\n    Compute barycentric affine coordinate transformations for given\n    simplices.\n\n    Returns\n    -------\n    Tinvs : array, shape (nsimplex, ndim+1, ndim)\n        Barycentric transforms for each simplex.\n\n        Tinvs[i,:ndim,:ndim] contains inverse of the matrix ``T``,\n        and Tinvs[i,ndim,:] contains the vector ``r_n`` (see below).\n\n    Notes\n    -----\n    Barycentric transform from ``x`` to ``c`` is defined by::\n\n        T c = x - r_n\n\n    where the ``r_1, ..., r_n`` are the vertices of the simplex.\n    The matrix ``T`` is defined by the condition::\n\n        T e_j = r_j - r_n\n\n    where ``e_j`` is the unit axis vector, e.g, ``e_2 = [0,1,0,0,...]``\n    This implies that ``T_ij = (r_j - r_n)_i``.\n\n    For the barycentric transforms, we need to compute the inverse\n    matrix ``T^-1`` and store the vectors ``r_n`` for each vertex.\n    These are stacked into the `Tinvs` returned.\n\n    ',
    u'_qhull_get_facet_array (line 197)': '\n    Return array of simplical facets currently in Qhull.\n\n    Returns\n    -------\n    vertices : array of int, shape (nfacets, ndim+1)\n        Indices of coordinates of vertices forming the simplical facets\n    neighbors : array of int, shape (nfacets, ndim)\n        Indices of neighboring facets.  The kth neighbor is opposite\n        the kth vertex, and the first neighbor is the horizon facet\n        for the first vertex.\n\n        Facets extending to infinity are denoted with index -1.\n\n    ',
    u'tsearch (line 1151)': '\n    tsearch(tri, xi)\n\n    Find simplices containing the given points. This function does the\n    same thing as Delaunay.find_simplex.\n\n    .. versionadded:: 0.9\n\n    See Also\n    --------\n    Delaunay.find_simplex\n\n    ',
}
