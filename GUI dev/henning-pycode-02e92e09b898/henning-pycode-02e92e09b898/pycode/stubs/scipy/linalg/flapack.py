# encoding: utf-8
# module scipy.linalg.flapack
# from /usr/lib/python2.7/dist-packages/scipy/linalg/flapack.so by
# generator 1.96
"""
This module 'flapack' is auto-generated with f2py (version:1).
Functions:
  c,info = spbtrf(ab,lower=0,ldab=shape(ab,0),overwrite_ab=0)
  c,info = dpbtrf(ab,lower=0,ldab=shape(ab,0),overwrite_ab=0)
  c,info = cpbtrf(ab,lower=0,ldab=shape(ab,0),overwrite_ab=0)
  c,info = zpbtrf(ab,lower=0,ldab=shape(ab,0),overwrite_ab=0)
  x,info = spbtrs(ab,b,lower=0,ldab=shape(ab,0),overwrite_b=0)
  x,info = dpbtrs(ab,b,lower=0,ldab=shape(ab,0),overwrite_b=0)
  x,info = cpbtrs(ab,b,lower=0,ldab=shape(ab,0),overwrite_b=0)
  x,info = zpbtrs(ab,b,lower=0,ldab=shape(ab,0),overwrite_b=0)
  x,info = strtrs(a,b,lower=0,trans=0,unitdiag=0,lda=shape(a,0),overwrite_b=0)
  x,info = dtrtrs(a,b,lower=0,trans=0,unitdiag=0,lda=shape(a,0),overwrite_b=0)
  x,info = ctrtrs(a,b,lower=0,trans=0,unitdiag=0,lda=shape(a,0),overwrite_b=0)
  x,info = ztrtrs(a,b,lower=0,trans=0,unitdiag=0,lda=shape(a,0),overwrite_b=0)
  c,x,info = spbsv(ab,b,lower=0,ldab=shape(ab,0),overwrite_ab=0,overwrite_b=0)
  c,x,info = dpbsv(ab,b,lower=0,ldab=shape(ab,0),overwrite_ab=0,overwrite_b=0)
  c,x,info = cpbsv(ab,b,lower=0,ldab=shape(ab,0),overwrite_ab=0,overwrite_b=0)
  c,x,info = zpbsv(ab,b,lower=0,ldab=shape(ab,0),overwrite_ab=0,overwrite_b=0)
  ba,lo,hi,pivscale,info = sgebal(a,scale=0,permute=0,overwrite_a=0)
  ba,lo,hi,pivscale,info = dgebal(a,scale=0,permute=0,overwrite_a=0)
  ba,lo,hi,pivscale,info = cgebal(a,scale=0,permute=0,overwrite_a=0)
  ba,lo,hi,pivscale,info = zgebal(a,scale=0,permute=0,overwrite_a=0)
  ht,tau,info = sgehrd(a,lo=0,hi=n-1,lwork=MAX(n,1),overwrite_a=0)
  ht,tau,info = dgehrd(a,lo=0,hi=n-1,lwork=MAX(n,1),overwrite_a=0)
  ht,tau,info = cgehrd(a,lo=0,hi=n-1,lwork=MAX(n,1),overwrite_a=0)
  ht,tau,info = zgehrd(a,lo=0,hi=n-1,lwork=MAX(n,1),overwrite_a=0)
  lub,piv,x,info = sgbsv(kl,ku,ab,b,overwrite_ab=0,overwrite_b=0)
  lub,piv,x,info = dgbsv(kl,ku,ab,b,overwrite_ab=0,overwrite_b=0)
  lub,piv,x,info = cgbsv(kl,ku,ab,b,overwrite_ab=0,overwrite_b=0)
  lub,piv,x,info = zgbsv(kl,ku,ab,b,overwrite_ab=0,overwrite_b=0)
  lu,piv,x,info = sgesv(a,b,overwrite_a=0,overwrite_b=0)
  lu,piv,x,info = dgesv(a,b,overwrite_a=0,overwrite_b=0)
  lu,piv,x,info = cgesv(a,b,overwrite_a=0,overwrite_b=0)
  lu,piv,x,info = zgesv(a,b,overwrite_a=0,overwrite_b=0)
  lu,piv,info = sgetrf(a,overwrite_a=0)
  lu,piv,info = dgetrf(a,overwrite_a=0)
  lu,piv,info = cgetrf(a,overwrite_a=0)
  lu,piv,info = zgetrf(a,overwrite_a=0)
  x,info = sgetrs(lu,piv,b,trans=0,overwrite_b=0)
  x,info = dgetrs(lu,piv,b,trans=0,overwrite_b=0)
  x,info = cgetrs(lu,piv,b,trans=0,overwrite_b=0)
  x,info = zgetrs(lu,piv,b,trans=0,overwrite_b=0)
  inv_a,info = sgetri(lu,piv,lwork=3*n,overwrite_lu=0)
  inv_a,info = dgetri(lu,piv,lwork=3*n,overwrite_lu=0)
  inv_a,info = cgetri(lu,piv,lwork=3*n,overwrite_lu=0)
  inv_a,info = zgetri(lu,piv,lwork=3*n,overwrite_lu=0)
  u,s,vt,info = sgesdd(a,compute_uv=1,lwork=(compute_uv?4*minmn*minmn+MAX(m,n)+9*minmn:MAX(14*minmn+4,10*minmn+2+25*(25+8))+MAX(m,n)),overwrite_a=0)
  u,s,vt,info = dgesdd(a,compute_uv=1,lwork=(compute_uv?4*minmn*minmn+MAX(m,n)+9*minmn:MAX(14*minmn+4,10*minmn+2+25*(25+8))+MAX(m,n)),overwrite_a=0)
  u,s,vt,info = cgesdd(a,compute_uv=1,lwork=(compute_uv?2*minmn*minmn+MAX(m,n)+2*minmn:2*minmn+MAX(m,n)),overwrite_a=0)
  u,s,vt,info = zgesdd(a,compute_uv=1,lwork=(compute_uv?2*minmn*minmn+MAX(m,n)+2*minmn:2*minmn+MAX(m,n)),overwrite_a=0)
  v,x,s,rank,info = sgelss(a,b,cond=-1.0,lwork=3*minmn+MAX(2*minmn,MAX(maxmn,nrhs)),overwrite_a=0,overwrite_b=0)
  v,x,s,rank,info = dgelss(a,b,cond=-1.0,lwork=3*minmn+MAX(2*minmn,MAX(maxmn,nrhs)),overwrite_a=0,overwrite_b=0)
  v,x,s,rank,info = cgelss(a,b,cond=-1.0,lwork=2*minmn+MAX(maxmn,nrhs),overwrite_a=0,overwrite_b=0)
  v,x,s,rank,info = zgelss(a,b,cond=-1.0,lwork=2*minmn+MAX(maxmn,nrhs),overwrite_a=0,overwrite_b=0)
  qr,tau,work,info = sgeqrf(a,lwork=3*n,overwrite_a=0)
  qr,tau,work,info = dgeqrf(a,lwork=3*n,overwrite_a=0)
  qr,tau,work,info = cgeqrf(a,lwork=3*n,overwrite_a=0)
  qr,tau,work,info = zgeqrf(a,lwork=3*n,overwrite_a=0)
  qr,tau,work,info = sgerqf(a,lwork=3*n,overwrite_a=0)
  qr,tau,work,info = dgerqf(a,lwork=3*n,overwrite_a=0)
  qr,tau,work,info = cgerqf(a,lwork=3*n,overwrite_a=0)
  qr,tau,work,info = zgerqf(a,lwork=3*n,overwrite_a=0)
  q,work,info = sorgqr(a,tau,lwork=3*n,overwrite_a=0)
  q,work,info = dorgqr(a,tau,lwork=3*n,overwrite_a=0)
  q,work,info = cungqr(a,tau,lwork=3*n,overwrite_a=0)
  q,work,info = zungqr(a,tau,lwork=3*n,overwrite_a=0)
  wr,wi,vl,vr,info = sgeev(a,compute_vl=1,compute_vr=1,lwork=4*n,overwrite_a=0)
  wr,wi,vl,vr,info = dgeev(a,compute_vl=1,compute_vr=1,lwork=4*n,overwrite_a=0)
  w,vl,vr,info = cgeev(a,compute_vl=1,compute_vr=1,lwork=2*n,overwrite_a=0)
  w,vl,vr,info = zgeev(a,compute_vl=1,compute_vr=1,lwork=2*n,overwrite_a=0)
  alphar,alphai,beta,vl,vr,info = sgegv(a,b,compute_vl=1,compute_vr=1,lwork=8*n,overwrite_a=0,overwrite_b=0)
  alphar,alphai,beta,vl,vr,info = dgegv(a,b,compute_vl=1,compute_vr=1,lwork=8*n,overwrite_a=0,overwrite_b=0)
  alpha,beta,vl,vr,info = cgegv(a,b,compute_vl=1,compute_vr=1,lwork=2*n,overwrite_a=0,overwrite_b=0)
  alpha,beta,vl,vr,info = zgegv(a,b,compute_vl=1,compute_vr=1,lwork=2*n,overwrite_a=0,overwrite_b=0)
  w,v,info = ssyev(a,compute_v=1,lower=0,lwork=3*n-1,overwrite_a=0)
  w,v,info = dsyev(a,compute_v=1,lower=0,lwork=3*n-1,overwrite_a=0)
  w,v,info = cheev(a,compute_v=1,lower=0,lwork=2*n-1,overwrite_a=0)
  w,v,info = zheev(a,compute_v=1,lower=0,lwork=2*n-1,overwrite_a=0)
  c,x,info = sposv(a,b,lower=0,overwrite_a=0,overwrite_b=0)
  c,x,info = dposv(a,b,lower=0,overwrite_a=0,overwrite_b=0)
  c,x,info = cposv(a,b,lower=0,overwrite_a=0,overwrite_b=0)
  c,x,info = zposv(a,b,lower=0,overwrite_a=0,overwrite_b=0)
  c,info = spotrf(a,lower=0,clean=1,overwrite_a=0)
  c,info = dpotrf(a,lower=0,clean=1,overwrite_a=0)
  c,info = cpotrf(a,lower=0,clean=1,overwrite_a=0)
  c,info = zpotrf(a,lower=0,clean=1,overwrite_a=0)
  x,info = spotrs(c,b,lower=0,overwrite_b=0)
  x,info = dpotrs(c,b,lower=0,overwrite_b=0)
  x,info = cpotrs(c,b,lower=0,overwrite_b=0)
  x,info = zpotrs(c,b,lower=0,overwrite_b=0)
  inv_a,info = spotri(c,lower=0,overwrite_c=0)
  inv_a,info = dpotri(c,lower=0,overwrite_c=0)
  inv_a,info = cpotri(c,lower=0,overwrite_c=0)
  inv_a,info = zpotri(c,lower=0,overwrite_c=0)
  a,info = slauum(c,lower=0,overwrite_c=0)
  a,info = dlauum(c,lower=0,overwrite_c=0)
  a,info = clauum(c,lower=0,overwrite_c=0)
  a,info = zlauum(c,lower=0,overwrite_c=0)
  inv_c,info = strtri(c,lower=0,unitdiag=0,overwrite_c=0)
  inv_c,info = dtrtri(c,lower=0,unitdiag=0,overwrite_c=0)
  inv_c,info = ctrtri(c,lower=0,unitdiag=0,overwrite_c=0)
  inv_c,info = ztrtri(c,lower=0,unitdiag=0,overwrite_c=0)
  a = slaswp(a,piv,k1=0,k2=len(piv)-1,off=0,inc=1,overwrite_a=0)
  a = dlaswp(a,piv,k1=0,k2=len(piv)-1,off=0,inc=1,overwrite_a=0)
  a = claswp(a,piv,k1=0,k2=len(piv)-1,off=0,inc=1,overwrite_a=0)
  a = zlaswp(a,piv,k1=0,k2=len(piv)-1,off=0,inc=1,overwrite_a=0)
  t,sdim,w,vs,work,info = cgees(cselect,a,compute_v=1,sort_t=0,lwork=3*n,cselect_extra_args=(),overwrite_a=0)
  t,sdim,w,vs,work,info = zgees(zselect,a,compute_v=1,sort_t=0,lwork=3*n,zselect_extra_args=(),overwrite_a=0)
  t,sdim,wr,wi,vs,work,info = dgees(dselect,a,compute_v=1,sort_t=0,lwork=3*n,dselect_extra_args=(),overwrite_a=0)
  t,sdim,wr,wi,vs,work,info = sgees(sselect,a,compute_v=1,sort_t=0,lwork=3*n,sselect_extra_args=(),overwrite_a=0)
  alphar,alphai,beta,vl,vr,work,info = sggev(a,b,compute_vl=1,compute_vr=1,lwork=8*n,overwrite_a=0,overwrite_b=0)
  alphar,alphai,beta,vl,vr,work,info = dggev(a,b,compute_vl=1,compute_vr=1,lwork=8*n,overwrite_a=0,overwrite_b=0)
  alpha,beta,vl,vr,work,info = cggev(a,b,compute_vl=1,compute_vr=1,lwork=2*n,overwrite_a=0,overwrite_b=0)
  alpha,beta,vl,vr,work,info = zggev(a,b,compute_vl=1,compute_vr=1,lwork=2*n,overwrite_a=0,overwrite_b=0)
  w,z,info = ssbev(ab,compute_v=1,lower=0,ldab=shape(ab,0),overwrite_ab=1)
  w,z,info = dsbev(ab,compute_v=1,lower=0,ldab=shape(ab,0),overwrite_ab=1)
  w,z,info = ssbevd(ab,compute_v=1,lower=0,ldab=shape(ab,0),liwork=(compute_v?3+5*n:1),overwrite_ab=1)
  w,z,info = dsbevd(ab,compute_v=1,lower=0,ldab=shape(ab,0),liwork=(compute_v?3+5*n:1),overwrite_ab=1)
  w,z,m,ifail,info = ssbevx(ab,vl,vu,il,iu,ldab=shape(ab,0),compute_v=1,range=0,lower=0,abstol=0.0,mmax=(compute_v?(range==2?(iu-il+1):n):1),overwrite_ab=1)
  w,z,m,ifail,info = dsbevx(ab,vl,vu,il,iu,ldab=shape(ab,0),compute_v=1,range=0,lower=0,abstol=0.0,mmax=(compute_v?(range==2?(iu-il+1):n):1),overwrite_ab=1)
  w,z,info = chbevd(ab,compute_v=1,lower=0,ldab=shape(ab,0),lrwork=(compute_v?1+5*n+2*n*n:n),liwork=(compute_v?3+5*n:1),overwrite_ab=1)
  w,z,info = zhbevd(ab,compute_v=1,lower=0,ldab=shape(ab,0),lrwork=(compute_v?1+5*n+2*n*n:n),liwork=(compute_v?3+5*n:1),overwrite_ab=1)
  w,z,m,ifail,info = chbevx(ab,vl,vu,il,iu,ldab=shape(ab,0),compute_v=1,range=0,lower=0,abstol=0.0,mmax=(compute_v?(range==2?(iu-il+1):n):1),overwrite_ab=1)
  w,z,m,ifail,info = zhbevx(ab,vl,vu,il,iu,ldab=shape(ab,0),compute_v=1,range=0,lower=0,abstol=0.0,mmax=(compute_v?(range==2?(iu-il+1):n):1),overwrite_ab=1)
  lu,ipiv,info = sgbtrf(ab,kl,ku,m=shape(ab,1),n=shape(ab,1),ldab=shape(ab,0),overwrite_ab=0)
  lu,ipiv,info = dgbtrf(ab,kl,ku,m=shape(ab,1),n=shape(ab,1),ldab=shape(ab,0),overwrite_ab=0)
  lu,ipiv,info = cgbtrf(ab,kl,ku,m=shape(ab,1),n=shape(ab,1),ldab=shape(ab,0),overwrite_ab=0)
  lu,ipiv,info = zgbtrf(ab,kl,ku,m=shape(ab,1),n=shape(ab,1),ldab=shape(ab,0),overwrite_ab=0)
  x,info = sgbtrs(ab,kl,ku,b,ipiv,trans=0,n=shape(ab,1),ldab=shape(ab,0),ldb=shape(b,0),overwrite_b=0)
  x,info = dgbtrs(ab,kl,ku,b,ipiv,trans=0,n=shape(ab,1),ldab=shape(ab,0),ldb=shape(b,0),overwrite_b=0)
  x,info = cgbtrs(ab,kl,ku,b,ipiv,trans=0,n=shape(ab,1),ldab=shape(ab,0),ldb=shape(b,0),overwrite_b=0)
  x,info = zgbtrs(ab,kl,ku,b,ipiv,trans=0,n=shape(ab,1),ldab=shape(ab,0),ldb=shape(b,0),overwrite_b=0)
  w,z,info = ssyevr(a,jobz='V',range='A',uplo='L',il=1,iu=n,lwork=26*n,overwrite_a=0)
  w,z,info = dsyevr(a,jobz='V',range='A',uplo='L',il=1,iu=n,lwork=26*n,overwrite_a=0)
  w,z,info = cheevr(a,jobz='V',range='A',uplo='L',il=1,iu=n,lwork=18*n,overwrite_a=0)
  w,z,info = zheevr(a,jobz='V',range='A',uplo='L',il=1,iu=n,lwork=18*n,overwrite_a=0)
  a,w,info = ssygv(a,b,itype=1,jobz='V',uplo='L',overwrite_a=0,overwrite_b=0)
  a,w,info = dsygv(a,b,itype=1,jobz='V',uplo='L',overwrite_a=0,overwrite_b=0)
  a,w,info = chegv(a,b,itype=1,jobz='V',uplo='L',overwrite_a=0,overwrite_b=0)
  a,w,info = zhegv(a,b,itype=1,jobz='V',uplo='L',overwrite_a=0,overwrite_b=0)
  a,w,info = ssygvd(a,b,itype=1,jobz='V',uplo='L',lwork=1+6*n+2*n*n,overwrite_a=0,overwrite_b=0)
  a,w,info = dsygvd(a,b,itype=1,jobz='V',uplo='L',lwork=1+6*n+2*n*n,overwrite_a=0,overwrite_b=0)
  a,w,info = chegvd(a,b,itype=1,jobz='V',uplo='L',lwork=2*n+n*n,overwrite_a=0,overwrite_b=0)
  a,w,info = zhegvd(a,b,itype=1,jobz='V',uplo='L',lwork=2*n+n*n,overwrite_a=0,overwrite_b=0)
  w,z,ifail,info = ssygvx(a,b,iu,itype=1,jobz='V',uplo='L',il=1,lwork=8*n,overwrite_a=0,overwrite_b=0)
  w,z,ifail,info = dsygvx(a,b,iu,itype=1,jobz='V',uplo='L',il=1,lwork=8*n,overwrite_a=0,overwrite_b=0)
  w,z,ifail,info = chegvx(a,b,iu,itype=1,jobz='V',uplo='L',il=1,lwork=18*n-1,overwrite_a=0,overwrite_b=0)
  w,z,ifail,info = zhegvx(a,b,iu,itype=1,jobz='V',uplo='L',il=1,lwork=18*n-1,overwrite_a=0,overwrite_b=0)
  slamch = slamch(cmach)
  dlamch = dlamch(cmach)
.
"""
# no imports

