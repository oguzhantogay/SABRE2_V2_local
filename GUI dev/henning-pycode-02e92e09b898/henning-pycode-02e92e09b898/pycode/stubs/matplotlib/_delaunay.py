# encoding: utf-8
# module matplotlib._delaunay
# from /usr/lib/pymodules/python2.7/matplotlib/_delaunay.so by generator 1.96
""" Tools for computing the Delaunay triangulation and some operations on it. """
# no imports

# functions


def compute_planes(*args, **kwargs):  # real signature unknown
    """  """
    pass


def delaunay(x, y):  # real signature unknown; restored from __doc__
    """
    Compute the Delaunay triangulation of a cloud of 2-D points.
    
    circumcenters, edges, tri_points, tri_neighbors = delaunay(x, y)
    
    x, y -- shape-(npoints,) arrays of floats giving the X and Y coordinates of the points
    circumcenters -- shape-(numtri,2) array of floats giving the coordinates of the
        circumcenters of each triangle (numtri being the number of triangles)
    edges -- shape-(nedges,2) array of integers giving the indices into x and y
        of each edge in the triangulation
    tri_points -- shape-(numtri,3) array of integers giving the indices into x and y
        of each node in each triangle
    tri_neighbors -- shape-(numtri,3) array of integers giving the indices into circumcenters
        tri_points, and tri_neighbors of the neighbors of each triangle
    """
    pass


def linear_interpolate_grid(*args, **kwargs):  # real signature unknown
    """  """
    pass


def nn_interpolate_grid(*args, **kwargs):  # real signature unknown
    """  """
    pass


def nn_interpolate_unstructured(*args, **kwargs):  # real signature unknown
    """  """
    pass


# no classes
