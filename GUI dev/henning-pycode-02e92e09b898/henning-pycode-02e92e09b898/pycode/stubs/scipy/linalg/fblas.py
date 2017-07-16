# encoding: utf-8
# module scipy.linalg.fblas
# from /usr/lib/python2.7/dist-packages/scipy/linalg/fblas.so by generator 1.96
"""
This module 'fblas' is auto-generated with f2py (version:1).
Functions:
  c,s = srotg(a,b)
  c,s = drotg(a,b)
  c,s = crotg(a,b)
  c,s = zrotg(a,b)
  param = srotmg(d1,d2,x1,y1)
  param = drotmg(d1,d2,x1,y1)
  x,y = srot(x,y,c,s,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1,overwrite_x=0,overwrite_y=0)
  x,y = drot(x,y,c,s,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1,overwrite_x=0,overwrite_y=0)
  x,y = csrot(x,y,c,s,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1,overwrite_x=0,overwrite_y=0)
  x,y = zdrot(x,y,c,s,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1,overwrite_x=0,overwrite_y=0)
  x,y = srotm(x,y,param,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1,overwrite_x=0,overwrite_y=0)
  x,y = drotm(x,y,param,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1,overwrite_x=0,overwrite_y=0)
  x,y = sswap(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  x,y = dswap(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  x,y = cswap(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  x,y = zswap(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  x = sscal(a,x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  x = dscal(a,x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  x = cscal(a,x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  x = zscal(a,x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  x = csscal(a,x,n=(len(x)-offx)/abs(incx),offx=0,incx=1,overwrite_x=0)
  x = zdscal(a,x,n=(len(x)-offx)/abs(incx),offx=0,incx=1,overwrite_x=0)
  y = scopy(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  y = dcopy(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  y = ccopy(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  y = zcopy(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  y = saxpy(x,y,n=(len(x)-offx)/abs(incx),a=1.0,offx=0,incx=1,offy=0,incy=1)
  y = daxpy(x,y,n=(len(x)-offx)/abs(incx),a=1.0,offx=0,incx=1,offy=0,incy=1)
  y = caxpy(x,y,n=(len(x)-offx)/abs(incx),a=(1.0, 0.0),offx=0,incx=1,offy=0,incy=1)
  y = zaxpy(x,y,n=(len(x)-offx)/abs(incx),a=(1.0, 0.0),offx=0,incx=1,offy=0,incy=1)
  xy = cdotu(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  xy = zdotu(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  xy = cdotc(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  xy = zdotc(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  y = sgemv(alpha,a,x,beta=0.0,y=,offx=0,incx=1,offy=0,incy=1,trans=0,overwrite_y=0)
  y = dgemv(alpha,a,x,beta=0.0,y=,offx=0,incx=1,offy=0,incy=1,trans=0,overwrite_y=0)
  y = cgemv(alpha,a,x,beta=(0.0, 0.0),y=,offx=0,incx=1,offy=0,incy=1,trans=0,overwrite_y=0)
  y = zgemv(alpha,a,x,beta=(0.0, 0.0),y=,offx=0,incx=1,offy=0,incy=1,trans=0,overwrite_y=0)
  y = chemv(alpha,a,x,beta,y,offx=0,incx=1,offy=0,incy=1,lower=0,overwrite_y=0)
  y = zhemv(alpha,a,x,beta,y,offx=0,incx=1,offy=0,incy=1,lower=0,overwrite_y=0)
  y = ssymv(alpha,a,x,beta,y,offx=0,incx=1,offy=0,incy=1,lower=0,overwrite_y=0)
  y = dsymv(alpha,a,x,beta,y,offx=0,incx=1,offy=0,incy=1,lower=0,overwrite_y=0)
  x = strmv(a,x,offx=0,incx=1,lower=0,trans=0,unitdiag=0,overwrite_x=0)
  x = dtrmv(a,x,offx=0,incx=1,lower=0,trans=0,unitdiag=0,overwrite_x=0)
  x = ctrmv(a,x,offx=0,incx=1,lower=0,trans=0,unitdiag=0,overwrite_x=0)
  x = ztrmv(a,x,offx=0,incx=1,lower=0,trans=0,unitdiag=0,overwrite_x=0)
  a = sger(alpha,x,y,incx=1,incy=1,a=0,overwrite_x=1,overwrite_y=1,overwrite_a=0)
  a = dger(alpha,x,y,incx=1,incy=1,a=0,overwrite_x=1,overwrite_y=1,overwrite_a=0)
  a = cgeru(alpha,x,y,incx=1,incy=1,a=(0,0.),overwrite_x=1,overwrite_y=1,overwrite_a=0)
  a = zgeru(alpha,x,y,incx=1,incy=1,a=(0,0.),overwrite_x=1,overwrite_y=1,overwrite_a=0)
  a = cgerc(alpha,x,y,incx=1,incy=1,a=(0,0.),overwrite_x=1,overwrite_y=1,overwrite_a=0)
  a = zgerc(alpha,x,y,incx=1,incy=1,a=(0,0.),overwrite_x=1,overwrite_y=1,overwrite_a=0)
  c = sgemm(alpha,a,b,beta=0.0,c=,trans_a=0,trans_b=0,overwrite_c=0)
  c = dgemm(alpha,a,b,beta=0.0,c=,trans_a=0,trans_b=0,overwrite_c=0)
  c = cgemm(alpha,a,b,beta=(0.0, 0.0),c=,trans_a=0,trans_b=0,overwrite_c=0)
  c = zgemm(alpha,a,b,beta=(0.0, 0.0),c=,trans_a=0,trans_b=0,overwrite_c=0)
  xy = sdot(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  xy = ddot(x,y,n=(len(x)-offx)/abs(incx),offx=0,incx=1,offy=0,incy=1)
  n2 = snrm2(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  n2 = dnrm2(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  n2 = scnrm2(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  n2 = dznrm2(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  s = sasum(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  s = dasum(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  s = scasum(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  s = dzasum(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  k = isamax(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  k = idamax(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  k = icamax(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
  k = izamax(x,n=(len(x)-offx)/abs(incx),offx=0,incx=1)
.
"""
# no imports

