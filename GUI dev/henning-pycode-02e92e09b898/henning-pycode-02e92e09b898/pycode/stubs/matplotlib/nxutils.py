# encoding: utf-8
# module matplotlib.nxutils
# from /usr/lib/pymodules/python2.7/matplotlib/nxutils.so by generator 1.96
""" general purpose numerical utilities, eg for computational geometry, that are not available in `numpy <http://numpy.scipy.org>`_ """
# no imports

# functions


def pnpoly(x, y, xyverts):  # real signature unknown; restored from __doc__
    """
    inside = pnpoly(x, y, xyverts)
    
    Return 1 if x,y is inside the polygon, 0 otherwise.
    
    *xyverts*
        a sequence of x,y vertices.
    
    A point on the boundary may be treated as inside or outside.
    See `pnpoly <http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html>`_
    """
    pass


# real signature unknown; restored from __doc__
def points_inside_poly(xypoints, xyverts):
    """
    mask = points_inside_poly(xypoints, xyverts)
    
    Return a boolean ndarray, True for points inside the polygon.
    
    *xypoints*
        a sequence of N x,y pairs.
    *xyverts*
        sequence of x,y vertices of the polygon.
    *mask*    an ndarray of length N.
    
    A point on the boundary may be treated as inside or outside.
    See `pnpoly <http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html>`_
    """
    pass


# no classes
