# encoding: utf-8
# module scipy.sparse.linalg.eigen.arpack._arpack
# from
# /usr/lib/python2.7/dist-packages/scipy/sparse/linalg/eigen/arpack/_arpack.so
# by generator 1.96
"""
This module '_arpack' is auto-generated with f2py (version:1).
Functions:
  ido,resid,v,iparam,ipntr,info = ssaupd(ido,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,info,n=len(resid),ncv=shape(v,1),ldv=shape(v,0),lworkl=len(workl))
  ido,resid,v,iparam,ipntr,info = dsaupd(ido,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,info,n=len(resid),ncv=shape(v,1),ldv=shape(v,0),lworkl=len(workl))
  d,z,info = sseupd(rvec,howmny,select,sigma,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,info,ldz=shape(z,0),n=len(resid),ncv=len(select),ldv=shape(v,0),lworkl=len(workl))
  d,z,info = dseupd(rvec,howmny,select,sigma,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,info,ldz=shape(z,0),n=len(resid),ncv=len(select),ldv=shape(v,0),lworkl=len(workl))
  ido,resid,v,iparam,ipntr,info = snaupd(ido,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,info,n=len(resid),ncv=shape(v,1),ldv=shape(v,0),lworkl=len(workl))
  ido,resid,v,iparam,ipntr,info = dnaupd(ido,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,info,n=len(resid),ncv=shape(v,1),ldv=shape(v,0),lworkl=len(workl))
  dr,di,z,info = sneupd(rvec,howmny,select,sigmar,sigmai,workev,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,info,ldz=shape(z,0),n=len(resid),ncv=len(select),ldv=shape(v,0),lworkl=len(workl))
  dr,di,z,info = dneupd(rvec,howmny,select,sigmar,sigmai,workev,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,info,ldz=shape(z,0),n=len(resid),ncv=len(select),ldv=shape(v,0),lworkl=len(workl))
  ido,resid,v,iparam,ipntr,info = cnaupd(ido,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,rwork,info,n=len(resid),ncv=shape(v,1),ldv=shape(v,0),lworkl=len(workl))
  ido,resid,v,iparam,ipntr,info = znaupd(ido,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,rwork,info,n=len(resid),ncv=shape(v,1),ldv=shape(v,0),lworkl=len(workl))
  d,z,info = cneupd(rvec,howmny,select,sigma,workev,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,rwork,info,ldz=shape(z,0),n=len(resid),ncv=len(select),ldv=shape(v,0),lworkl=len(workl))
  d,z,info = zneupd(rvec,howmny,select,sigma,workev,bmat,which,nev,tol,resid,v,iparam,ipntr,workd,workl,rwork,info,ldz=shape(z,0),n=len(resid),ncv=len(select),ldv=shape(v,0),lworkl=len(workl))
COMMON blocks:
  /debug/ logfil,ndigit,mgetv0,msaupd,msaup2,msaitr,mseigt,msapps,msgets,mseupd,mnaupd,mnaup2,mnaitr,mneigh,mnapps,mngets,mneupd,mcaupd,mcaup2,mcaitr,mceigh,mcapps,mcgets,mceupd
  /timing/ nopx,nbx,nrorth,nitref,nrstrt,tsaupd,tsaup2,tsaitr,tseigt,tsgets,tsapps,tsconv,tnaupd,tnaup2,tnaitr,tneigh,tngets,tnapps,tnconv,tcaupd,tcaup2,tcaitr,tceigh,tcgets,tcapps,tcconv,tmvopx,tmvbx,tgetv0,titref,trvec
.
"""
# no imports

# Variables with simple values

__version__ = '$Revision: $'

# no functions
# no classes
# variables with complex values

cnaupd = None  # (!) real value is ''

cneupd = None  # (!) real value is ''

debug = None  # (!) real value is ''

dnaupd = None  # (!) real value is ''

dneupd = None  # (!) real value is ''

dsaupd = None  # (!) real value is ''

dseupd = None  # (!) real value is ''

snaupd = None  # (!) real value is ''

sneupd = None  # (!) real value is ''

ssaupd = None  # (!) real value is ''

sseupd = None  # (!) real value is ''

timing = None  # (!) real value is ''

znaupd = None  # (!) real value is ''

zneupd = None  # (!) real value is ''