# Variables with simple values

__version__ = '$Revision: $'

# no functions
# no classes
# variables with complex values

cgbsv = None  # (!) real value is ''

cgbtrf = None  # (!) real value is ''

cgbtrs = None  # (!) real value is ''

cgebal = None  # (!) real value is ''

cgees = None  # (!) real value is ''

cgeev = None  # (!) real value is ''

cgegv = None  # (!) real value is ''

cgehrd = None  # (!) real value is ''

cgelss = None  # (!) real value is ''

cgeqrf = None  # (!) real value is ''

cgerqf = None  # (!) real value is ''

cgesdd = None  # (!) real value is ''

cgesv = None  # (!) real value is ''

cgetrf = None  # (!) real value is ''

cgetri = None  # (!) real value is ''

cgetrs = None  # (!) real value is ''

cggev = None  # (!) real value is ''

chbevd = None  # (!) real value is ''

chbevx = None  # (!) real value is ''

cheev = None  # (!) real value is ''

cheevr = None  # (!) real value is ''

chegv = None  # (!) real value is ''

chegvd = None  # (!) real value is ''

chegvx = None  # (!) real value is ''

claswp = None  # (!) real value is ''

clauum = None  # (!) real value is ''

cpbsv = None  # (!) real value is ''

cpbtrf = None  # (!) real value is ''

