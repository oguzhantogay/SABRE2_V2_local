# encoding: utf-8
# module scipy.sparse.linalg.dsolve._superlu
# from /usr/lib/python2.7/dist-packages/scipy/sparse/linalg/dsolve/_superlu.so by generator 1.96
# no doc
# no imports

# functions


def gssv(A, B):  # real signature unknown; restored from __doc__
    """
    Direct inversion of sparse matrix.
    
    X = gssv(A,B) solves A*X = B for X.
    """
    pass


def gstrf(A, *more):  # real signature unknown; restored from __doc__
    """
    gstrf(A, ...)
    
    performs a factorization of the sparse matrix A=*(N,nnz,nzvals,rowind,colptr) and 
    returns a factored_lu object.
    
    arguments
    ---------
    
    Matrix to be factorized is represented as N,nnz,nzvals,rowind,colptr
      as separate arguments.  This is compressed sparse column representation.
    
    N         number of rows and columns 
    nnz       number of non-zero elements
    nzvals    non-zero values 
    rowind    row-index for this column (same size as nzvals)
    colptr    index into rowind for first non-zero value in this column
              size is (N+1).  Last value should be nnz. 
    
    additional keyword arguments:
    -----------------------------
    options             specifies additional options for SuperLU
                        (same keys and values as in superlu_options_t C structure,
                        and additionally 'Relax' and 'PanelSize')
    
    ilu                 whether to perform an incomplete LU decomposition
                        (default: false)
    """
    pass


# classes

class SciPyLUType(object):

    """
    Object resulting from a factorization of a sparse matrix
    
    Attributes
    -----------
    
    shape : 2-tuple
        the shape of the orginal matrix factored
    nnz : int
        the number of non-zero elements in the matrix
    perm_c
        the permutation applied to the colums of the matrix for the LU factorization
    perm_r
        the permutation applied to the rows of the matrix for the LU factorization
    
    Methods
    -------
    solve
        solves the system for a given right hand side vector
    """

    def solve(self, b, trans):  # real signature unknown; restored from __doc__
        """
        x = self.solve(b, trans)
        
        solves linear system of equations with one or sereral right hand sides.
        
        parameters
        ----------
        
        b        array, right hand side(s) of equation
        x        array, solution vector(s)
        trans    'N': solve A   * x == b
                 'T': solve A^T * x == b
                 'H': solve A^H * x == b
                 (optional, default value 'N')
        """
        pass

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass
