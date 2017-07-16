# encoding: utf-8
# module scipy.signal.sigtools
# from /usr/lib/python2.7/dist-packages/scipy/signal/sigtools.so by generator 1.96
# no doc
# no imports

# functions

# real signature unknown; restored from __doc__


def _convolve2d(in1, in2, flip, mode, boundary, fillvalue):
    """ out = _convolve2d(in1, in2, flip, mode, boundary, fillvalue) """
    pass


# real signature unknown; restored from __doc__
def _correlateND(a, kernel, mode):
    """
    out = _correlateND(a,kernel,mode) 
    
       mode = 0 - 'valid', 1 - 'same', 
      2 - 'full' (default)
    """
    pass


# real signature unknown; restored from __doc__
def _linear_filter(b, a, X, Dim=-1, Vi=None):
    """ (y,Vf) = _linear_filter(b,a,X,Dim=-1,Vi=None)  implemented using Direct Form II transposed flow diagram. If Vi is not given, Vf is not returned. """
    pass


def _medfilt2d(*args, **kwargs):  # real signature unknown
    """ filt = _median2d(data, size) """
    pass


# real signature unknown; restored from __doc__
def _order_filterND(a, domain, order):
    """ out = _order_filterND(a,domain,order) """
    pass


# real signature unknown; restored from __doc__
def _remez(numtaps, bands, des, weight, type, Hz, maxiter, grid_density):
    """
    h = _remez(numtaps, bands, des, weight, type, Hz, maxiter, grid_density) 
      returns the optimal (in the Chebyshev/minimax sense) FIR filter impulse 
      response given a set of band edges, the desired response on those bands,
      and the weight given to the error in those bands.  Bands is a monotonic
       vector with band edges given in frequency domain where Hz is the sampling
       frequency.
    """
    pass


# no classes