cpbtrs = None  # (!) real value is ''

cposv = None  # (!) real value is ''

cpotrf = None  # (!) real value is ''

cpotri = None  # (!) real value is ''

cpotrs = None  # (!) real value is ''

ctrtri = None  # (!) real value is ''

ctrtrs = None  # (!) real value is ''

cungqr = None  # (!) real value is ''

dgbsv = None  # (!) real value is ''

dgbtrf = None  # (!) real value is ''

dgbtrs = None  # (!) real value is ''

dgebal = None  # (!) real value is ''

dgees = None  # (!) real value is ''

dgeev = None  # (!) real value is ''

dgegv = None  # (!) real value is ''

dgehrd = None  # (!) real value is ''

dgelss = None  # (!) real value is ''

dgeqrf = None  # (!) real value is ''

dgerqf = None  # (!) real value is ''

dgesdd = None  # (!) real value is ''

dgesv = None  # (!) real value is ''

dgetrf = None  # (!) real value is ''

dgetri = None  # (!) real value is ''

dgetrs = None  # (!) real value is ''

dggev = None  # (!) real value is ''

dlamch = None  # (!) real value is ''

dlaswp = None  # (!) real value is ''

dlauum = None  # (!) real value is ''

dorgqr = None  # (!) real value is ''

dpbsv = None  # (!) real value is ''

