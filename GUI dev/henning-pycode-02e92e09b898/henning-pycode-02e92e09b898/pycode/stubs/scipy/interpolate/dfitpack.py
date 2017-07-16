# encoding: utf-8
# module scipy.interpolate.dfitpack
# from /usr/lib/python2.7/dist-packages/scipy/interpolate/dfitpack.so by
# generator 1.96
"""
This module 'dfitpack' is auto-generated with f2py (version:1).
Functions:
  y = splev(t,c,k,x,e=0)
  y = splder(t,c,k,x,nu=1,e=0)
  splint = splint(t,c,k,a,b)
  zero,m,ier = sproot(t,c,mest=3*(n-7))
  d,ier = spalde(t,c,k,x)
  n,c,fp,ier = curfit(iopt,x,y,w,t,wrk,iwrk,xb=x[0],xe=x[m-1],k=3,s=0.0)
  n,c,fp,ier = percur(iopt,x,y,w,t,wrk,iwrk,k=3,s=0.0)
  n,c,fp,ier = parcur(iopt,ipar,idim,u,x,w,ub,ue,t,wrk,iwrk,k=3.0,s=0.0)
  x,y,w,xb,xe,k,s,n,t,c,fp,fpint,nrdata,ier = fpcurf0(x,y,k,w=1.0,xb=x[0],xe=x[m-1],s=m,nest=(s==0.0?m+k+1:MAX(m/2,2*k1)))
  x,y,w,xb,xe,k,s,n,t,c,fp,fpint,nrdata,ier = fpcurf1(x,y,w,xb,xe,k,s,n,t,c,fp,fpint,nrdata,ier,overwrite_x=1,overwrite_y=1,overwrite_w=1,overwrite_t=1,overwrite_c=1,overwrite_fpint=1,overwrite_nrdata=1)
  x,y,w,xb,xe,k,s,n,t,c,fp,fpint,nrdata,ier = fpcurfm1(x,y,k,t,w=1.0,xb=x[0],xe=x[m-1],overwrite_t=1)
  z,ier = bispev(tx,ty,c,kx,ky,x,y)
  z,ier = bispeu(tx,ty,c,kx,ky,x,y)
  nx,tx,ny,ty,c,fp,wrk1,ier = surfit_smth(x,y,z,w=1.0,xb=dmin(x,m),xe=dmax(x,m),yb=dmin(y,m),ye=dmax(y,m),kx=3,ky=3,s=m,nxest=imax(kx+1+sqrt(m/2),2*(kx+1)),nyest=imax(ky+1+sqrt(m/2),2*(ky+1)),eps=1e-16,lwrk2=calc_surfit_lwrk2(m,kx,ky,nxest,nyest))
  tx,ty,c,fp,ier = surfit_lsq(x,y,z,tx,ty,w=1.0,xb=calc_b(x,m,tx,nx),xe=calc_e(x,m,tx,nx),yb=calc_b(y,m,ty,ny),ye=calc_e(y,m,ty,ny),kx=3,ky=3,eps=1e-16,lwrk2=calc_surfit_lwrk2(m,kx,ky,nxest,nyest),overwrite_tx=1,overwrite_ty=1)
  nx,tx,ny,ty,c,fp,ier = regrid_smth(x,y,z,xb=dmin(x,mx),xe=dmax(x,mx),yb=dmin(y,my),ye=dmax(y,my),kx=3,ky=3,s=0.0)
  dblint = dblint(tx,ty,c,kx,ky,xb,xe,yb,ye)
.
"""
# no imports

# Variables with simple values

__version__ = '$Revision: $'

# no functions
# no classes
# variables with complex values

bispeu = None  # (!) real value is ''

bispev = None  # (!) real value is ''

curfit = None  # (!) real value is ''

dblint = None  # (!) real value is ''

fpcurf0 = None  # (!) real value is ''

fpcurf1 = None  # (!) real value is ''

fpcurfm1 = None  # (!) real value is ''

parcur = None  # (!) real value is ''

percur = None  # (!) real value is ''

regrid_smth = None  # (!) real value is ''

spalde = None  # (!) real value is ''

splder = None  # (!) real value is ''

splev = None  # (!) real value is ''

splint = None  # (!) real value is ''

sproot = None  # (!) real value is ''

surfit_lsq = None  # (!) real value is ''

surfit_smth = None  # (!) real value is ''
