# encoding: utf-8
# module scipy.spatial.ckdtree
# from /usr/lib/python2.7/dist-packages/scipy/spatial/ckdtree.so by generator 1.96
# no doc

# imports
# /usr/lib/python2.7/dist-packages/scipy/spatial/kdtree.pyc
import scipy.spatial.kdtree as kdtree
import __builtin__ as __builtins__  # <module '__builtin__' (built-in)>
import numpy as np  # /usr/lib/pymodules/python2.7/numpy/__init__.pyc

# no functions
# classes


class cKDTree(object):

    """
    kd-tree for quick nearest-neighbor lookup
    
        This class provides an index into a set of k-dimensional points
        which can be used to rapidly look up the nearest neighbors of any
        point. 
    
        The algorithm used is described in Maneewongvatana and Mount 1999. 
        The general idea is that the kd-tree is a binary trie, each of whose
        nodes represents an axis-aligned hyperrectangle. Each node specifies
        an axis and splits the set of points based on whether their coordinate
        along that axis is greater than or less than a particular value. 
    
        During construction, the axis and splitting point are chosen by the 
        "sliding midpoint" rule, which ensures that the cells do not all
        become long and thin. 
    
        The tree can be queried for the r closest neighbors of any given point 
        (optionally returning only those within some maximum distance of the 
        point). It can also be queried, with a substantial gain in efficiency, 
        for the r approximate closest neighbors.
    
        For large dimensions (20 is already large) do not expect this to run 
        significantly faster than brute force. High-dimensional nearest-neighbor
        queries are a substantial open problem in computer science.
    """

    def query(self, *args, **kwargs):  # real signature unknown
        """
        query the kd-tree for nearest neighbors
        
                Parameters:
                ===========
        
                x : array-like, last dimension self.m
                    An array of points to query.
                k : integer
                    The number of nearest neighbors to return.
                eps : nonnegative float
                    Return approximate nearest neighbors; the kth returned value 
                    is guaranteed to be no further than (1+eps) times the 
                    distance to the real kth nearest neighbor.
                p : float, 1<=p<=infinity
                    Which Minkowski p-norm to use. 
                    1 is the sum-of-absolute-values "Manhattan" distance
                    2 is the usual Euclidean distance
                    infinity is the maximum-coordinate-difference distance
                distance_upper_bound : nonnegative float
                    Return only neighbors within this distance. This is used to prune
                    tree searches, so if you are doing a series of nearest-neighbor
                    queries, it may help to supply the distance to the nearest neighbor
                    of the most recent point.
        
                Returns:
                ========
                
                d : array of floats
                    The distances to the nearest neighbors. 
                    If x has shape tuple+(self.m,), then d has shape tuple+(k,).
                    Missing neighbors are indicated with infinite distances.
                i : array of integers
                    The locations of the neighbors in self.data.
                    If x has shape tuple+(self.m,), then i has shape tuple+(k,).
                    Missing neighbors are indicated with self.n.
        """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    data = property(lambda self: object())  # default
    leafsize = property(lambda self: object())  # default
    m = property(lambda self: object())  # default
    maxes = property(lambda self: object())  # default
    mins = property(lambda self: object())  # default
    n = property(lambda self: object())  # default

    __pyx_vtable__ = None  # (!) real value is ''


# variables with complex values

__test__ = {
    u'cKDTree.__init__ (line 195)': 'x.__init__(...) initializes x; see help(type(x)) for signature',
    u'cKDTree.query (line 516)': 'query the kd-tree for nearest neighbors\n\n        Parameters:\n        ===========\n\n        x : array-like, last dimension self.m\n            An array of points to query.\n        k : integer\n            The number of nearest neighbors to return.\n        eps : nonnegative float\n            Return approximate nearest neighbors; the kth returned value \n            is guaranteed to be no further than (1+eps) times the \n            distance to the real kth nearest neighbor.\n        p : float, 1<=p<=infinity\n            Which Minkowski p-norm to use. \n            1 is the sum-of-absolute-values "Manhattan" distance\n            2 is the usual Euclidean distance\n            infinity is the maximum-coordinate-difference distance\n        distance_upper_bound : nonnegative float\n            Return only neighbors within this distance. This is used to prune\n            tree searches, so if you are doing a series of nearest-neighbor\n            queries, it may help to supply the distance to the nearest neighbor\n            of the most recent point.\n\n        Returns:\n        ========\n        \n        d : array of floats\n            The distances to the nearest neighbors. \n            If x has shape tuple+(self.m,), then d has shape tuple+(k,).\n            Missing neighbors are indicated with infinite distances.\n        i : array of integers\n            The locations of the neighbors in self.data.\n            If x has shape tuple+(self.m,), then i has shape tuple+(k,).\n            Missing neighbors are indicated with self.n.\n        ',
}