dpbtrf = None  # (!) real value is ''

dpbtrs = None  # (!) real value is ''

dposv = None  # (!) real value is ''

dpotrf = None  # (!) real value is ''

dpotri = None  # (!) real value is ''

dpotrs = None  # (!) real value is ''

dsbev = None  # (!) real value is ''

dsbevd = None  # (!) real value is ''

dsbevx = None  # (!) real value is ''

dsyev = None  # (!) real value is ''

dsyevr = None  # (!) real value is ''

dsygv = None  # (!) real value is ''

dsygvd = None  # (!) real value is ''

dsygvx = None  # (!) real value is ''

dtrtri = None  # (!) real value is ''

dtrtrs = None  # (!) real value is ''

sgbsv = None  # (!) real value is ''

sgbtrf = None  # (!) real value is ''

sgbtrs = None  # (!) real value is ''

sgebal = None  # (!) real value is ''

sgees = None  # (!) real value is ''

sgeev = None  # (!) real value is ''

sgegv = None  # (!) real value is ''

sgehrd = None  # (!) real value is ''

sgelss = None  # (!) real value is ''

sgeqrf = None  # (!) real value is ''

sgerqf = None  # (!) real value is ''

sgesdd = None  # (!) real value is ''

sgesv = None  # (!) real value is ''

