# encoding: utf-8
# module matplotlib._cntr
# from /usr/lib/pymodules/python2.7/matplotlib/_cntr.so by generator 1.96
""" Contouring engine as an extension type (numpy). """
# no imports

# Variables with simple values

_slitkind = 3

# no functions
# classes


class Cntr(object):

    """ Contour engine """

    def get_cdata(self, *args, **kwargs):  # real signature unknown
        """
        Returns a copy of the mesh array with contour calculation codes.
        
        Experimental and incomplete; we are not returning quite all of
        the array.
        Don't call this unless you are exploring the dark recesses of cntr.c
        """
        pass

    def trace(self, *args, **kwargs):  # real signature unknown
        """
        Return a list of contour line segments or polygons.
        
            Required argument: level0, a contour level
            Optional argument: level1; if given, and if level1 > level0,
                then the contours will be polygons surrounding areas between
                the levels.
            Optional argument: points; if 0 (default), return a list of
                vector pairs; otherwise, return a list of lists of points.
            Optional argument: nchunk; approximate number of grid points
                per chunk. 0 (default) for no chunking.
        """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass
