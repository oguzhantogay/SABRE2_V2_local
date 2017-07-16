# encoding: utf-8
# module numpy.core.multiarray
# from /usr/lib/pymodules/python2.7/numpy/core/multiarray.so by generator 1.96
# no doc

# imports
from exceptions import error


# Variables with simple values

ALLOW_THREADS = 1

BUFSIZE = 10000

CLIP = 0

ITEM_HASOBJECT = 1

ITEM_IS_POINTER = 4

LIST_PICKLE = 2

MAXDIMS = 32

METADATA_DTSTR = '__frequency__'

NEEDS_INIT = 8
NEEDS_PYAPI = 16

RAISE = 2

USE_GETITEM = 32
USE_SETITEM = 64

WRAP = 1

__version__ = '3.1'

# functions

# known case of numpy.core.multiarray.arange


def arange(start=None, stop=None, step=None, dtype=None):
    """
    arange([start,] stop[, step,], dtype=None)
    
        Return evenly spaced values within a given interval.
    
        Values are generated within the half-open interval ``[start, stop)``
        (in other words, the interval including `start` but excluding `stop`).
        For integer arguments the function is equivalent to the Python built-in
        `range <http://docs.python.org/lib/built-in-funcs.html>`_ function,
        but returns a ndarray rather than a list.
    
        Parameters
        ----------
        start : number, optional
            Start of interval.  The interval includes this value.  The default
            start value is 0.
        stop : number
            End of interval.  The interval does not include this value.
        step : number, optional
            Spacing between values.  For any output `out`, this is the distance
            between two adjacent values, ``out[i+1] - out[i]``.  The default
            step size is 1.  If `step` is specified, `start` must also be given.
        dtype : dtype
            The type of the output array.  If `dtype` is not given, infer the data
            type from the other input arguments.
    
        Returns
        -------
        out : ndarray
            Array of evenly spaced values.
    
            For floating point arguments, the length of the result is
            ``ceil((stop - start)/step)``.  Because of floating point overflow,
            this rule may result in the last element of `out` being greater
            than `stop`.
    
        See Also
        --------
        linspace : Evenly spaced numbers with careful handling of endpoints.
        ogrid: Arrays of evenly spaced numbers in N-dimensions
        mgrid: Grid-shaped arrays of evenly spaced numbers in N-dimensions
    
        Examples
        --------
        >>> np.arange(3)
        array([0, 1, 2])
        >>> np.arange(3.0)
        array([ 0.,  1.,  2.])
        >>> np.arange(3,7)
        array([3, 4, 5, 6])
        >>> np.arange(3,7,2)
        array([3, 5])
    """
    pass


# real signature unknown; restored from __doc__
def array(p_object, dtype=None, copy=True, order=None, subok=False, ndmin=0):
    """
    array(object, dtype=None, copy=True, order=None, subok=False, ndmin=0)
    
        Create an array.
    
        Parameters
        ----------
        object : array_like
            An array, any object exposing the array interface, an
            object whose __array__ method returns an array, or any
            (nested) sequence.
        dtype : data-type, optional
            The desired data-type for the array.  If not given, then
            the type will be determined as the minimum type required
            to hold the objects in the sequence.  This argument can only
            be used to 'upcast' the array.  For downcasting, use the
            .astype(t) method.
        copy : bool, optional
            If true (default), then the object is copied.  Otherwise, a copy
            will only be made if __array__ returns a copy, if obj is a
            nested sequence, or if a copy is needed to satisfy any of the other
            requirements (`dtype`, `order`, etc.).
        order : {'C', 'F', 'A'}, optional
            Specify the order of the array.  If order is 'C' (default), then the
            array will be in C-contiguous order (last-index varies the
            fastest).  If order is 'F', then the returned array
            will be in Fortran-contiguous order (first-index varies the
            fastest).  If order is 'A', then the returned array may
            be in any order (either C-, Fortran-contiguous, or even
            discontiguous).
        subok : bool, optional
            If True, then sub-classes will be passed-through, otherwise
            the returned array will be forced to be a base-class array (default).
        ndmin : int, optional
            Specifies the minimum number of dimensions that the resulting
            array should have.  Ones will be pre-pended to the shape as
            needed to meet this requirement.
    
        Examples
        --------
        >>> np.array([1, 2, 3])
        array([1, 2, 3])
    
        Upcasting:
    
        >>> np.array([1, 2, 3.0])
        array([ 1.,  2.,  3.])
    
        More than one dimension:
    
        >>> np.array([[1, 2], [3, 4]])
        array([[1, 2],
               [3, 4]])
    
        Minimum dimensions 2:
    
        >>> np.array([1, 2, 3], ndmin=2)
        array([[1, 2, 3]])
    
        Type provided:
    
        >>> np.array([1, 2, 3], dtype=complex)
        array([ 1.+0.j,  2.+0.j,  3.+0.j])
    
        Data-type consisting of more than one element:
    
        >>> x = np.array([(1,2),(3,4)],dtype=[('a','<i4'),('b','<i4')])
        >>> x['a']
        array([1, 3])
    
        Creating an array from sub-classes:
    
        >>> np.array(np.mat('1 2; 3 4'))
        array([[1, 2],
               [3, 4]])
    
        >>> np.array(np.mat('1 2; 3 4'), subok=True)
        matrix([[1, 2],
                [3, 4]])
    """
    pass


# real signature unknown; restored from __doc__
def can_cast(fromtype, totype):
    """
    can_cast(fromtype, totype)
    
        Returns True if cast between data types can occur without losing precision.
    
        Parameters
        ----------
        fromtype : dtype or dtype specifier
            Data type to cast from.
        totype : dtype or dtype specifier
            Data type to cast to.
    
        Returns
        -------
        out : bool
            True if cast can occur without losing precision.
    
        Examples
        --------
        >>> np.can_cast(np.int32, np.int64)
        True
        >>> np.can_cast(np.float64, np.complex)
        True
        >>> np.can_cast(np.complex, np.float)
        False
    
        >>> np.can_cast('i8', 'f8')
        True
        >>> np.can_cast('i8', 'f4')
        False
        >>> np.can_cast('i4', 'S4')
        True
    """
    pass


def compare_chararrays(*args, **kwargs):  # real signature unknown
    pass


# real signature unknown; restored from __doc__
def concatenate(a_tuple, axis=0):
    """
    concatenate((a1, a2, ...), axis=0)
    
        Join a sequence of arrays together.
    
        Parameters
        ----------
        a1, a2, ... : sequence of array_like
            The arrays must have the same shape, except in the dimension
            corresponding to `axis` (the first, by default).
        axis : int, optional
            The axis along which the arrays will be joined.  Default is 0.
    
        Returns
        -------
        res : ndarray
            The concatenated array.
    
        See Also
        --------
        ma.concatenate : Concatenate function that preserves input masks.
        array_split : Split an array into multiple sub-arrays of equal or
                      near-equal size.
        split : Split array into a list of multiple sub-arrays of equal size.
        hsplit : Split array into multiple sub-arrays horizontally (column wise)
        vsplit : Split array into multiple sub-arrays vertically (row wise)
        dsplit : Split array into multiple sub-arrays along the 3rd axis (depth).
        hstack : Stack arrays in sequence horizontally (column wise)
        vstack : Stack arrays in sequence vertically (row wise)
        dstack : Stack arrays in sequence depth wise (along third dimension)
    
        Notes
        -----
        When one or more of the arrays to be concatenated is a MaskedArray,
        this function will return a MaskedArray object instead of an ndarray,
        but the input masks are *not* preserved. In cases where a MaskedArray
        is expected as input, use the ma.concatenate function from the masked
        array module instead.
    
        Examples
        --------
        >>> a = np.array([[1, 2], [3, 4]])
        >>> b = np.array([[5, 6]])
        >>> np.concatenate((a, b), axis=0)
        array([[1, 2],
               [3, 4],
               [5, 6]])
        >>> np.concatenate((a, b.T), axis=1)
        array([[1, 2, 5],
               [3, 4, 6]])
    
        This function will not preserve masking of MaskedArray inputs.
    
        >>> a = np.ma.arange(3)
        >>> a[1] = np.ma.masked
        >>> b = np.arange(2, 5)
        >>> a
        masked_array(data = [0 -- 2],
                     mask = [False  True False],
               fill_value = 999999)
        >>> b
        array([2, 3, 4])
        >>> np.concatenate([a, b])
        masked_array(data = [0 1 2 2 3 4],
                     mask = False,
               fill_value = 999999)
        >>> np.ma.concatenate([a, b])
        masked_array(data = [0 -- 2 2 3 4],
                     mask = [False  True False False False False],
               fill_value = 999999)
    """
    pass


def correlate(a, v, mode=0):  # real signature unknown; restored from __doc__
    """ cross_correlate(a,v, mode=0) """
    pass


def correlate2(*args, **kwargs):  # real signature unknown
    pass


def dot(*args, **kwargs):  # real signature unknown
    pass


# real signature unknown; restored from __doc__
def empty(shape, dtype=None, order='C'):
    """
    empty(shape, dtype=float, order='C')
    
        Return a new array of given shape and type, without initializing entries.
    
        Parameters
        ----------
        shape : int or tuple of int
            Shape of the empty array
        dtype : data-type, optional
            Desired output data-type.
        order : {'C', 'F'}, optional
            Whether to store multi-dimensional data in C (row-major) or
            Fortran (column-major) order in memory.
    
        See Also
        --------
        empty_like, zeros, ones
    
        Notes
        -----
        `empty`, unlike `zeros`, does not set the array values to zero,
        and may therefore be marginally faster.  On the other hand, it requires
        the user to manually set all the values in the array, and should be
        used with caution.
    
        Examples
        --------
        >>> np.empty([2, 2])
        array([[ -9.74499359e+001,   6.69583040e-309],
               [  2.13182611e-314,   3.06959433e-309]])         #random
    
        >>> np.empty([2, 2], dtype=int)
        array([[-1073741821, -1067949133],
               [  496041986,    19249760]])                     #random
    """
    pass


def format_longfloat(*args, **kwargs):  # real signature unknown
    pass


# real signature unknown; restored from __doc__
def frombuffer(buffer, dtype=None, count=-1, offset=0):
    """
    frombuffer(buffer, dtype=float, count=-1, offset=0)
    
        Interpret a buffer as a 1-dimensional array.
    
        Parameters
        ----------
        buffer
            An object that exposes the buffer interface.
        dtype : data-type, optional
            Data type of the returned array.
        count : int, optional
            Number of items to read. ``-1`` means all data in the buffer.
        offset : int, optional
            Start reading the buffer from this offset.
    
        Notes
        -----
        If the buffer has data that is not in machine byte-order, this
        should be specified as part of the data-type, e.g.::
    
          >>> dt = np.dtype(int)
          >>> dt = dt.newbyteorder('>')
          >>> np.frombuffer(buf, dtype=dt)
    
        The data of the resulting array will not be byteswapped,
        but will be interpreted correctly.
    
        Examples
        --------
        >>> s = 'hello world'
        >>> np.frombuffer(s, dtype='S1', count=5, offset=6)
        array(['w', 'o', 'r', 'l', 'd'],
              dtype='|S1')
    """
    pass


# real signature unknown; restored from __doc__
def fromfile(file, dtype=None, count=-1, sep=''):
    """
    fromfile(file, dtype=float, count=-1, sep='')
    
        Construct an array from data in a text or binary file.
    
        A highly efficient way of reading binary data with a known data-type,
        as well as parsing simply formatted text files.  Data written using the
        `tofile` method can be read using this function.
    
        Parameters
        ----------
        file : file or str
            Open file object or filename.
        dtype : data-type
            Data type of the returned array.
            For binary files, it is used to determine the size and byte-order
            of the items in the file.
        count : int
            Number of items to read. ``-1`` means all items (i.e., the complete
            file).
        sep : str
            Separator between items if file is a text file.
            Empty ("") separator means the file should be treated as binary.
            Spaces (" ") in the separator match zero or more whitespace characters.
            A separator consisting only of spaces must match at least one
            whitespace.
    
        See also
        --------
        load, save
        ndarray.tofile
        loadtxt : More flexible way of loading data from a text file.
    
        Notes
        -----
        Do not rely on the combination of `tofile` and `fromfile` for
        data storage, as the binary files generated are are not platform
        independent.  In particular, no byte-order or data-type information is
        saved.  Data can be stored in the platform independent ``.npy`` format
        using `save` and `load` instead.
    
        Examples
        --------
        Construct an ndarray:
    
        >>> dt = np.dtype([('time', [('min', int), ('sec', int)]),
        ...                ('temp', float)])
        >>> x = np.zeros((1,), dtype=dt)
        >>> x['time']['min'] = 10; x['temp'] = 98.25
        >>> x
        array([((10, 0), 98.25)],
              dtype=[('time', [('min', '<i4'), ('sec', '<i4')]), ('temp', '<f8')])
    
        Save the raw data to disk:
    
        >>> import os
        >>> fname = os.tmpnam()
        >>> x.tofile(fname)
    
        Read the raw data from disk:
    
        >>> np.fromfile(fname, dtype=dt)
        array([((10, 0), 98.25)],
              dtype=[('time', [('min', '<i4'), ('sec', '<i4')]), ('temp', '<f8')])
    
        The recommended way to store and load data:
    
        >>> np.save(fname, x)
        >>> np.load(fname + '.npy')
        array([((10, 0), 98.25)],
              dtype=[('time', [('min', '<i4'), ('sec', '<i4')]), ('temp', '<f8')])
    """
    pass


# real signature unknown; restored from __doc__
def fromiter(iterable, dtype, count=-1):
    """
    fromiter(iterable, dtype, count=-1)
    
        Create a new 1-dimensional array from an iterable object.
    
        Parameters
        ----------
        iterable : iterable object
            An iterable object providing data for the array.
        dtype : data-type
            The data type of the returned array.
        count : int, optional
            The number of items to read from iterable. The default is -1,
            which means all data is read.
    
        Returns
        -------
        out : ndarray
            The output array.
    
        Notes
        -----
        Specify ``count`` to improve performance.  It allows
        ``fromiter`` to pre-allocate the output array, instead of
        resizing it on demand.
    
        Examples
        --------
        >>> iterable = (x*x for x in range(5))
        >>> np.fromiter(iterable, np.float)
        array([  0.,   1.,   4.,   9.,  16.])
    """
    pass


# real signature unknown; restored from __doc__
def fromstring(string, dtype=None, count=-1, sep=''):
    """
    fromstring(string, dtype=float, count=-1, sep='')
    
        Return a new 1-D array initialized from raw binary or text data in string.
    
        Parameters
        ----------
        string : str
            A string containing the data.
        dtype : dtype, optional
            The data type of the array. For binary input data, the data must be
            in exactly this format.
        count : int, optional
            Read this number of `dtype` elements from the data. If this is
            negative, then the size will be determined from the length of the
            data.
        sep : str, optional
            If provided and not empty, then the data will be interpreted as
            ASCII text with decimal numbers. This argument is interpreted as the
            string separating numbers in the data. Extra whitespace between
            elements is also ignored.
    
        Returns
        -------
        arr : array
            The constructed array.
    
        Raises
        ------
        ValueError
            If the string is not the correct size to satisfy the requested
            `dtype` and `count`.
    
        Examples
        --------
        >>> np.fromstring('\x01\x02', dtype=np.uint8)
        array([1, 2], dtype=uint8)
        >>> np.fromstring('1 2', dtype=int, sep=' ')
        array([1, 2])
        >>> np.fromstring('1, 2', dtype=int, sep=',')
        array([1, 2])
        >>> np.fromstring('\x01\x02\x03\x04\x05', dtype=np.uint8, count=3)
        array([1, 2, 3], dtype=uint8)
    
        Invalid inputs:
    
        >>> np.fromstring('\x01\x02\x03\x04\x05', dtype=np.int32)
        Traceback (most recent call last):
          File "<stdin>", line 1, in <module>
        ValueError: string size must be a multiple of element size
        >>> np.fromstring('\x01\x02', dtype=np.uint8, count=3)
        Traceback (most recent call last):
          File "<stdin>", line 1, in <module>
        ValueError: string is smaller than requested size
    """
    pass


# real signature unknown; restored from __doc__
def getbuffer(obj, offset=None, size=None):
    """
    getbuffer(obj [,offset[, size]])
    
        Create a buffer object from the given object referencing a slice of
        length size starting at offset.
    
        Default is the entire buffer. A read-write buffer is attempted followed
        by a read-only buffer.
    
        Parameters
        ----------
        obj : object
    
        offset : int, optional
    
        size : int, optional
    
        Returns
        -------
        buffer_obj : buffer
    
        Examples
        --------
        >>> buf = np.getbuffer(np.ones(5), 1, 3)
        >>> len(buf)
        3
        >>> buf[0]
        '\x00'
        >>> buf
        <read-write buffer for 0x8af1e70, size 3, offset 1 at 0x8ba4ec0>
    """
    pass


def inner(*args, **kwargs):  # real signature unknown
    pass


def int_asbuffer(*args, **kwargs):  # real signature unknown
    pass


def lexsort(keys, axis=-1):  # real signature unknown; restored from __doc__
    """
    lexsort(keys, axis=-1)
    
        Perform an indirect sort using a sequence of keys.
    
        Given multiple sorting keys, which can be interpreted as columns in a
        spreadsheet, lexsort returns an array of integer indices that describes
        the sort order by multiple columns. The last key in the sequence is used
        for the primary sort order, the second-to-last key for the secondary sort
        order, and so on. The keys argument must be a sequence of objects that
        can be converted to arrays of the same shape. If a 2D array is provided
        for the keys argument, it's rows are interpreted as the sorting keys and
        sorting is according to the last row, second last row etc.
    
        Parameters
        ----------
        keys : (k,N) array or tuple containing k (N,)-shaped sequences
            The `k` different "columns" to be sorted.  The last column (or row if
            `keys` is a 2D array) is the primary sort key.
        axis : int, optional
            Axis to be indirectly sorted.  By default, sort over the last axis.
    
        Returns
        -------
        indices : (N,) ndarray of ints
            Array of indices that sort the keys along the specified axis.
    
        See Also
        --------
        argsort : Indirect sort.
        ndarray.sort : In-place sort.
        sort : Return a sorted copy of an array.
    
        Examples
        --------
        Sort names: first by surname, then by name.
    
        >>> surnames =    ('Hertz',    'Galilei', 'Hertz')
        >>> first_names = ('Heinrich', 'Galileo', 'Gustav')
        >>> ind = np.lexsort((first_names, surnames))
        >>> ind
        array([1, 2, 0])
    
        >>> [surnames[i] + ", " + first_names[i] for i in ind]
        ['Galilei, Galileo', 'Hertz, Gustav', 'Hertz, Heinrich']
    
        Sort two columns of numbers:
    
        >>> a = [1,5,1,4,3,4,4] # First column
        >>> b = [9,4,0,4,0,2,1] # Second column
        >>> ind = np.lexsort((b,a)) # Sort by a, then by b
        >>> print ind
        [2 0 4 6 5 3 1]
    
        >>> [(a[i],b[i]) for i in ind]
        [(1, 0), (1, 9), (3, 0), (4, 1), (4, 2), (4, 4), (5, 4)]
    
        Note that sorting is first according to the elements of ``a``.
        Secondary sorting is according to the elements of ``b``.
    
        A normal ``argsort`` would have yielded:
    
        >>> [(a[i],b[i]) for i in np.argsort(a)]
        [(1, 9), (1, 0), (3, 0), (4, 4), (4, 2), (4, 1), (5, 4)]
    
        Structured arrays are sorted lexically by ``argsort``:
    
        >>> x = np.array([(1,9), (5,4), (1,0), (4,4), (3,0), (4,2), (4,1)],
        ...              dtype=np.dtype([('x', int), ('y', int)]))
    
        >>> np.argsort(x) # or np.argsort(x, order=('x', 'y'))
        array([2, 0, 4, 6, 5, 3, 1])
    """
    pass


def newbuffer(size):  # real signature unknown; restored from __doc__
    """
    newbuffer(size)
    
        Return a new uninitialized buffer object of size bytes
    """
    pass


def putmask(a, mask, values):  # real signature unknown; restored from __doc__
    """
    putmask(a, mask, values)
    
        Changes elements of an array based on conditional and input values.
    
        Sets ``a.flat[n] = values[n]`` for each n where ``mask.flat[n]==True``.
    
        If `values` is not the same size as `a` and `mask` then it will repeat.
        This gives behavior different from ``a[mask] = values``.
    
        Parameters
        ----------
        a : array_like
            Target array.
        mask : array_like
            Boolean mask array. It has to be the same shape as `a`.
        values : array_like
            Values to put into `a` where `mask` is True. If `values` is smaller
            than `a` it will be repeated.
    
        See Also
        --------
        place, put, take
    
        Examples
        --------
        >>> x = np.arange(6).reshape(2, 3)
        >>> np.putmask(x, x>2, x**2)
        >>> x
        array([[ 0,  1,  2],
               [ 9, 16, 25]])
    
        If `values` is smaller than `a` it is repeated:
    
        >>> x = np.arange(5)
        >>> np.putmask(x, x>1, [-33, -44])
        >>> x
        array([  0,   1, -33, -44, -33])
    """
    pass


def scalar(dtype, obj):  # real signature unknown; restored from __doc__
    """
    scalar(dtype, obj)
    
        Return a new scalar array of the given type initialized with obj.
    
        This function is meant mainly for pickle support. `dtype` must be a
        valid data-type descriptor. If `dtype` corresponds to an object
        descriptor, then `obj` can be any object, otherwise `obj` must be a
        string. If `obj` is not given, it will be interpreted as None for object
        type and as zeros for all other types.
    """
    pass


# known case of numpy.core.multiarray.set_numeric_ops
def set_numeric_ops(**ops):
    """
    set_numeric_ops(op1=func1, op2=func2, ...)
    
        Set numerical operators for array objects.
    
        Parameters
        ----------
        op1, op2, ... : callable
            Each ``op = func`` pair describes an operator to be replaced.
            For example, ``add = lambda x, y: np.add(x, y) % 5`` would replace
            addition by modulus 5 addition.
    
        Returns
        -------
        saved_ops : list of callables
            A list of all operators, stored before making replacements.
    
        Notes
        -----
        .. WARNING::
           Use with care!  Incorrect usage may lead to memory errors.
    
        A function replacing an operator cannot make use of that operator.
        For example, when replacing add, you may not use ``+``.  Instead,
        directly call ufuncs.
    
        Examples
        --------
        >>> def add_mod5(x, y):
        ...     return np.add(x, y) % 5
        ...
        >>> old_funcs = np.set_numeric_ops(add=add_mod5)
    
        >>> x = np.arange(12).reshape((3, 4))
        >>> x + x
        array([[0, 2, 4, 1],
               [3, 0, 2, 4],
               [1, 3, 0, 2]])
    
        >>> ignore = np.set_numeric_ops(**old_funcs) # restore operators
    """
    pass


# real signature unknown; restored from __doc__
def set_string_function(f, repr=1):
    """
    set_string_function(f, repr=1)
    
        Internal method to set a function to be used when pretty printing arrays.
    """
    pass


def set_typeDict(dict):  # real signature unknown; restored from __doc__
    """
    set_typeDict(dict)
    
        Set the internal dictionary that can look up an array type using a
        registered code.
    """
    pass


def test_interrupt(*args, **kwargs):  # real signature unknown
    pass


# real signature unknown; restored from __doc__
def where(condition, x=None, y=None):
    """
    where(condition, [x, y])
    
        Return elements, either from `x` or `y`, depending on `condition`.
    
        If only `condition` is given, return ``condition.nonzero()``.
    
        Parameters
        ----------
        condition : array_like, bool
            When True, yield `x`, otherwise yield `y`.
        x, y : array_like, optional
            Values from which to choose. `x` and `y` need to have the same
            shape as `condition`.
    
        Returns
        -------
        out : ndarray or tuple of ndarrays
            If both `x` and `y` are specified, the output array contains
            elements of `x` where `condition` is True, and elements from
            `y` elsewhere.
    
            If only `condition` is given, return the tuple
            ``condition.nonzero()``, the indices where `condition` is True.
    
        See Also
        --------
        nonzero, choose
    
        Notes
        -----
        If `x` and `y` are given and input arrays are 1-D, `where` is
        equivalent to::
    
            [xv if c else yv for (c,xv,yv) in zip(condition,x,y)]
    
        Examples
        --------
        >>> np.where([[True, False], [True, True]],
        ...          [[1, 2], [3, 4]],
        ...          [[9, 8], [7, 6]])
        array([[1, 8],
               [3, 4]])
    
        >>> np.where([[0, 1], [1, 0]])
        (array([0, 1]), array([1, 0]))
    
        >>> x = np.arange(9.).reshape(3, 3)
        >>> np.where( x > 5 )
        (array([2, 2, 2]), array([0, 1, 2]))
        >>> x[np.where( x > 3.0 )]               # Note: result is 1D.
        array([ 4.,  5.,  6.,  7.,  8.])
        >>> np.where(x < 5, x, -1)               # Note: broadcasting.
        array([[ 0.,  1.,  2.],
               [ 3.,  4., -1.],
               [-1., -1., -1.]])
    """
    pass


# real signature unknown; restored from __doc__
def zeros(shape, dtype=None, order='C'):
    """
    zeros(shape, dtype=float, order='C')
    
        Return a new array of given shape and type, filled with zeros.
    
        Parameters
        ----------
        shape : int or sequence of ints
            Shape of the new array, e.g., ``(2, 3)`` or ``2``.
        dtype : data-type, optional
            The desired data-type for the array, e.g., `numpy.int8`.  Default is
            `numpy.float64`.
        order : {'C', 'F'}, optional
            Whether to store multidimensional data in C- or Fortran-contiguous
            (row- or column-wise) order in memory.
    
        Returns
        -------
        out : ndarray
            Array of zeros with the given shape, dtype, and order.
    
        See Also
        --------
        zeros_like : Return an array of zeros with shape and type of input.
        ones_like : Return an array of ones with shape and type of input.
        empty_like : Return an empty array with shape and type of input.
        ones : Return a new array setting values to one.
        empty : Return a new uninitialized array.
    
        Examples
        --------
        >>> np.zeros(5)
        array([ 0.,  0.,  0.,  0.,  0.])
    
        >>> np.zeros((5,), dtype=numpy.int)
        array([0, 0, 0, 0, 0])
    
        >>> np.zeros((2, 1))
        array([[ 0.],
               [ 0.]])
    
        >>> s = (2,2)
        >>> np.zeros(s)
        array([[ 0.,  0.],
               [ 0.,  0.]])
    
        >>> np.zeros((2,), dtype=[('x', 'i4'), ('y', 'i4')]) # custom dtype
        array([(0, 0), (0, 0)],
              dtype=[('x', '<i4'), ('y', '<i4')])
    """
    pass


def _fastCopyAndTranspose(a):  # real signature unknown; restored from __doc__
    """ _fastCopyAndTranspose(a) """
    pass


def _get_ndarray_c_version():  # real signature unknown; restored from __doc__
    """
    _get_ndarray_c_version()
    
        Return the compile time NDARRAY_VERSION number.
    """
    pass


# real signature unknown; restored from __doc__
def _reconstruct(subtype, shape, dtype):
    """
    _reconstruct(subtype, shape, dtype)
    
        Construct an empty array. Used by Pickles.
    """
    pass


def _vec_string(*args, **kwargs):  # real signature unknown
    pass


# classes

class broadcast(object):

    """
    Produce an object that mimics broadcasting.
    
        Parameters
        ----------
        in1, in2, ... : array_like
            Input parameters.
    
        Returns
        -------
        b : broadcast object
            Broadcast the input parameters against one another, and
            return an object that encapsulates the result.
            Amongst others, it has ``shape`` and ``nd`` properties, and
            may be used as an iterator.
    
        Examples
        --------
        Manually adding two vectors, using broadcasting:
    
        >>> x = np.array([[1], [2], [3]])
        >>> y = np.array([4, 5, 6])
        >>> b = np.broadcast(x, y)
    
        >>> out = np.empty(b.shape)
        >>> out.flat = [u+v for (u,v) in b]
        >>> out
        array([[ 5.,  6.,  7.],
               [ 6.,  7.,  8.],
               [ 7.,  8.,  9.]])
    
        Compare against built-in broadcasting:
    
        >>> x + y
        array([[5, 6, 7],
               [6, 7, 8],
               [7, 8, 9]])
    """

    def next(self):  # real signature unknown; restored from __doc__
        """ x.next() -> the next value, or raise StopIteration """
        pass

    def reset(self, *args, **kwargs):  # real signature unknown
        pass

    def __init__(self, x, y):  # real signature unknown; restored from __doc__
        pass

    def __iter__(self):  # real signature unknown; restored from __doc__
        """ x.__iter__() <==> iter(x) """
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    index = property(lambda self: object())  # default
    iters = property(lambda self: object())  # default
    nd = property(lambda self: object())  # default
    numiter = property(lambda self: object())  # default
    shape = property(lambda self: object())  # default
    size = property(lambda self: object())  # default


class dtype(object):

    """
    dtype(obj, align=False, copy=False)
    
        Create a data type object.
    
        A numpy array is homogeneous, and contains elements described by a
        dtype object. A dtype object can be constructed from different
        combinations of fundamental numeric types.
    
        Parameters
        ----------
        obj
            Object to be converted to a data type object.
        align : bool, optional
            Add padding to the fields to match what a C compiler would output
            for a similar C-struct. Can be ``True`` only if `obj` is a dictionary
            or a comma-separated string.
        copy : bool, optional
            Make a new copy of the data-type object. If ``False``, the result
            may just be a reference to a built-in data-type object.
    
        Examples
        --------
        Using array-scalar type:
    
        >>> np.dtype(np.int16)
        dtype('int16')
    
        Record, one field name 'f1', containing int16:
    
        >>> np.dtype([('f1', np.int16)])
        dtype([('f1', '<i2')])
    
        Record, one field named 'f1', in itself containing a record with one field:
    
        >>> np.dtype([('f1', [('f1', np.int16)])])
        dtype([('f1', [('f1', '<i2')])])
    
        Record, two fields: the first field contains an unsigned int, the
        second an int32:
    
        >>> np.dtype([('f1', np.uint), ('f2', np.int32)])
        dtype([('f1', '<u4'), ('f2', '<i4')])
    
        Using array-protocol type strings:
    
        >>> np.dtype([('a','f8'),('b','S10')])
        dtype([('a', '<f8'), ('b', '|S10')])
    
        Using comma-separated field formats.  The shape is (2,3):
    
        >>> np.dtype("i4, (2,3)f8")
        dtype([('f0', '<i4'), ('f1', '<f8', (2, 3))])
    
        Using tuples.  ``int`` is a fixed type, 3 the field's shape.  ``void``
        is a flexible type, here of size 10:
    
        >>> np.dtype([('hello',(np.int,3)),('world',np.void,10)])
        dtype([('hello', '<i4', 3), ('world', '|V10')])
    
        Subdivide ``int16`` into 2 ``int8``'s, called x and y.  0 and 1 are
        the offsets in bytes:
    
        >>> np.dtype((np.int16, {'x':(np.int8,0), 'y':(np.int8,1)}))
        dtype(('<i2', [('x', '|i1'), ('y', '|i1')]))
    
        Using dictionaries.  Two fields named 'gender' and 'age':
    
        >>> np.dtype({'names':['gender','age'], 'formats':['S1',np.uint8]})
        dtype([('gender', '|S1'), ('age', '|u1')])
    
        Offsets in bytes, here 0 and 25:
    
        >>> np.dtype({'surname':('S25',0),'age':(np.uint8,25)})
        dtype([('surname', '|S25'), ('age', '|u1')])
    """
    # real signature unknown; restored from __doc__

    def newbyteorder(self, new_order='S'):
        """
        newbyteorder(new_order='S')
        
            Return a new dtype with a different byte order.
        
            Changes are also made in all fields and sub-arrays of the data type.
        
            Parameters
            ----------
            new_order : string, optional
                Byte order to force; a value from the byte order
                specifications below.  The default value ('S') results in
                swapping the current byte order.
                `new_order` codes can be any of::
        
                 * 'S' - swap dtype from current to opposite endian
                 * {'<', 'L'} - little endian
                 * {'>', 'B'} - big endian
                 * {'=', 'N'} - native order
                 * {'|', 'I'} - ignore (no change to byte order)
        
                The code does a case-insensitive check on the first letter of
                `new_order` for these alternatives.  For example, any of '>'
                or 'B' or 'b' or 'brian' are valid to specify big-endian.
        
            Returns
            -------
            new_dtype : dtype
                New dtype object with the given change to the byte order.
        
            Notes
            -----
            Changes are also made in all fields and sub-arrays of the data type.
        
            Examples
            --------
            >>> import sys
            >>> sys_is_le = sys.byteorder == 'little'
            >>> native_code = sys_is_le and '<' or '>'
            >>> swapped_code = sys_is_le and '>' or '<'
            >>> native_dt = np.dtype(native_code+'i2')
            >>> swapped_dt = np.dtype(swapped_code+'i2')
            >>> native_dt.newbyteorder('S') == swapped_dt
            True
            >>> native_dt.newbyteorder() == swapped_dt
            True
            >>> native_dt == swapped_dt.newbyteorder('S')
            True
            >>> native_dt == swapped_dt.newbyteorder('=')
            True
            >>> native_dt == swapped_dt.newbyteorder('N')
            True
            >>> native_dt == native_dt.newbyteorder('|')
            True
            >>> np.dtype('<i2') == native_dt.newbyteorder('<')
            True
            >>> np.dtype('<i2') == native_dt.newbyteorder('L')
            True
            >>> np.dtype('>i2') == native_dt.newbyteorder('>')
            True
            >>> np.dtype('>i2') == native_dt.newbyteorder('B')
            True
        """
        pass

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    def __ge__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ge__(y) <==> x>=y """
        pass

    def __gt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__gt__(y) <==> x>y """
        pass

    def __hash__(self):  # real signature unknown; restored from __doc__
        """ x.__hash__() <==> hash(x) """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, obj, align=False, copy=False):
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __mul__(self, n):  # real signature unknown; restored from __doc__
        """ x.__mul__(n) <==> x*n """
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    def __reduce__(self, *args, **kwargs):  # real signature unknown
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    def __rmul__(self, n):  # real signature unknown; restored from __doc__
        """ x.__rmul__(n) <==> n*x """
        pass

    def __setstate__(self, *args, **kwargs):  # real signature unknown
        pass

    def __str__(self):  # real signature unknown; restored from __doc__
        """ x.__str__() <==> str(x) """
        pass

    alignment = property(lambda self: object())  # default
    base = property(lambda self: object())  # default
    byteorder = property(lambda self: object())  # default
    char = property(lambda self: object())  # default
    descr = property(lambda self: object())  # default
    fields = property(lambda self: object())  # default
    flags = property(lambda self: object())  # default
    hasobject = property(lambda self: object())  # default
    isbuiltin = property(lambda self: object())  # default
    isnative = property(lambda self: object())  # default
    itemsize = property(lambda self: object())  # default
    kind = property(lambda self: object())  # default
    metadata = property(lambda self: object())  # default
    name = property(lambda self: object())  # default
    names = property(lambda self: object())  # default
    num = property(lambda self: object())  # default
    shape = property(lambda self: object())  # default
    str = property(lambda self: object())  # default
    subdtype = property(lambda self: object())  # default
    type = property(lambda self: object())  # default


class flagsobj(object):
    # no doc

    def __cmp__(self, y):  # real signature unknown; restored from __doc__
        """ x.__cmp__(y) <==> cmp(x,y) """
        pass

    def __delitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__delitem__(y) <==> del x[y] """
        pass

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    def __ge__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ge__(y) <==> x>=y """
        pass

    def __gt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__gt__(y) <==> x>y """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    # real signature unknown; restored from __doc__
    def __setitem__(self, i, y):
        """ x.__setitem__(i, y) <==> x[i]=y """
        pass

    def __str__(self):  # real signature unknown; restored from __doc__
        """ x.__str__() <==> str(x) """
        pass

    aligned = property(lambda self: object())  # default
    behaved = property(lambda self: object())  # default
    carray = property(lambda self: object())  # default
    contiguous = property(lambda self: object())  # default
    c_contiguous = property(lambda self: object())  # default
    farray = property(lambda self: object())  # default
    fnc = property(lambda self: object())  # default
    forc = property(lambda self: object())  # default
    fortran = property(lambda self: object())  # default
    f_contiguous = property(lambda self: object())  # default
    num = property(lambda self: object())  # default
    owndata = property(lambda self: object())  # default
    updateifcopy = property(lambda self: object())  # default
    writeable = property(lambda self: object())  # default


class flatiter(object):

    """
    Flat iterator object to iterate over arrays.
    
        A `flatiter` iterator is returned by ``x.flat`` for any array `x`.
        It allows iterating over the array as if it were a 1-D array,
        either in a for-loop or by calling its `next` method.
    
        Iteration is done in C-contiguous style, with the last index varying the
        fastest. The iterator can also be indexed using basic slicing or
        advanced indexing.
    
        See Also
        --------
        ndarray.flat : Return a flat iterator over an array.
        ndarray.flatten : Returns a flattened copy of an array.
    
        Notes
        -----
        A `flatiter` iterator can not be constructed directly from Python code
        by calling the `flatiter` constructor.
    
        Examples
        --------
        >>> x = np.arange(6).reshape(2, 3)
        >>> fl = x.flat
        >>> type(fl)
        <type 'numpy.flatiter'>
        >>> for item in fl:
        ...     print item
        ...
        0
        1
        2
        3
        4
        5
    
        >>> fl[2:4]
        array([2, 3])
    """

    def copy(self):  # real signature unknown; restored from __doc__
        """
        copy()
        
            Get a copy of the iterator as a 1-D array.
        
            Examples
            --------
            >>> x = np.arange(6).reshape(2, 3)
            >>> x
            array([[0, 1, 2],
                   [3, 4, 5]])
            >>> fl = x.flat
            >>> fl.copy()
            array([0, 1, 2, 3, 4, 5])
        """
        pass

    def next(self):  # real signature unknown; restored from __doc__
        """ x.next() -> the next value, or raise StopIteration """
        pass

    # real signature unknown; restored from __doc__
    def __array__(self, type=None):
        """ __array__(type=None) Get array from iterator """
        pass

    def __delitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__delitem__(y) <==> del x[y] """
        pass

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    def __ge__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ge__(y) <==> x>=y """
        pass

    def __gt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__gt__(y) <==> x>y """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    def __iter__(self):  # real signature unknown; restored from __doc__
        """ x.__iter__() <==> iter(x) """
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    # real signature unknown; restored from __doc__
    def __setitem__(self, i, y):
        """ x.__setitem__(i, y) <==> x[i]=y """
        pass

    base = property(lambda self: object())  # default
    coords = property(lambda self: object())  # default
    index = property(lambda self: object())  # default


class ndarray(object):

    """
    ndarray(shape, dtype=float, buffer=None, offset=0,
                strides=None, order=None)
    
        An array object represents a multidimensional, homogeneous array
        of fixed-size items.  An associated data-type object describes the
        format of each element in the array (its byte-order, how many bytes it
        occupies in memory, whether it is an integer, a floating point number,
        or something else, etc.)
    
        Arrays should be constructed using `array`, `zeros` or `empty` (refer
        to the See Also section below).  The parameters given here refer to
        a low-level method (`ndarray(...)`) for instantiating an array.
    
        For more information, refer to the `numpy` module and examine the
        the methods and attributes of an array.
    
        Parameters
        ----------
        (for the __new__ method; see Notes below)
    
        shape : tuple of ints
            Shape of created array.
        dtype : data-type, optional
            Any object that can be interpreted as a numpy data type.
        buffer : object exposing buffer interface, optional
            Used to fill the array with data.
        offset : int, optional
            Offset of array data in buffer.
        strides : tuple of ints, optional
            Strides of data in memory.
        order : {'C', 'F'}, optional
            Row-major or column-major order.
    
        Attributes
        ----------
        T : ndarray
            Transpose of the array.
        data : buffer
            The array's elements, in memory.
        dtype : dtype object
            Describes the format of the elements in the array.
        flags : dict
            Dictionary containing information related to memory use, e.g.,
            'C_CONTIGUOUS', 'OWNDATA', 'WRITEABLE', etc.
        flat : numpy.flatiter object
            Flattened version of the array as an iterator.  The iterator
            allows assignments, e.g., ``x.flat = 3`` (See `ndarray.flat` for
            assignment examples; TODO).
        imag : ndarray
            Imaginary part of the array.
        real : ndarray
            Real part of the array.
        size : int
            Number of elements in the array.
        itemsize : int
            The memory use of each array element in bytes.
        nbytes : int
            The total number of bytes required to store the array data,
            i.e., ``itemsize * size``.
        ndim : int
            The array's number of dimensions.
        shape : tuple of ints
            Shape of the array.
        strides : tuple of ints
            The step-size required to move from one element to the next in
            memory. For example, a contiguous ``(3, 4)`` array of type
            ``int16`` in C-order has strides ``(8, 2)``.  This implies that
            to move from element to element in memory requires jumps of 2 bytes.
            To move from row-to-row, one needs to jump 8 bytes at a time
            (``2 * 4``).
        ctypes : ctypes object
            Class containing properties of the array needed for interaction
            with ctypes.
        base : ndarray
            If the array is a view into another array, that array is its `base`
            (unless that array is also a view).  The `base` array is where the
            array data is actually stored.
    
        See Also
        --------
        array : Construct an array.
        zeros : Create an array, each element of which is zero.
        empty : Create an array, but leave its allocated memory unchanged (i.e.,
                it contains "garbage").
        dtype : Create a data-type.
    
        Notes
        -----
        There are two modes of creating an array using ``__new__``:
    
        1. If `buffer` is None, then only `shape`, `dtype`, and `order`
           are used.
        2. If `buffer` is an object exposing the buffer interface, then
           all keywords are interpreted.
    
        No ``__init__`` method is needed because the array is fully initialized
        after the ``__new__`` method.
    
        Examples
        --------
        These examples illustrate the low-level `ndarray` constructor.  Refer
        to the `See Also` section above for easier ways of constructing an
        ndarray.
    
        First mode, `buffer` is None:
    
        >>> np.ndarray(shape=(2,2), dtype=float, order='F')
        array([[ -1.13698227e+002,   4.25087011e-303],
               [  2.88528414e-306,   3.27025015e-309]])         #random
    
        Second mode:
    
        >>> np.ndarray((2,), buffer=np.array([1,2,3]),
        ...            offset=np.int_().itemsize,
        ...            dtype=int) # offset = 1*itemsize, i.e. skip first element
        array([2, 3])
    """
    # real signature unknown; restored from __doc__

    def all(self, axis=None, out=None):
        """
        a.all(axis=None, out=None)
        
            Returns True if all elements evaluate to True.
        
            Refer to `numpy.all` for full documentation.
        
            See Also
            --------
            numpy.all : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def any(self, axis=None, out=None):
        """
        a.any(axis=None, out=None)
        
            Returns True if any of the elements of `a` evaluate to True.
        
            Refer to `numpy.any` for full documentation.
        
            See Also
            --------
            numpy.any : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def argmax(self, axis=None, out=None):
        """
        a.argmax(axis=None, out=None)
        
            Return indices of the maximum values along the given axis.
        
            Refer to `numpy.argmax` for full documentation.
        
            See Also
            --------
            numpy.argmax : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def argmin(self, axis=None, out=None):
        """
        a.argmin(axis=None, out=None)
        
            Return indices of the minimum values along the given axis of `a`.
        
            Refer to `numpy.argmin` for detailed documentation.
        
            See Also
            --------
            numpy.argmin : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def argsort(self, axis=-1, kind='quicksort', order=None):
        """
        a.argsort(axis=-1, kind='quicksort', order=None)
        
            Returns the indices that would sort this array.
        
            Refer to `numpy.argsort` for full documentation.
        
            See Also
            --------
            numpy.argsort : equivalent function
        """
        pass

    def astype(self, t):  # real signature unknown; restored from __doc__
        """
        a.astype(t)
        
            Copy of the array, cast to a specified type.
        
            Parameters
            ----------
            t : string or dtype
                Typecode or data-type to which the array is cast.
        
            Examples
            --------
            >>> x = np.array([1, 2, 2.5])
            >>> x
            array([ 1. ,  2. ,  2.5])
        
            >>> x.astype(int)
            array([1, 2, 2])
        """
        pass

    # real signature unknown; restored from __doc__
    def byteswap(self, inplace):
        """
        a.byteswap(inplace)
        
            Swap the bytes of the array elements
        
            Toggle between low-endian and big-endian data representation by
            returning a byteswapped array, optionally swapped in-place.
        
            Parameters
            ----------
            inplace: bool, optional
                If ``True``, swap bytes in-place, default is ``False``.
        
            Returns
            -------
            out: ndarray
                The byteswapped array. If `inplace` is ``True``, this is
                a view to self.
        
            Examples
            --------
            >>> A = np.array([1, 256, 8755], dtype=np.int16)
            >>> map(hex, A)
            ['0x1', '0x100', '0x2233']
            >>> A.byteswap(True)
            array([  256,     1, 13090], dtype=int16)
            >>> map(hex, A)
            ['0x100', '0x1', '0x3322']
        
            Arrays of strings are not swapped
        
            >>> A = np.array(['ceg', 'fac'])
            >>> A.byteswap()
            array(['ceg', 'fac'],
                  dtype='|S3')
        """
        pass

    # real signature unknown; restored from __doc__
    def choose(self, choices, out=None, mode='raise'):
        """
        a.choose(choices, out=None, mode='raise')
        
            Use an index array to construct a new array from a set of choices.
        
            Refer to `numpy.choose` for full documentation.
        
            See Also
            --------
            numpy.choose : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def clip(self, a_min, a_max, out=None):
        """
        a.clip(a_min, a_max, out=None)
        
            Return an array whose values are limited to ``[a_min, a_max]``.
        
            Refer to `numpy.clip` for full documentation.
        
            See Also
            --------
            numpy.clip : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def compress(self, condition, axis=None, out=None):
        """
        a.compress(condition, axis=None, out=None)
        
            Return selected slices of this array along given axis.
        
            Refer to `numpy.compress` for full documentation.
        
            See Also
            --------
            numpy.compress : equivalent function
        """
        pass

    def conj(self):  # real signature unknown; restored from __doc__
        """
        a.conj()
        
            Complex-conjugate all elements.
        
            Refer to `numpy.conjugate` for full documentation.
        
            See Also
            --------
            numpy.conjugate : equivalent function
        """
        pass

    def conjugate(self):  # real signature unknown; restored from __doc__
        """
        a.conjugate()
        
            Return the complex conjugate, element-wise.
        
            Refer to `numpy.conjugate` for full documentation.
        
            See Also
            --------
            numpy.conjugate : equivalent function
        """
        pass

    def copy(self, order='C'):  # real signature unknown; restored from __doc__
        """
        a.copy(order='C')
        
            Return a copy of the array.
        
            Parameters
            ----------
            order : {'C', 'F', 'A'}, optional
                By default, the result is stored in C-contiguous (row-major) order in
                memory.  If `order` is `F`, the result has 'Fortran' (column-major)
                order.  If order is 'A' ('Any'), then the result has the same order
                as the input.
        
            Examples
            --------
            >>> x = np.array([[1,2,3],[4,5,6]], order='F')
        
            >>> y = x.copy()
        
            >>> x.fill(0)
        
            >>> x
            array([[0, 0, 0],
                   [0, 0, 0]])
        
            >>> y
            array([[1, 2, 3],
                   [4, 5, 6]])
        
            >>> y.flags['C_CONTIGUOUS']
            True
        """
        pass

    # real signature unknown; restored from __doc__
    def cumprod(self, axis=None, dtype=None, out=None):
        """
        a.cumprod(axis=None, dtype=None, out=None)
        
            Return the cumulative product of the elements along the given axis.
        
            Refer to `numpy.cumprod` for full documentation.
        
            See Also
            --------
            numpy.cumprod : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def cumsum(self, axis=None, dtype=None, out=None):
        """
        a.cumsum(axis=None, dtype=None, out=None)
        
            Return the cumulative sum of the elements along the given axis.
        
            Refer to `numpy.cumsum` for full documentation.
        
            See Also
            --------
            numpy.cumsum : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def diagonal(self, offset=0, axis1=0, axis2=1):
        """
        a.diagonal(offset=0, axis1=0, axis2=1)
        
            Return specified diagonals.
        
            Refer to `numpy.diagonal` for full documentation.
        
            See Also
            --------
            numpy.diagonal : equivalent function
        """
        pass

    def dot(self, *args, **kwargs):  # real signature unknown
        pass

    def dump(self, file):  # real signature unknown; restored from __doc__
        """
        a.dump(file)
        
            Dump a pickle of the array to the specified file.
            The array can be read back with pickle.load or numpy.load.
        
            Parameters
            ----------
            file : str
                A string naming the dump file.
        """
        pass

    def dumps(self):  # real signature unknown; restored from __doc__
        """
        a.dumps()
        
            Returns the pickle of the array as a string.
            pickle.loads or numpy.loads will convert the string back to an array.
        
            Parameters
            ----------
            None
        """
        pass

    def fill(self, value):  # real signature unknown; restored from __doc__
        """
        a.fill(value)
        
            Fill the array with a scalar value.
        
            Parameters
            ----------
            value : scalar
                All elements of `a` will be assigned this value.
        
            Examples
            --------
            >>> a = np.array([1, 2])
            >>> a.fill(0)
            >>> a
            array([0, 0])
            >>> a = np.empty(2)
            >>> a.fill(1)
            >>> a
            array([ 1.,  1.])
        """
        pass

    # real signature unknown; restored from __doc__
    def flatten(self, order='C'):
        """
        a.flatten(order='C')
        
            Return a copy of the array collapsed into one dimension.
        
            Parameters
            ----------
            order : {'C', 'F'}, optional
                Whether to flatten in C (row-major) or Fortran (column-major) order.
                The default is 'C'.
        
            Returns
            -------
            y : ndarray
                A copy of the input array, flattened to one dimension.
        
            See Also
            --------
            ravel : Return a flattened array.
            flat : A 1-D flat iterator over the array.
        
            Examples
            --------
            >>> a = np.array([[1,2], [3,4]])
            >>> a.flatten()
            array([1, 2, 3, 4])
            >>> a.flatten('F')
            array([1, 3, 2, 4])
        """
        pass

    # real signature unknown; restored from __doc__
    def getfield(self, dtype, offset):
        """
        a.getfield(dtype, offset)
        
            Returns a field of the given array as a certain type.
        
            A field is a view of the array data with each itemsize determined
            by the given type and the offset into the current array, i.e. from
            ``offset * dtype.itemsize`` to ``(offset+1) * dtype.itemsize``.
        
            Parameters
            ----------
            dtype : str
                String denoting the data type of the field.
            offset : int
                Number of `dtype.itemsize`'s to skip before beginning the element view.
        
            Examples
            --------
            >>> x = np.diag([1.+1.j]*2)
            >>> x
            array([[ 1.+1.j,  0.+0.j],
                   [ 0.+0.j,  1.+1.j]])
            >>> x.dtype
            dtype('complex128')
        
            >>> x.getfield('complex64', 0) # Note how this != x
            array([[ 0.+1.875j,  0.+0.j   ],
                   [ 0.+0.j   ,  0.+1.875j]], dtype=complex64)
        
            >>> x.getfield('complex64',1) # Note how different this is than x
            array([[ 0. +5.87173204e-39j,  0. +0.00000000e+00j],
                   [ 0. +0.00000000e+00j,  0. +5.87173204e-39j]], dtype=complex64)
        
            >>> x.getfield('complex128', 0) # == x
            array([[ 1.+1.j,  0.+0.j],
                   [ 0.+0.j,  1.+1.j]])
        
            If the argument dtype is the same as x.dtype, then offset != 0 raises
            a ValueError:
        
            >>> x.getfield('complex128', 1)
            Traceback (most recent call last):
              File "<stdin>", line 1, in <module>
            ValueError: Need 0 <= offset <= 0 for requested type but received offset = 1
        
            >>> x.getfield('float64', 0)
            array([[ 1.,  0.],
                   [ 0.,  1.]])
        
            >>> x.getfield('float64', 1)
            array([[  1.77658241e-307,   0.00000000e+000],
                   [  0.00000000e+000,   1.77658241e-307]])
        """
        pass

    def item(self, *args):  # real signature unknown; restored from __doc__
        """
        a.item(*args)
        
            Copy an element of an array to a standard Python scalar and return it.
        
            Parameters
            ----------
            \*args : Arguments (variable number and type)
        
                * none: in this case, the method only works for arrays
                  with one element (`a.size == 1`), which element is
                  copied into a standard Python scalar object and returned.
        
                * int_type: this argument is interpreted as a flat index into
                  the array, specifying which element to copy and return.
        
                * tuple of int_types: functions as does a single int_type argument,
                  except that the argument is interpreted as an nd-index into the
                  array.
        
            Returns
            -------
            z : Standard Python scalar object
                A copy of the specified element of the array as a suitable
                Python scalar
        
            Notes
            -----
            When the data type of `a` is longdouble or clongdouble, item() returns
            a scalar array object because there is no available Python scalar that
            would not lose information. Void arrays return a buffer object for item(),
            unless fields are defined, in which case a tuple is returned.
        
            `item` is very similar to a[args], except, instead of an array scalar,
            a standard Python scalar is returned. This can be useful for speeding up
            access to elements of the array and doing arithmetic on elements of the
            array using Python's optimized math.
        
            Examples
            --------
            >>> x = np.random.randint(9, size=(3, 3))
            >>> x
            array([[3, 1, 7],
                   [2, 8, 3],
                   [8, 5, 3]])
            >>> x.item(3)
            2
            >>> x.item(7)
            5
            >>> x.item((0, 1))
            1
            >>> x.item((2, 2))
            3
        """
        pass

    def itemset(self, *args):  # real signature unknown; restored from __doc__
        """
        a.itemset(*args)
        
            Insert scalar into an array (scalar is cast to array's dtype, if possible)
        
            There must be at least 1 argument, and define the last argument
            as *item*.  Then, ``a.itemset(*args)`` is equivalent to but faster
            than ``a[args] = item``.  The item should be a scalar value and `args`
            must select a single item in the array `a`.
        
            Parameters
            ----------
            \*args : Arguments
                If one argument: a scalar, only used in case `a` is of size 1.
                If two arguments: the last argument is the value to be set
                and must be a scalar, the first argument specifies a single array
                element location. It is either an int or a tuple.
        
            Notes
            -----
            Compared to indexing syntax, `itemset` provides some speed increase
            for placing a scalar into a particular location in an `ndarray`,
            if you must do this.  However, generally this is discouraged:
            among other problems, it complicates the appearance of the code.
            Also, when using `itemset` (and `item`) inside a loop, be sure
            to assign the methods to a local variable to avoid the attribute
            look-up at each loop iteration.
        
            Examples
            --------
            >>> x = np.random.randint(9, size=(3, 3))
            >>> x
            array([[3, 1, 7],
                   [2, 8, 3],
                   [8, 5, 3]])
            >>> x.itemset(4, 0)
            >>> x.itemset((2, 2), 9)
            >>> x
            array([[3, 1, 7],
                   [2, 0, 3],
                   [8, 5, 9]])
        """
        pass

    # real signature unknown; restored from __doc__
    def max(self, axis=None, out=None):
        """
        a.max(axis=None, out=None)
        
            Return the maximum along a given axis.
        
            Refer to `numpy.amax` for full documentation.
        
            See Also
            --------
            numpy.amax : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def mean(self, axis=None, dtype=None, out=None):
        """
        a.mean(axis=None, dtype=None, out=None)
        
            Returns the average of the array elements along given axis.
        
            Refer to `numpy.mean` for full documentation.
        
            See Also
            --------
            numpy.mean : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def min(self, axis=None, out=None):
        """
        a.min(axis=None, out=None)
        
            Return the minimum along a given axis.
        
            Refer to `numpy.amin` for full documentation.
        
            See Also
            --------
            numpy.amin : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def newbyteorder(self, new_order='S'):
        """
        arr.newbyteorder(new_order='S')
        
            Return the array with the same data viewed with a different byte order.
        
            Equivalent to::
        
                arr.view(arr.dtype.newbytorder(new_order))
        
            Changes are also made in all fields and sub-arrays of the array data
            type.
        
        
        
            Parameters
            ----------
            new_order : string, optional
                Byte order to force; a value from the byte order specifications
                above. `new_order` codes can be any of::
        
                 * 'S' - swap dtype from current to opposite endian
                 * {'<', 'L'} - little endian
                 * {'>', 'B'} - big endian
                 * {'=', 'N'} - native order
                 * {'|', 'I'} - ignore (no change to byte order)
        
                The default value ('S') results in swapping the current
                byte order. The code does a case-insensitive check on the first
                letter of `new_order` for the alternatives above.  For example,
                any of 'B' or 'b' or 'biggish' are valid to specify big-endian.
        
        
            Returns
            -------
            new_arr : array
                New array object with the dtype reflecting given change to the
                byte order.
        """
        pass

    def nonzero(self):  # real signature unknown; restored from __doc__
        """
        a.nonzero()
        
            Return the indices of the elements that are non-zero.
        
            Refer to `numpy.nonzero` for full documentation.
        
            See Also
            --------
            numpy.nonzero : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def prod(self, axis=None, dtype=None, out=None):
        """
        a.prod(axis=None, dtype=None, out=None)
        
            Return the product of the array elements over the given axis
        
            Refer to `numpy.prod` for full documentation.
        
            See Also
            --------
            numpy.prod : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def ptp(self, axis=None, out=None):
        """
        a.ptp(axis=None, out=None)
        
            Peak to peak (maximum - minimum) value along a given axis.
        
            Refer to `numpy.ptp` for full documentation.
        
            See Also
            --------
            numpy.ptp : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def put(self, indices, values, mode='raise'):
        """
        a.put(indices, values, mode='raise')
        
            Set ``a.flat[n] = values[n]`` for all `n` in indices.
        
            Refer to `numpy.put` for full documentation.
        
            See Also
            --------
            numpy.put : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def ravel(self, order=None):
        """
        a.ravel([order])
        
            Return a flattened array.
        
            Refer to `numpy.ravel` for full documentation.
        
            See Also
            --------
            numpy.ravel : equivalent function
        
            ndarray.flat : a flat iterator on the array.
        """
        pass

    # real signature unknown; restored from __doc__
    def repeat(self, repeats, axis=None):
        """
        a.repeat(repeats, axis=None)
        
            Repeat elements of an array.
        
            Refer to `numpy.repeat` for full documentation.
        
            See Also
            --------
            numpy.repeat : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def reshape(self, shape, order='C'):
        """
        a.reshape(shape, order='C')
        
            Returns an array containing the same data with a new shape.
        
            Refer to `numpy.reshape` for full documentation.
        
            See Also
            --------
            numpy.reshape : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def resize(self, new_shape, refcheck=True):
        """
        a.resize(new_shape, refcheck=True)
        
            Change shape and size of array in-place.
        
            Parameters
            ----------
            new_shape : tuple of ints, or `n` ints
                Shape of resized array.
            refcheck : bool, optional
                If False, reference count will not be checked. Default is True.
        
            Returns
            -------
            None
        
            Raises
            ------
            ValueError
                If `a` does not own its own data or references or views to it exist,
                and the data memory must be changed.
        
            SystemError
                If the `order` keyword argument is specified. This behaviour is a
                bug in NumPy.
        
            See Also
            --------
            resize : Return a new array with the specified shape.
        
            Notes
            -----
            This reallocates space for the data area if necessary.
        
            Only contiguous arrays (data elements consecutive in memory) can be
            resized.
        
            The purpose of the reference count check is to make sure you
            do not use this array as a buffer for another Python object and then
            reallocate the memory. However, reference counts can increase in
            other ways so if you are sure that you have not shared the memory
            for this array with another Python object, then you may safely set
            `refcheck` to False.
        
            Examples
            --------
            Shrinking an array: array is flattened (in the order that the data are
            stored in memory), resized, and reshaped:
        
            >>> a = np.array([[0, 1], [2, 3]], order='C')
            >>> a.resize((2, 1))
            >>> a
            array([[0],
                   [1]])
        
            >>> a = np.array([[0, 1], [2, 3]], order='F')
            >>> a.resize((2, 1))
            >>> a
            array([[0],
                   [2]])
        
            Enlarging an array: as above, but missing entries are filled with zeros:
        
            >>> b = np.array([[0, 1], [2, 3]])
            >>> b.resize(2, 3) # new_shape parameter doesn't have to be a tuple
            >>> b
            array([[0, 1, 2],
                   [3, 0, 0]])
        
            Referencing an array prevents resizing...
        
            >>> c = a
            >>> a.resize((1, 1))
            Traceback (most recent call last):
            ...
            ValueError: cannot resize an array that has been referenced ...
        
            Unless `refcheck` is False:
        
            >>> a.resize((1, 1), refcheck=False)
            >>> a
            array([[0]])
            >>> c
            array([[0]])
        """
        pass

    # real signature unknown; restored from __doc__
    def round(self, decimals=0, out=None):
        """
        a.round(decimals=0, out=None)
        
            Return `a` with each element rounded to the given number of decimals.
        
            Refer to `numpy.around` for full documentation.
        
            See Also
            --------
            numpy.around : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def searchsorted(self, v, side='left'):
        """
        a.searchsorted(v, side='left')
        
            Find indices where elements of v should be inserted in a to maintain order.
        
            For full documentation, see `numpy.searchsorted`
        
            See Also
            --------
            numpy.searchsorted : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def setfield(self, val, dtype, offset=0):
        """
        a.setfield(val, dtype, offset=0)
        
            Put a value into a specified place in a field defined by a data-type.
        
            Place `val` into `a`'s field defined by `dtype` and beginning `offset`
            bytes into the field.
        
            Parameters
            ----------
            val : object
                Value to be placed in field.
            dtype : dtype object
                Data-type of the field in which to place `val`.
            offset : int, optional
                The number of bytes into the field at which to place `val`.
        
            Returns
            -------
            None
        
            See Also
            --------
            getfield
        
            Examples
            --------
            >>> x = np.eye(3)
            >>> x.getfield(np.float64)
            array([[ 1.,  0.,  0.],
                   [ 0.,  1.,  0.],
                   [ 0.,  0.,  1.]])
            >>> x.setfield(3, np.int32)
            >>> x.getfield(np.int32)
            array([[3, 3, 3],
                   [3, 3, 3],
                   [3, 3, 3]])
            >>> x
            array([[  1.00000000e+000,   1.48219694e-323,   1.48219694e-323],
                   [  1.48219694e-323,   1.00000000e+000,   1.48219694e-323],
                   [  1.48219694e-323,   1.48219694e-323,   1.00000000e+000]])
            >>> x.setfield(np.eye(3), np.int32)
            >>> x
            array([[ 1.,  0.,  0.],
                   [ 0.,  1.,  0.],
                   [ 0.,  0.,  1.]])
        """
        pass

    # real signature unknown; restored from __doc__
    def setflags(self, write=None, align=None, uic=None):
        """
        a.setflags(write=None, align=None, uic=None)
        
            Set array flags WRITEABLE, ALIGNED, and UPDATEIFCOPY, respectively.
        
            These Boolean-valued flags affect how numpy interprets the memory
            area used by `a` (see Notes below). The ALIGNED flag can only
            be set to True if the data is actually aligned according to the type.
            The UPDATEIFCOPY flag can never be set to True. The flag WRITEABLE
            can only be set to True if the array owns its own memory, or the
            ultimate owner of the memory exposes a writeable buffer interface,
            or is a string. (The exception for string is made so that unpickling
            can be done without copying memory.)
        
            Parameters
            ----------
            write : bool, optional
                Describes whether or not `a` can be written to.
            align : bool, optional
                Describes whether or not `a` is aligned properly for its type.
            uic : bool, optional
                Describes whether or not `a` is a copy of another "base" array.
        
            Notes
            -----
            Array flags provide information about how the memory area used
            for the array is to be interpreted. There are 6 Boolean flags
            in use, only three of which can be changed by the user:
            UPDATEIFCOPY, WRITEABLE, and ALIGNED.
        
            WRITEABLE (W) the data area can be written to;
        
            ALIGNED (A) the data and strides are aligned appropriately for the hardware
            (as determined by the compiler);
        
            UPDATEIFCOPY (U) this array is a copy of some other array (referenced
            by .base). When this array is deallocated, the base array will be
            updated with the contents of this array.
        
            All flags can be accessed using their first (upper case) letter as well
            as the full name.
        
            Examples
            --------
            >>> y
            array([[3, 1, 7],
                   [2, 0, 0],
                   [8, 5, 9]])
            >>> y.flags
              C_CONTIGUOUS : True
              F_CONTIGUOUS : False
              OWNDATA : True
              WRITEABLE : True
              ALIGNED : True
              UPDATEIFCOPY : False
            >>> y.setflags(write=0, align=0)
            >>> y.flags
              C_CONTIGUOUS : True
              F_CONTIGUOUS : False
              OWNDATA : True
              WRITEABLE : False
              ALIGNED : False
              UPDATEIFCOPY : False
            >>> y.setflags(uic=1)
            Traceback (most recent call last):
              File "<stdin>", line 1, in <module>
            ValueError: cannot set UPDATEIFCOPY flag to True
        """
        pass

    # real signature unknown; restored from __doc__
    def sort(self, axis=-1, kind='quicksort', order=None):
        """
        a.sort(axis=-1, kind='quicksort', order=None)
        
            Sort an array, in-place.
        
            Parameters
            ----------
            axis : int, optional
                Axis along which to sort. Default is -1, which means sort along the
                last axis.
            kind : {'quicksort', 'mergesort', 'heapsort'}, optional
                Sorting algorithm. Default is 'quicksort'.
            order : list, optional
                When `a` is an array with fields defined, this argument specifies
                which fields to compare first, second, etc.  Not all fields need be
                specified.
        
            See Also
            --------
            numpy.sort : Return a sorted copy of an array.
            argsort : Indirect sort.
            lexsort : Indirect stable sort on multiple keys.
            searchsorted : Find elements in sorted array.
        
            Notes
            -----
            See ``sort`` for notes on the different sorting algorithms.
        
            Examples
            --------
            >>> a = np.array([[1,4], [3,1]])
            >>> a.sort(axis=1)
            >>> a
            array([[1, 4],
                   [1, 3]])
            >>> a.sort(axis=0)
            >>> a
            array([[1, 3],
                   [1, 4]])
        
            Use the `order` keyword to specify a field to use when sorting a
            structured array:
        
            >>> a = np.array([('a', 2), ('c', 1)], dtype=[('x', 'S1'), ('y', int)])
            >>> a.sort(order='y')
            >>> a
            array([('c', 1), ('a', 2)],
                  dtype=[('x', '|S1'), ('y', '<i4')])
        """
        pass

    def squeeze(self):  # real signature unknown; restored from __doc__
        """
        a.squeeze()
        
            Remove single-dimensional entries from the shape of `a`.
        
            Refer to `numpy.squeeze` for full documentation.
        
            See Also
            --------
            numpy.squeeze : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def std(self, axis=None, dtype=None, out=None, ddof=0):
        """
        a.std(axis=None, dtype=None, out=None, ddof=0)
        
            Returns the standard deviation of the array elements along given axis.
        
            Refer to `numpy.std` for full documentation.
        
            See Also
            --------
            numpy.std : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def sum(self, axis=None, dtype=None, out=None):
        """
        a.sum(axis=None, dtype=None, out=None)
        
            Return the sum of the array elements over the given axis.
        
            Refer to `numpy.sum` for full documentation.
        
            See Also
            --------
            numpy.sum : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def swapaxes(self, axis1, axis2):
        """
        a.swapaxes(axis1, axis2)
        
            Return a view of the array with `axis1` and `axis2` interchanged.
        
            Refer to `numpy.swapaxes` for full documentation.
        
            See Also
            --------
            numpy.swapaxes : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def take(self, indices, axis=None, out=None, mode='raise'):
        """
        a.take(indices, axis=None, out=None, mode='raise')
        
            Return an array formed from the elements of `a` at the given indices.
        
            Refer to `numpy.take` for full documentation.
        
            See Also
            --------
            numpy.take : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def tofile(self, fid, sep="", format="%s"):
        """
        a.tofile(fid, sep="", format="%s")
        
            Write array to a file as text or binary (default).
        
            Data is always written in 'C' order, independent of the order of `a`.
            The data produced by this method can be recovered using the function
            fromfile().
        
            Parameters
            ----------
            fid : file or str
                An open file object, or a string containing a filename.
            sep : str
                Separator between array items for text output.
                If "" (empty), a binary file is written, equivalent to
                ``file.write(a.tostring())``.
            format : str
                Format string for text file output.
                Each entry in the array is formatted to text by first converting
                it to the closest Python type, and then using "format" % item.
        
            Notes
            -----
            This is a convenience function for quick storage of array data.
            Information on endianness and precision is lost, so this method is not a
            good choice for files intended to archive data or transport data between
            machines with different endianness. Some of these problems can be overcome
            by outputting the data as text files, at the expense of speed and file
            size.
        """
        pass

    def tolist(self):  # real signature unknown; restored from __doc__
        """
        a.tolist()
        
            Return the array as a (possibly nested) list.
        
            Return a copy of the array data as a (nested) Python list.
            Data items are converted to the nearest compatible Python type.
        
            Parameters
            ----------
            none
        
            Returns
            -------
            y : list
                The possibly nested list of array elements.
        
            Notes
            -----
            The array may be recreated, ``a = np.array(a.tolist())``.
        
            Examples
            --------
            >>> a = np.array([1, 2])
            >>> a.tolist()
            [1, 2]
            >>> a = np.array([[1, 2], [3, 4]])
            >>> list(a)
            [array([1, 2]), array([3, 4])]
            >>> a.tolist()
            [[1, 2], [3, 4]]
        """
        pass

    # real signature unknown; restored from __doc__
    def tostring(self, order='C'):
        """
        a.tostring(order='C')
        
            Construct a Python string containing the raw data bytes in the array.
        
            Constructs a Python string showing a copy of the raw contents of
            data memory. The string can be produced in either 'C' or 'Fortran',
            or 'Any' order (the default is 'C'-order). 'Any' order means C-order
            unless the F_CONTIGUOUS flag in the array is set, in which case it
            means 'Fortran' order.
        
            Parameters
            ----------
            order : {'C', 'F', None}, optional
                Order of the data for multidimensional arrays:
                C, Fortran, or the same as for the original array.
        
            Returns
            -------
            s : str
                A Python string exhibiting a copy of `a`'s raw data.
        
            Examples
            --------
            >>> x = np.array([[0, 1], [2, 3]])
            >>> x.tostring()
            '\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00'
            >>> x.tostring('C') == x.tostring()
            True
            >>> x.tostring('F')
            '\x00\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x00\x03\x00\x00\x00'
        """
        pass

    # real signature unknown; restored from __doc__
    def trace(self, offset=0, axis1=0, axis2=1, dtype=None, out=None):
        """
        a.trace(offset=0, axis1=0, axis2=1, dtype=None, out=None)
        
            Return the sum along diagonals of the array.
        
            Refer to `numpy.trace` for full documentation.
        
            See Also
            --------
            numpy.trace : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def transpose(self, *axes):
        """
        a.transpose(*axes)
        
            Returns a view of the array with axes transposed.
        
            For a 1-D array, this has no effect. (To change between column and
            row vectors, first cast the 1-D array into a matrix object.)
            For a 2-D array, this is the usual matrix transpose.
            For an n-D array, if axes are given, their order indicates how the
            axes are permuted (see Examples). If axes are not provided and
            ``a.shape = (i[0], i[1], ... i[n-2], i[n-1])``, then
            ``a.transpose().shape = (i[n-1], i[n-2], ... i[1], i[0])``.
        
            Parameters
            ----------
            axes : None, tuple of ints, or `n` ints
        
             * None or no argument: reverses the order of the axes.
        
             * tuple of ints: `i` in the `j`-th place in the tuple means `a`'s
               `i`-th axis becomes `a.transpose()`'s `j`-th axis.
        
             * `n` ints: same as an n-tuple of the same ints (this form is
               intended simply as a "convenience" alternative to the tuple form)
        
            Returns
            -------
            out : ndarray
                View of `a`, with axes suitably permuted.
        
            See Also
            --------
            ndarray.T : Array property returning the array transposed.
        
            Examples
            --------
            >>> a = np.array([[1, 2], [3, 4]])
            >>> a
            array([[1, 2],
                   [3, 4]])
            >>> a.transpose()
            array([[1, 3],
                   [2, 4]])
            >>> a.transpose((1, 0))
            array([[1, 3],
                   [2, 4]])
            >>> a.transpose(1, 0)
            array([[1, 3],
                   [2, 4]])
        """
        pass

    # real signature unknown; restored from __doc__
    def var(self, axis=None, dtype=None, out=None, ddof=0):
        """
        a.var(axis=None, dtype=None, out=None, ddof=0)
        
            Returns the variance of the array elements, along given axis.
        
            Refer to `numpy.var` for full documentation.
        
            See Also
            --------
            numpy.var : equivalent function
        """
        pass

    # real signature unknown; restored from __doc__
    def view(self, dtype=None, type=None):
        """
        a.view(dtype=None, type=None)
        
            New view of array with the same data.
        
            Parameters
            ----------
            dtype : data-type, optional
                Data-type descriptor of the returned view, e.g., float32 or int16.
                The default, None, results in the view having the same data-type
                as `a`.
            type : Python type, optional
                Type of the returned view, e.g., ndarray or matrix.  Again, the
                default None results in type preservation.
        
            Notes
            -----
            ``a.view()`` is used two different ways:
        
            ``a.view(some_dtype)`` or ``a.view(dtype=some_dtype)`` constructs a view
            of the array's memory with a different data-type.  This can cause a
            reinterpretation of the bytes of memory.
        
            ``a.view(ndarray_subclass)`` or ``a.view(type=ndarray_subclass)`` just
            returns an instance of `ndarray_subclass` that looks at the same array
            (same shape, dtype, etc.)  This does not cause a reinterpretation of the
            memory.
        
        
            Examples
            --------
            >>> x = np.array([(1, 2)], dtype=[('a', np.int8), ('b', np.int8)])
        
            Viewing array data using a different type and dtype:
        
            >>> y = x.view(dtype=np.int16, type=np.matrix)
            >>> y
            matrix([[513]], dtype=int16)
            >>> print type(y)
            <class 'numpy.matrixlib.defmatrix.matrix'>
        
            Creating a view on a structured array so it can be used in calculations
        
            >>> x = np.array([(1, 2),(3,4)], dtype=[('a', np.int8), ('b', np.int8)])
            >>> xv = x.view(dtype=np.int8).reshape(-1,2)
            >>> xv
            array([[1, 2],
                   [3, 4]], dtype=int8)
            >>> xv.mean(0)
            array([ 2.,  3.])
        
            Making changes to the view changes the underlying array
        
            >>> xv[0,1] = 20
            >>> print x
            [(1, 20) (3, 4)]
        
            Using a view to convert an array to a record array:
        
            >>> z = x.view(np.recarray)
            >>> z.a
            array([1], dtype=int8)
        
            Views share data:
        
            >>> x[0] = (9, 10)
            >>> z[0]
            (9, 10)
        """
        pass

    def __abs__(self):  # real signature unknown; restored from __doc__
        """ x.__abs__() <==> abs(x) """
        pass

    def __add__(self, y):  # real signature unknown; restored from __doc__
        """ x.__add__(y) <==> x+y """
        pass

    def __and__(self, y):  # real signature unknown; restored from __doc__
        """ x.__and__(y) <==> x&y """
        pass

    # real signature unknown; restored from __doc__
    def __array_prepare__(self, obj):
        """ a.__array_prepare__(obj) -> Object of same type as ndarray object obj. """
        pass

    # real signature unknown; restored from __doc__
    def __array_wrap__(self, obj):
        """ a.__array_wrap__(obj) -> Object of same type as ndarray object a. """
        pass

    # known case of numpy.core.multiarray.ndarray.__array__
    def __array__(self, dtype=None):
        """
        a.__array__(|dtype) -> reference if type unchanged, copy otherwise.
        
            Returns either a new reference to self if dtype is not given or a new array
            of provided data type if dtype is different from the current dtype of the
            array.
        """
        pass

    def __contains__(self, y):  # real signature unknown; restored from __doc__
        """ x.__contains__(y) <==> y in x """
        pass

    # real signature unknown; restored from __doc__
    def __copy__(self, order=None):
        """
        a.__copy__([order])
        
            Return a copy of the array.
        
            Parameters
            ----------
            order : {'C', 'F', 'A'}, optional
                If order is 'C' (False) then the result is contiguous (default).
                If order is 'Fortran' (True) then the result has fortran order.
                If order is 'Any' (None) then the result has fortran order
                only if the array already is in fortran order.
        """
        pass

    def __deepcopy__(self):  # real signature unknown; restored from __doc__
        """
        a.__deepcopy__() -> Deep copy of array.
        
            Used if copy.deepcopy is called on an array.
        """
        pass

    def __delitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__delitem__(y) <==> del x[y] """
        pass

    # real signature unknown; restored from __doc__
    def __delslice__(self, i, j):
        """
        x.__delslice__(i, j) <==> del x[i:j]
                   
                   Use of negative indices is not supported.
        """
        pass

    def __divmod__(self, y):  # real signature unknown; restored from __doc__
        """ x.__divmod__(y) <==> divmod(x, y) """
        pass

    def __div__(self, y):  # real signature unknown; restored from __doc__
        """ x.__div__(y) <==> x/y """
        pass

    def __eq__(self, y):  # real signature unknown; restored from __doc__
        """ x.__eq__(y) <==> x==y """
        pass

    def __float__(self):  # real signature unknown; restored from __doc__
        """ x.__float__() <==> float(x) """
        pass

    def __floordiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__floordiv__(y) <==> x//y """
        pass

    def __getitem__(self, y):  # real signature unknown; restored from __doc__
        """ x.__getitem__(y) <==> x[y] """
        pass

    # real signature unknown; restored from __doc__
    def __getslice__(self, i, j):
        """
        x.__getslice__(i, j) <==> x[i:j]
                   
                   Use of negative indices is not supported.
        """
        pass

    def __ge__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ge__(y) <==> x>=y """
        pass

    def __gt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__gt__(y) <==> x>y """
        pass

    def __hex__(self):  # real signature unknown; restored from __doc__
        """ x.__hex__() <==> hex(x) """
        pass

    def __iadd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iadd__(y) <==> x+y """
        pass

    def __iand__(self, y):  # real signature unknown; restored from __doc__
        """ x.__iand__(y) <==> x&y """
        pass

    def __idiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__idiv__(y) <==> x/y """
        pass

    # real signature unknown; restored from __doc__
    def __ifloordiv__(self, y):
        """ x.__ifloordiv__(y) <==> x//y """
        pass

    def __ilshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ilshift__(y) <==> x<<y """
        pass

    def __imod__(self, y):  # real signature unknown; restored from __doc__
        """ x.__imod__(y) <==> x%y """
        pass

    def __imul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__imul__(y) <==> x*y """
        pass

    def __index__(self):  # real signature unknown; restored from __doc__
        """ x[y:z] <==> x[y.__index__():z.__index__()] """
        pass

    # real signature unknown; restored from __doc__
    def __init__(self, shape, dtype=None, buffer=None, offset=0, strides=None, order=None):
        pass

    def __int__(self):  # real signature unknown; restored from __doc__
        """ x.__int__() <==> int(x) """
        pass

    def __invert__(self):  # real signature unknown; restored from __doc__
        """ x.__invert__() <==> ~x """
        pass

    def __ior__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ior__(y) <==> x|y """
        pass

    def __ipow__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ipow__(y) <==> x**y """
        pass

    def __irshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__irshift__(y) <==> x>>y """
        pass

    def __isub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__isub__(y) <==> x-y """
        pass

    def __iter__(self):  # real signature unknown; restored from __doc__
        """ x.__iter__() <==> iter(x) """
        pass

    def __itruediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__itruediv__(y) <==> x/y """
        pass

    def __ixor__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ixor__(y) <==> x^y """
        pass

    def __len__(self):  # real signature unknown; restored from __doc__
        """ x.__len__() <==> len(x) """
        pass

    def __le__(self, y):  # real signature unknown; restored from __doc__
        """ x.__le__(y) <==> x<=y """
        pass

    def __long__(self):  # real signature unknown; restored from __doc__
        """ x.__long__() <==> long(x) """
        pass

    def __lshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lshift__(y) <==> x<<y """
        pass

    def __lt__(self, y):  # real signature unknown; restored from __doc__
        """ x.__lt__(y) <==> x<y """
        pass

    def __mod__(self, y):  # real signature unknown; restored from __doc__
        """ x.__mod__(y) <==> x%y """
        pass

    def __mul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__mul__(y) <==> x*y """
        pass

    def __neg__(self):  # real signature unknown; restored from __doc__
        """ x.__neg__() <==> -x """
        pass

    @staticmethod  # known case of __new__
    def __new__(S, *more):  # real signature unknown; restored from __doc__
        """ T.__new__(S, ...) -> a new object with type S, a subtype of T """
        pass

    def __ne__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ne__(y) <==> x!=y """
        pass

    def __nonzero__(self):  # real signature unknown; restored from __doc__
        """ x.__nonzero__() <==> x != 0 """
        pass

    def __oct__(self):  # real signature unknown; restored from __doc__
        """ x.__oct__() <==> oct(x) """
        pass

    def __or__(self, y):  # real signature unknown; restored from __doc__
        """ x.__or__(y) <==> x|y """
        pass

    def __pos__(self):  # real signature unknown; restored from __doc__
        """ x.__pos__() <==> +x """
        pass

    # real signature unknown; restored from __doc__
    def __pow__(self, y, z=None):
        """ x.__pow__(y[, z]) <==> pow(x, y[, z]) """
        pass

    def __radd__(self, y):  # real signature unknown; restored from __doc__
        """ x.__radd__(y) <==> y+x """
        pass

    def __rand__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rand__(y) <==> y&x """
        pass

    def __rdivmod__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rdivmod__(y) <==> divmod(y, x) """
        pass

    def __rdiv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rdiv__(y) <==> y/x """
        pass

    def __reduce__(self):  # real signature unknown; restored from __doc__
        """
        a.__reduce__()
        
            For pickling.
        """
        pass

    def __repr__(self):  # real signature unknown; restored from __doc__
        """ x.__repr__() <==> repr(x) """
        pass

    # real signature unknown; restored from __doc__
    def __rfloordiv__(self, y):
        """ x.__rfloordiv__(y) <==> y//x """
        pass

    def __rlshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rlshift__(y) <==> y<<x """
        pass

    def __rmod__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rmod__(y) <==> y%x """
        pass

    def __rmul__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rmul__(y) <==> y*x """
        pass

    def __ror__(self, y):  # real signature unknown; restored from __doc__
        """ x.__ror__(y) <==> y|x """
        pass

    # real signature unknown; restored from __doc__
    def __rpow__(self, x, z=None):
        """ y.__rpow__(x[, z]) <==> pow(x, y[, z]) """
        pass

    def __rrshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rrshift__(y) <==> y>>x """
        pass

    def __rshift__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rshift__(y) <==> x>>y """
        pass

    def __rsub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rsub__(y) <==> y-x """
        pass

    def __rtruediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rtruediv__(y) <==> y/x """
        pass

    def __rxor__(self, y):  # real signature unknown; restored from __doc__
        """ x.__rxor__(y) <==> y^x """
        pass

    # real signature unknown; restored from __doc__
    def __setitem__(self, i, y):
        """ x.__setitem__(i, y) <==> x[i]=y """
        pass

    # real signature unknown; restored from __doc__
    def __setslice__(self, i, j, y):
        """
        x.__setslice__(i, j, y) <==> x[i:j]=y
                   
                   Use  of negative indices is not supported.
        """
        pass

    # real signature unknown; restored from __doc__
    def __setstate__(self, version, shape, dtype, isfortran, rawdata):
        """
        a.__setstate__(version, shape, dtype, isfortran, rawdata)
        
            For unpickling.
        
            Parameters
            ----------
            version : int
                optional pickle version. If omitted defaults to 0.
            shape : tuple
            dtype : data-type
            isFortran : bool
            rawdata : string or list
                a binary string with the data (or a list if 'a' is an object array)
        """
        pass

    def __str__(self):  # real signature unknown; restored from __doc__
        """ x.__str__() <==> str(x) """
        pass

    def __sub__(self, y):  # real signature unknown; restored from __doc__
        """ x.__sub__(y) <==> x-y """
        pass

    def __truediv__(self, y):  # real signature unknown; restored from __doc__
        """ x.__truediv__(y) <==> x/y """
        pass

    def __xor__(self, y):  # real signature unknown; restored from __doc__
        """ x.__xor__(y) <==> x^y """
        pass

    base = property(lambda self: object())  # default
    ctypes = property(lambda self: object())  # default
    data = property(lambda self: object())  # default
    dtype = property(lambda self: object())  # default
    flags = property(lambda self: object())  # default
    flat = property(lambda self: object())  # default
    imag = property(lambda self: object())  # default
    itemsize = property(lambda self: object())  # default
    nbytes = property(lambda self: object())  # default
    ndim = property(lambda self: object())  # default
    real = property(lambda self: object())  # default
    shape = property(lambda self: object())  # default
    size = property(lambda self: object())  # default
    strides = property(lambda self: object())  # default
    T = property(lambda self: object())  # default
    __array_finalize__ = property(lambda self: object())  # default
    __array_interface__ = property(lambda self: object())  # default
    __array_priority__ = property(lambda self: object())  # default
    __array_struct__ = property(lambda self: object())  # default


# variables with complex values

typeinfo = {}  # real value of type <type 'dict'> replaced

_ARRAY_API = None  # (!) real value is ''

_flagdict = {
    'A': 256,
    'ALIGNED': 256,
    'C': 1,
    'CONTIGUOUS': 1,
    'C_CONTIGUOUS': 1,
    'F': 2,
    'FORTRAN': 2,
    'F_CONTIGUOUS': 2,
    'O': 4,
    'OWNDATA': 4,
    'U': 4096,
    'UPDATEIFCOPY': 4096,
    'W': 1024,
    'WRITEABLE': 1024,
}
