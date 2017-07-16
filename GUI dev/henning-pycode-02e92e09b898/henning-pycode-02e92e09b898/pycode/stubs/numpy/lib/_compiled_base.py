# encoding: utf-8
# module numpy.lib._compiled_base
# from /usr/lib/pymodules/python2.7/numpy/lib/_compiled_base.so by generator 1.96
# no doc

# imports
from exceptions import error


# functions

def add_docstring(*args, **kwargs):  # real signature unknown
    """
    docstring(obj, docstring)
    
        Add a docstring to a built-in obj if possible.
        If the obj already has a docstring raise a RuntimeError
        If this routine does not know how to add a docstring to the object
        raise a TypeError
    """
    pass


def bincount(x, weights=None):  # real signature unknown; restored from __doc__
    """
    bincount(x, weights=None)
    
        Count number of occurrences of each value in array of non-negative ints.
    
        The number of bins (of size 1) is one larger than the largest value in
        `x`. Each bin gives the number of occurrences of its index value in `x`.
        If `weights` is specified the input array is weighted by it, i.e. if a
        value ``n`` is found at position ``i``, ``out[n] += weight[i]`` instead
        of ``out[n] += 1``.
    
        Parameters
        ----------
        x : array_like, 1 dimension, nonnegative ints
            Input array.
        weights : array_like, optional
            Weights, array of the same shape as `x`.
    
        Returns
        -------
        out : ndarray of ints
            The result of binning the input array.
            The length of `out` is equal to ``np.amax(x)+1``.
    
        Raises
        ------
        ValueError
            If the input is not 1-dimensional, or contains elements with negative
            values.
        TypeError
            If the type of the input is float or complex.
    
        See Also
        --------
        histogram, digitize, unique
    
        Examples
        --------
        >>> np.bincount(np.arange(5))
        array([1, 1, 1, 1, 1])
        >>> np.bincount(np.array([0, 1, 1, 3, 2, 1, 7]))
        array([1, 3, 1, 1, 0, 0, 0, 1])
    
        >>> x = np.array([0, 1, 1, 3, 2, 1, 7, 23])
        >>> np.bincount(x).size == np.amax(x)+1
        True
    
        >>> np.bincount(np.arange(5, dtype=np.float))
        Traceback (most recent call last):
          File "<stdin>", line 1, in <module>
        TypeError: array cannot be safely cast to required type
    
        A possible use of ``bincount`` is to perform sums over
        variable-size chunks of an array, using the ``weights`` keyword.
    
        >>> w = np.array([0.3, 0.5, 0.2, 0.7, 1., -0.6]) # weights
        >>> x = np.array([0, 1, 1, 2, 2, 2])
        >>> np.bincount(x,  weights=w)
        array([ 0.3,  0.7,  1.1])
    """
    pass


def digitize(x, bins):  # real signature unknown; restored from __doc__
    """
    digitize(x, bins)
    
        Return the indices of the bins to which each value in input array belongs.
    
        Each index ``i`` returned is such that ``bins[i-1] <= x < bins[i]`` if
        `bins` is monotonically increasing, or ``bins[i-1] > x >= bins[i]`` if
        `bins` is monotonically decreasing. If values in `x` are beyond the
        bounds of `bins`, 0 or ``len(bins)`` is returned as appropriate.
    
        Parameters
        ----------
        x : array_like
            Input array to be binned. It has to be 1-dimensional.
        bins : array_like
            Array of bins. It has to be 1-dimensional and monotonic.
    
        Returns
        -------
        out : ndarray of ints
            Output array of indices, of same shape as `x`.
    
        Raises
        ------
        ValueError
            If the input is not 1-dimensional, or if `bins` is not monotonic.
        TypeError
            If the type of the input is complex.
    
        See Also
        --------
        bincount, histogram, unique
    
        Notes
        -----
        If values in `x` are such that they fall outside the bin range,
        attempting to index `bins` with the indices that `digitize` returns
        will result in an IndexError.
    
        Examples
        --------
        >>> x = np.array([0.2, 6.4, 3.0, 1.6])
        >>> bins = np.array([0.0, 1.0, 2.5, 4.0, 10.0])
        >>> inds = np.digitize(x, bins)
        >>> inds
        array([1, 4, 3, 2])
        >>> for n in range(x.size):
        ...   print bins[inds[n]-1], "<=", x[n], "<", bins[inds[n]]
        ...
        0.0 <= 0.2 < 1.0
        4.0 <= 6.4 < 10.0
        2.5 <= 3.0 < 4.0
        1.0 <= 1.6 < 2.5
    """
    pass


def interp(*args, **kwargs):  # real signature unknown
    pass


# real signature unknown; restored from __doc__
def packbits(myarray, axis=None):
    """
    packbits(myarray, axis=None)
    
        Packs the elements of a binary-valued array into bits in a uint8 array.
    
        The result is padded to full bytes by inserting zero bits at the end.
    
        Parameters
        ----------
        myarray : array_like
            An integer type array whose elements should be packed to bits.
        axis : int, optional
            The dimension over which bit-packing is done.
            ``None`` implies packing the flattened array.
    
        Returns
        -------
        packed : ndarray
            Array of type uint8 whose elements represent bits corresponding to the
            logical (0 or nonzero) value of the input elements. The shape of
            `packed` has the same number of dimensions as the input (unless `axis`
            is None, in which case the output is 1-D).
    
        See Also
        --------
        unpackbits: Unpacks elements of a uint8 array into a binary-valued output
                    array.
    
        Examples
        --------
        >>> a = np.array([[[1,0,1],
        ...                [0,1,0]],
        ...               [[1,1,0],
        ...                [0,0,1]]])
        >>> b = np.packbits(a, axis=-1)
        >>> b
        array([[[160],[64]],[[192],[32]]], dtype=uint8)
    
        Note that in binary 160 = 1010 0000, 64 = 0100 0000, 192 = 1100 0000,
        and 32 = 0010 0000.
    """
    pass


# real signature unknown; restored from __doc__
def unpackbits(myarray, axis=None):
    """
    unpackbits(myarray, axis=None)
    
        Unpacks elements of a uint8 array into a binary-valued output array.
    
        Each element of `myarray` represents a bit-field that should be unpacked
        into a binary-valued output array. The shape of the output array is either
        1-D (if `axis` is None) or the same shape as the input array with unpacking
        done along the axis specified.
    
        Parameters
        ----------
        myarray : ndarray, uint8 type
           Input array.
        axis : int, optional
           Unpacks along this axis.
    
        Returns
        -------
        unpacked : ndarray, uint8 type
           The elements are binary-valued (0 or 1).
    
        See Also
        --------
        packbits : Packs the elements of a binary-valued array into bits in a uint8
                   array.
    
        Examples
        --------
        >>> a = np.array([[2], [7], [23]], dtype=np.uint8)
        >>> a
        array([[ 2],
               [ 7],
               [23]], dtype=uint8)
        >>> b = np.unpackbits(a, axis=1)
        >>> b
        array([[0, 0, 0, 0, 0, 0, 1, 0],
               [0, 0, 0, 0, 0, 1, 1, 1],
               [0, 0, 0, 1, 0, 1, 1, 1]], dtype=uint8)
    """
    pass


def _insert(*args, **kwargs):  # real signature unknown
    """ Insert vals sequentially into equivalent 1-d positions indicated by mask. """
    pass


# no classes