# Variables with simple values

__version__ = '$Revision: $'

# no functions
# no classes
# variables with complex values

caxpy = None  # (!) real value is ''

ccopy = None  # (!) real value is ''

cdotc = None  # (!) real value is ''

cdotu = None  # (!) real value is ''

cgemm = None  # (!) real value is ''

cgemv = None  # (!) real value is ''

cgerc = None  # (!) real value is ''

cgeru = None  # (!) real value is ''

chemv = None  # (!) real value is ''

crotg = None  # (!) real value is ''

cscal = None  # (!) real value is ''

csrot = None  # (!) real value is ''

csscal = None  # (!) real value is ''

cswap = None  # (!) real value is ''

ctrmv = None  # (!) real value is ''

dasum = None  # (!) real value is ''

daxpy = None  # (!) real value is ''

dcopy = None  # (!) real value is ''

ddot = None  # (!) real value is ''

dgemm = None  # (!) real value is ''

dgemv = None  # (!) real value is ''

dger = None  # (!) real value is ''

dnrm2 = None  # (!) real value is ''

drot = None  # (!) real value is ''

drotg = None  # (!) real value is ''

drotm = None  # (!) real value is ''

drotmg = None  # (!) real value is ''

dscal = None  # (!) real value is ''

dswap = None  # (!) real value is ''

dsymv = None  # (!) real value is ''

dtrmv = None  # (!) real value is ''

dzasum = None  # (!) real value is ''

dznrm2 = None  # (!) real value is ''

icamax = None  # (!) real value is ''

idamax = None  # (!) real value is ''

isamax = None  # (!) real value is ''

izamax = None  # (!) real value is ''

sasum = None  # (!) real value is ''

saxpy = None  # (!) real value is ''

scasum = None  # (!) real value is ''

scnrm2 = None  # (!) real value is ''

scopy = None  # (!) real value is ''

sdot = None  # (!) real value is ''

sgemm = None  # (!) real value is ''

sgemv = None  # (!) real value is ''

sger = None  # (!) real value is ''

snrm2 = None  # (!) real value is ''

srot = None  # (!) real value is ''

srotg = None  # (!) real value is ''

srotm = None  # (!) real value is ''

srotmg = None  # (!) real value is ''

sscal = None  # (!) real value is ''

sswap = None  # (!) real value is ''

ssymv = None  # (!) real value is ''

strmv = None  # (!) real value is ''

zaxpy = None  # (!) real value is ''

zcopy = None  # (!) real value is ''

zdotc = None  # (!) real value is ''

zdotu = None  # (!) real value is ''

zdrot = None  # (!) real value is ''

zdscal = None  # (!) real value is ''

zgemm = None  # (!) real value is ''

zgemv = None  # (!) real value is ''

zgerc = None  # (!) real value is ''

zgeru = None  # (!) real value is ''

zhemv = None  # (!) real value is ''

zrotg = None  # (!) real value is ''

zscal = None  # (!) real value is ''

zswap = None  # (!) real value is ''

ztrmv = None  # (!) real value is ''
