# encoding: utf-8
# module numpy.core._dotblas
# from /usr/lib/pymodules/python2.7/numpy/core/_dotblas.so by generator 1.96
"""
This module provides a BLAS optimized
matrix multiply, inner product and dot for numpy arrays
"""
# no imports

# functions


def alterdot(*args, **kwargs):  # real signature unknown
    """
    Change `dot`, `vdot`, and `innerproduct` to use accelerated BLAS functions.
    
        Typically, as a user of Numpy, you do not explicitly call this function. If
        Numpy is built with an accelerated BLAS, this function is automatically
        called when Numpy is imported.
    
        When Numpy is built with an accelerated BLAS like ATLAS, these functions
        are replaced to make use of the faster implementations.  The faster
        implementations only affect float32, float64, complex64, and complex128
        arrays. Furthermore, the BLAS API only includes matrix-matrix,
        matrix-vector, and vector-vector products. Products of arrays with larger
        dimensionalities use the built in functions and are not accelerated.
    
        See Also
        --------
        restoredot : `restoredot` undoes the effects of `alterdot`.
    """
    pass


def dot(a, b):  # real signature unknown; restored from __doc__
    """
    dot(a, b)
    
        Dot product of two arrays.
    
        For 2-D arrays it is equivalent to matrix multiplication, and for 1-D
        arrays to inner product of vectors (without complex conjugation). For
        N dimensions it is a sum product over the last axis of `a` and
        the second-to-last of `b`::
    
            dot(a, b)[i,j,k,m] = sum(a[i,j,:] * b[k,:,m])
    
        Parameters
        ----------
        a : array_like
            First argument.
        b : array_like
            Second argument.
    
        Returns
        -------
        output : ndarray
            Returns the dot product of `a` and `b`.  If `a` and `b` are both
            scalars or both 1-D arrays then a scalar is returned; otherwise
            an array is returned.
    
        Raises
        ------
        ValueError
            If the last dimension of `a` is not the same size as
            the second-to-last dimension of `b`.
    
        See Also
        --------
        vdot : Complex-conjugating dot product.
        tensordot : Sum products over arbitrary axes.
    
        Examples
        --------
        >>> np.dot(3, 4)
        12
    
        Neither argument is complex-conjugated:
    
        >>> np.dot([2j, 3j], [2j, 3j])
        (-13+0j)
    
        For 2-D arrays it's the matrix product:
    
        >>> a = [[1, 0], [0, 1]]
        >>> b = [[4, 1], [2, 2]]
        >>> np.dot(a, b)
        array([[4, 1],
               [2, 2]])
    
        >>> a = np.arange(3*4*5*6).reshape((3,4,5,6))
        >>> b = np.arange(3*4*5*6)[::-1].reshape((5,4,6,3))
        >>> np.dot(a, b)[2,3,2,1,2,2]
        499128
        >>> sum(a[2,3,2,:] * b[1,2,:,2])
        499128
    """
    pass


def inner(a, b):  # real signature unknown; restored from __doc__
    """
    inner(a, b)
    
        Inner product of two arrays.
    
        Ordinary inner product of vectors for 1-D arrays (without complex
        conjugation), in higher dimensions a sum product over the last axes.
    
        Parameters
        ----------
        a, b : array_like
            If `a` and `b` are nonscalar, their last dimensions of must match.
    
        Returns
        -------
        out : ndarray
            `out.shape = a.shape[:-1] + b.shape[:-1]`
    
        Raises
        ------
        ValueError
            If the last dimension of `a` and `b` has different size.
    
        See Also
        --------
        tensordot : Sum products over arbitrary axes.
        dot : Generalised matrix product, using second last dimension of `b`.
    
        Notes
        -----
        For vectors (1-D arrays) it computes the ordinary inner-product::
    
            np.inner(a, b) = sum(a[:]*b[:])
    
        More generally, if `ndim(a) = r > 0` and `ndim(b) = s > 0`::
    
            np.inner(a, b) = np.tensordot(a, b, axes=(-1,-1))
    
        or explicitly::
    
            np.inner(a, b)[i0,...,ir-1,j0,...,js-1]
                 = sum(a[i0,...,ir-1,:]*b[j0,...,js-1,:])
    
        In addition `a` or `b` may be scalars, in which case::
    
           np.inner(a,b) = a*b
    
        Examples
        --------
        Ordinary inner product for vectors:
    
        >>> a = np.array([1,2,3])
        >>> b = np.array([0,1,0])
        >>> np.inner(a, b)
        2
    
        A multidimensional example:
    
        >>> a = np.arange(24).reshape((2,3,4))
        >>> b = np.arange(4)
        >>> np.inner(a, b)
        array([[ 14,  38,  62],
               [ 86, 110, 134]])
    
        An example where `b` is a scalar:
    
        >>> np.inner(np.eye(2), 7)
        array([[ 7.,  0.],
               [ 0.,  7.]])
    """
    pass


def restoredot(*args, **kwargs):  # real signature unknown
    """
    Restore `dot`, `vdot`, and `innerproduct` to the default non-BLAS
        implementations.
    
        Typically, the user will only need to call this when troubleshooting and
        installation problem, reproducing the conditions of a build without an
        accelerated BLAS, or when being very careful about benchmarking linear
        algebra operations.
    
        See Also
        --------
        alterdot : `restoredot` undoes the effects of `alterdot`.
    """
    pass


# real signature unknown; NOTE: unreliably restored from __doc__
def vdot(*args, **kwargs):
    """
    Return the dot product of two vectors.
    
        The vdot(`a`, `b`) function handles complex numbers differently than
        dot(`a`, `b`).  If the first argument is complex the complex conjugate
        of the first argument is used for the calculation of the dot product.
    
        Note that `vdot` handles multidimensional arrays differently than `dot`:
        it does *not* perform a matrix product, but flattens input arguments
        to 1-D vectors first. Consequently, it should only be used for vectors.
    
        Parameters
        ----------
        a : array_like
            If `a` is complex the complex conjugate is taken before calculation
            of the dot product.
        b : array_like
            Second argument to the dot product.
    
        Returns
        -------
        output : ndarray
            Dot product of `a` and `b`.  Can be an int, float, or
            complex depending on the types of `a` and `b`.
    
        See Also
        --------
        dot : Return the dot product without using the complex conjugate of the
              first argument.
    
        Examples
        --------
        >>> a = np.array([1+2j,3+4j])
        >>> b = np.array([5+6j,7+8j])
        >>> np.vdot(a, b)
        (70-8j)
        >>> np.vdot(b, a)
        (70+8j)
    
        Note that higher-dimensional arrays are flattened!
    
        >>> a = np.array([[1, 4], [5, 6]])
        >>> b = np.array([[4, 1], [2, 2]])
        >>> np.vdot(a, b)
        30
        >>> np.vdot(b, a)
        30
        >>> 1*4 + 4*1 + 5*2 + 6*2
        30
    """
    pass


# no classes