sgetrf = None  # (!) real value is ''

sgetri = None  # (!) real value is ''

sgetrs = None  # (!) real value is ''

sggev = None  # (!) real value is ''

slamch = None  # (!) real value is ''

slaswp = None  # (!) real value is ''

slauum = None  # (!) real value is ''

sorgqr = None  # (!) real value is ''

spbsv = None  # (!) real value is ''

spbtrf = None  # (!) real value is ''

spbtrs = None  # (!) real value is ''

sposv = None  # (!) real value is ''

spotrf = None  # (!) real value is ''

spotri = None  # (!) real value is ''

spotrs = None  # (!) real value is ''

ssbev = None  # (!) real value is ''

ssbevd = None  # (!) real value is ''

ssbevx = None  # (!) real value is ''

ssyev = None  # (!) real value is ''

ssyevr = None  # (!) real value is ''

ssygv = None  # (!) real value is ''

ssygvd = None  # (!) real value is ''

ssygvx = None  # (!) real value is ''

strtri = None  # (!) real value is ''

strtrs = None  # (!) real value is ''

zgbsv = None  # (!) real value is ''

zgbtrf = None  # (!) real value is ''

zgbtrs = None  # (!) real value is ''

zgebal = None  # (!) real value is ''

zgees = None  # (!) real value is ''

zgeev = None  # (!) real value is ''

zgegv = None  # (!) real value is ''

zgehrd = None  # (!) real value is ''

zgelss = None  # (!) real value is ''

zgeqrf = None  # (!) real value is ''

zgerqf = None  # (!) real value is ''

zgesdd = None  # (!) real value is ''

zgesv = None  # (!) real value is ''

zgetrf = None  # (!) real value is ''

zgetri = None  # (!) real value is ''

zgetrs = None  # (!) real value is ''

zggev = None  # (!) real value is ''

zhbevd = None  # (!) real value is ''

zhbevx = None  # (!) real value is ''

zheev = None  # (!) real value is ''

zheevr = None  # (!) real value is ''

zhegv = None  # (!) real value is ''

zhegvd = None  # (!) real value is ''

zhegvx = None  # (!) real value is ''

zlaswp = None  # (!) real value is ''

zlauum = None  # (!) real value is ''

zpbsv = None  # (!) real value is ''

zpbtrf = None  # (!) real value is ''

zpbtrs = None  # (!) real value is ''

zposv = None  # (!) real value is ''

zpotrf = None  # (!) real value is ''

zpotri = None  # (!) real value is ''

zpotrs = None  # (!) real value is ''

ztrtri = None  # (!) real value is ''

ztrtrs = None  # (!) real value is ''

zungqr = None  # (!) real value is ''
