# encoding: utf-8
# module scipy.special._cephes
# from /usr/lib/python2.7/dist-packages/scipy/special/_cephes.so by generator 1.96
# no doc
# no imports

# Variables with simple values

__version__ = '2.0'

# functions

# real signature unknown; restored from __doc__


def airy(x, out1=None, out2=None, out3=None, out4=None):
    """
    airy(x[, out1, out2, out3, out4])
    
    (Ai,Aip,Bi,Bip)=airy(z) calculates the Airy functions and their derivatives
    evaluated at real or complex number z.  The Airy functions Ai and Bi 
    are two independent solutions of y''(x)=xy.  Aip and Bip are the first derivatives
    evaluated at x of Ai and Bi respectively.
    """
    pass


# real signature unknown; restored from __doc__
def airye(x, out1=None, out2=None, out3=None, out4=None):
    """
    airye(x[, out1, out2, out3, out4])
    
    (Aie,Aipe,Bie,Bipe)=airye(z) calculates the exponentially scaled Airy functions and 
    their derivatives evaluated at real or complex number z.  
    airye(z)[0:1] = airy(z)[0:1] * exp(2.0/3.0*z*sqrt(z))
    airye(z)[2:3] = airy(z)[2:3] * exp(-abs((2.0/3.0*z*sqrt(z)).real))
    """
    pass


# real signature unknown; restored from __doc__
def bdtr(x1, x2, x3, out=None):
    """
    bdtr(x1, x2, x3[, out])
    
    y=bdtr(k,n,p) returns the sum of the terms 0 through k of the
    Binomial probability density:  sum(nCj p**j (1-p)**(n-j),j=0..k)
    """
    pass


# real signature unknown; restored from __doc__
def bdtrc(x1, x2, x3, out=None):
    """
    bdtrc(x1, x2, x3[, out])
    
    y=bdtrc(k,n,p) returns the sum of the terms k+1 through n of the
    Binomial probability density: sum(nCj p**j (1-p)**(n-j), j=k+1..n)
    """
    pass


# real signature unknown; restored from __doc__
def bdtri(x1, x2, x3, out=None):
    """
    bdtri(x1, x2, x3[, out])
    
    p=bdtri(k,n,y) finds the probability p such that the sum of the
    terms 0 through k of the Binomial probability density is equal to the
    given cumulative probability y.
    """
    pass


# real signature unknown; restored from __doc__
def bdtrik(x1, x2, x3, out=None):
    """ bdtrik(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def bdtrin(x1, x2, x3, out=None):
    """ bdtrin(x1, x2, x3[, out]) """
    pass


def bei(x, out=None):  # real signature unknown; restored from __doc__
    """
    bei(x[, out])
    
    y=bei(x) returns the Kelvin function bei x
    """
    pass


def beip(x, out=None):  # real signature unknown; restored from __doc__
    """
    beip(x[, out])
    
    y=beip(x) returns the derivative of the Kelvin function bei x
    """
    pass


def ber(x, out=None):  # real signature unknown; restored from __doc__
    """
    ber(x[, out])
    
    y=ber(x) returns the Kelvin function ber x
    """
    pass


def berp(x, out=None):  # real signature unknown; restored from __doc__
    """
    berp(x[, out])
    
    y=berp(x) returns the derivative of the Kelvin function ber x
    """
    pass


# real signature unknown; restored from __doc__
def besselpoly(x1, x2, x3, out=None):
    """
    besselpoly(x1, x2, x3[, out])
    
    y=besselpoly(a,lam,nu) returns the value of the integral:
    integral(x**lam * jv(nu,2*a*x),x=0..1).
    """
    pass


def beta(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    beta(x1, x2[, out])
    
    y=beta(a,b) returns gamma(a) * gamma(b) / gamma(a+b)
    """
    pass


# real signature unknown; restored from __doc__
def betainc(x1, x2, x3, out=None):
    """
    betainc(x1, x2, x3[, out])
    
    y=betainc(a,b,x) returns the incomplete beta integral of the
    arguments, evaluated from zero to x: 
    
    gamma(a+b) / (gamma(a)*gamma(b)) * integral(t**(a-1) (1-t)**(b-1), t=0..x).
    
    Note
    ----
    The incomplete beta is also sometimes defined without the terms
    in gamma, in which case the above definition is the so-called regularized
    incomplete beta. Under this definition, you can get the incomplete beta by
    multiplying the result of the scipy function by beta(a, b).
    """
    pass


# real signature unknown; restored from __doc__
def betaincinv(x1, x2, x3, out=None):
    """
    betaincinv(x1, x2, x3[, out])
    
    x=betaincinv(a,b,y) returns x such that betainc(a,b,x) = y.
    """
    pass


def betaln(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    betaln(x1, x2[, out])
    
    y=betaln(a,b) returns the natural logarithm of the absolute value of
    beta: ln(|beta(x)|).
    """
    pass


# real signature unknown; restored from __doc__
def btdtr(x1, x2, x3, out=None):
    """
    btdtr(x1, x2, x3[, out])
    
    y=btdtr(a,b,x) returns the area from zero to x under the beta
    density function: gamma(a+b)/(gamma(a)*gamma(b)))*integral(t**(a-1)
    (1-t)**(b-1), t=0..x).  SEE ALSO betainc
    """
    pass


# real signature unknown; restored from __doc__
def btdtri(x1, x2, x3, out=None):
    """
    btdtri(x1, x2, x3[, out])
    
    x=btdtri(a,b,p) returns the pth quantile of the beta distribution.  It is
    effectively the inverse of btdtr returning the value of x for which 
    btdtr(a,b,x) = p.   SEE ALSO betaincinv
    """
    pass


# real signature unknown; restored from __doc__
def btdtria(x1, x2, x3, out=None):
    """ btdtria(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def btdtrib(x1, x2, x3, out=None):
    """ btdtrib(x1, x2, x3[, out]) """
    pass


def cbrt(x, out=None):  # real signature unknown; restored from __doc__
    """
    cbrt(x[, out])
    
    y=cbrt(x) returns the real cube root of x.
    """
    pass


def chdtr(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    chdtr(x1, x2[, out])
    
    p=chdtr(v,x) Returns the area under the left hand tail (from 0 to x) of the Chi
    square probability density function with v degrees of freedom:
    1/(2**(v/2) * gamma(v/2)) * integral(t**(v/2-1) * exp(-t/2), t=0..x)
    """
    pass


def chdtrc(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    chdtrc(x1, x2[, out])
    
    p=chdtrc(v,x) returns the area under the right hand tail (from x to
    infinity) of the Chi square probability density function with v
    degrees of freedom:
    1/(2**(v/2) * gamma(v/2)) * integral(t**(v/2-1) * exp(-t/2), t=x..inf)
    """
    pass


def chdtri(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    chdtri(x1, x2[, out])
    
    x=chdtri(v,p) returns the argument x such that chdtrc(v,x) is equal
    to p.
    """
    pass


def chdtriv(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """ chdtriv(x1, x2[, out]) """
    pass


# real signature unknown; restored from __doc__
def chndtr(x1, x2, x3, out=None):
    """ chndtr(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def chndtridf(x1, x2, x3, out=None):
    """ chndtridf(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def chndtrinc(x1, x2, x3, out=None):
    """ chndtrinc(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def chndtrix(x1, x2, x3, out=None):
    """ chndtrix(x1, x2, x3[, out]) """
    pass


def cosdg(x, out=None):  # real signature unknown; restored from __doc__
    """
    cosdg(x[, out])
    
    y=cosdg(x) calculates the cosine of the angle x given in degrees.
    """
    pass


def cosm1(x, out=None):  # real signature unknown; restored from __doc__
    """
    cosm1(x[, out])
    
    y=calculates cos(x) - 1 for use when x is near zero.
    """
    pass


def cotdg(x, out=None):  # real signature unknown; restored from __doc__
    """
    cotdg(x[, out])
    
    y=cotdg(x) calculates the cotangent of the angle x given in degrees.
    """
    pass


def dawsn(x, out=None):  # real signature unknown; restored from __doc__
    """
    dawsn(x[, out])
    
    y=dawsn(x) returns dawson's integral: exp(-x**2) *
    integral(exp(t**2),t=0..x).
    """
    pass


def ellipe(x, out=None):  # real signature unknown; restored from __doc__
    """
    ellipe(x[, out])
    
    y=ellipe(m) returns the complete integral of the second kind:
    integral(sqrt(1-m*sin(t)**2),t=0..pi/2)
    """
    pass


# real signature unknown; restored from __doc__
def ellipeinc(x1, x2, out=None):
    """
    ellipeinc(x1, x2[, out])
    
    y=ellipeinc(phi,m) returns the incomplete elliptic integral of the
    second kind: integral(sqrt(1-m*sin(t)**2),t=0..phi)
    """
    pass


# real signature unknown; restored from __doc__
def ellipj(x1, x2, out1=None, out2=None, out3=None, out4=None):
    """
    ellipj(x1, x2[, out1, out2, out3, out4])
    
    (sn,cn,dn,ph)=ellipj(u,m) calculates the Jacobian elliptic functions of
    parameter m between 0 and 1, and real u.  The returned functions are
    often written sn(u|m), cn(u|m), and dn(u|m).  The value of ph is such
    that if u = ellik(ph,m), then sn(u|m) = sin(ph) and cn(u|m) = cos(ph).
    """
    pass


def ellipk(x, out=None):  # real signature unknown; restored from __doc__
    """
    ellipk(x[, out])
    
    y=ellipk(m) returns the complete integral of the first kind:
    integral(1/sqrt(1-m*sin(t)**2),t=0..pi/2)
    """
    pass


# real signature unknown; restored from __doc__
def ellipkinc(x1, x2, out=None):
    """
    ellipkinc(x1, x2[, out])
    
    y=ellipkinc(phi,m) returns the incomplete elliptic integral of the first
    kind: integral(1/sqrt(1-m*sin(t)**2),t=0..phi)
    """
    pass


def erf(x, out=None):  # real signature unknown; restored from __doc__
    """
    erf(x[, out])
    
    y=erf(z) returns the error function of complex argument defined as
    as 2/sqrt(pi)*integral(exp(-t**2),t=0..z)
    """
    pass


def erfc(x, out=None):  # real signature unknown; restored from __doc__
    """
    erfc(x[, out])
    
    y=erfc(x) returns 1 - erf(x).
    """
    pass


# real signature unknown; NOTE: unreliably restored from __doc__
def errprint(*args, **kwargs):
    """
    errprint({flag}) sets the error printing flag for special functions
        (from the cephesmodule). The output is the previous state.
        With errprint(0) no error messages are shown;
        the default is errprint(1).
        If no argument is given the current state of
        the flag is returned and no change occurs.
    """
    pass


def exp1(x, out=None):  # real signature unknown; restored from __doc__
    """
    exp1(x[, out])
    
    y=exp1(z) returns the exponential integral (n=1) of complex argument
    z: integral(exp(-z*t)/t,t=1..inf).
    """
    pass


def exp10(x, out=None):  # real signature unknown; restored from __doc__
    """
    exp10(x[, out])
    
    y=exp10(x) returns 10 raised to the x power.
    """
    pass


def exp2(x, out=None):  # real signature unknown; restored from __doc__
    """
    exp2(x[, out])
    
    y=exp2(x) returns 2 raised to the x power.
    """
    pass


def expi(x, out=None):  # real signature unknown; restored from __doc__
    """
    expi(x[, out])
    
    y=expi(x) returns an exponential integral of argument x defined as
    integral(exp(t)/t,t=-inf..x).  See expn for a different exponential
    integral.
    """
    pass


def expm1(x, out=None):  # real signature unknown; restored from __doc__
    """
    expm1(x[, out])
    
    y=expm1(x) calculates exp(x) - 1 for use when x is near zero.
    """
    pass


def expn(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    expn(x1, x2[, out])
    
    y=expn(n,x) returns the exponential integral for integer n and
    non-negative x and n: integral(exp(-x*t) / t**n, t=1..inf).
    """
    pass


# real signature unknown; restored from __doc__
def fdtr(x1, x2, x3, out=None):
    """
    fdtr(x1, x2, x3[, out])
    
    y=fdtr(dfn,dfd,x) returns the area from zero to x under the F density
    function (also known as Snedcor's density or the variance ratio
    density).  This is the density of X = (unum/dfn)/(uden/dfd), where unum and
    uden are random variables having Chi square distributions with dfn and
    dfd degrees of freedom, respectively.
    """
    pass


# real signature unknown; restored from __doc__
def fdtrc(x1, x2, x3, out=None):
    """
    fdtrc(x1, x2, x3[, out])
    
    y=fdtrc(dfn,dfd,x) returns the complemented F distribution function.
    """
    pass


# real signature unknown; restored from __doc__
def fdtri(x1, x2, x3, out=None):
    """
    fdtri(x1, x2, x3[, out])
    
    x=fdtri(dfn,dfd,p) finds the F density argument x such that 
    fdtr(dfn,dfd,x)=p.
    """
    pass


# real signature unknown; restored from __doc__
def fdtridfd(x1, x2, x3, out=None):
    """ fdtridfd(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def fresnel(x, out1=None, out2=None):
    """
    fresnel(x[, out1, out2])
    
    (ssa,cca)=fresnel(z) returns the fresnel sin and cos integrals: integral(sin(pi/2
    * t**2),t=0..z) and integral(cos(pi/2 * t**2),t=0..z) for real or 
    complex z.
    """
    pass


def gamma(x, out=None):  # real signature unknown; restored from __doc__
    """
    gamma(x[, out])
    
    y=gamma(z) returns the gamma function of the argument.  The gamma
    function is often referred to as the generalized factorial since 
    z*gamma(z) = gamma(z+1) and gamma(n+1) = n! for natural number n.
    """
    pass


# real signature unknown; restored from __doc__
def gammainc(x1, x2, out=None):
    """
    gammainc(x1, x2[, out])
    
    y=gammainc(a,x) returns the incomplete gamma integral defined as
    1 / gamma(a) * integral(exp(-t) * t**(a-1), t=0..x).  Both arguments
    must be positive.
    """
    pass


# real signature unknown; restored from __doc__
def gammaincc(x1, x2, out=None):
    """
    gammaincc(x1, x2[, out])
    
    y=gammaincc(a,x) returns the complemented incomplete gamma integral
    defined as 1 / gamma(a) * integral(exp(-t) * t**(a-1), t=x..inf) = 1 -
    gammainc(a,x).  Both arguments must be positive.
    """
    pass


# real signature unknown; restored from __doc__
def gammainccinv(x1, x2, out=None):
    """
    gammainccinv(x1, x2[, out])
    
    x=gammainccinv(a,y) returns x such that gammaincc(a,x) = y.
    """
    pass


# real signature unknown; restored from __doc__
def gammaincinv(x1, x2, out=None):
    """
    gammaincinv(x1, x2[, out])
    
    gammaincinv(a, y) returns x such that gammainc(a, x) = y.
    """
    pass


def gammaln(x, out=None):  # real signature unknown; restored from __doc__
    """
    gammaln(x[, out])
    
    y=gammaln(z) returns the base e logarithm of the absolute value of the
    gamma function of z: ln(|gamma(z)|)
    """
    pass


# real signature unknown; restored from __doc__
def gdtr(x1, x2, x3, out=None):
    """
    gdtr(x1, x2, x3[, out])
    
    y=gdtr(a,b,x) returns the integral from zero to x of the gamma
    probability density function: a**b / gamma(b) * integral(t**(b-1) exp(-at),t=0..x).
    The arguments a and b are used differently here than in other definitions.
    """
    pass


# real signature unknown; restored from __doc__
def gdtrc(x1, x2, x3, out=None):
    """
    gdtrc(x1, x2, x3[, out])
    
    y=gdtrc(a,b,x) returns the integral from x to infinity of the gamma
    probability density function.  SEE gdtr, gdtri
    """
    pass


# real signature unknown; restored from __doc__
def gdtria(x1, x2, x3, out=None):
    """ gdtria(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def gdtrib(x1, x2, x3, out=None):
    """ gdtrib(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def gdtrix(x1, x2, x3, out=None):
    """ gdtrix(x1, x2, x3[, out]) """
    pass


def hankel1(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    hankel1(x1, x2[, out])
    
    y=hankel1(v,z) returns the Hankel function of the first kind for real order v and complex argument z.
    """
    pass


# real signature unknown; restored from __doc__
def hankel1e(x1, x2, out=None):
    """
    hankel1e(x1, x2[, out])
    
    y=hankel1e(v,z) returns the exponentially scaled Hankel function of the first
    kind for real order v and complex argument z:
    hankel1e(v,z) = hankel1(v,z) * exp(-1j * z)
    """
    pass


def hankel2(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    hankel2(x1, x2[, out])
    
    y=hankel2(v,z) returns the Hankel function of the second kind for real order v and complex argument z.
    """
    pass


# real signature unknown; restored from __doc__
def hankel2e(x1, x2, out=None):
    """
    hankel2e(x1, x2[, out])
    
    y=hankel2e(v,z) returns the exponentially scaled Hankel function of the second
    kind for real order v and complex argument z:
    hankel1e(v,z) = hankel1(v,z) * exp(1j * z)
    """
    pass


# real signature unknown; restored from __doc__
def hyp1f1(x1, x2, x3, out=None):
    """
    hyp1f1(x1, x2, x3[, out])
    
    y=hyp1f1(a,b,x) returns the confluent hypergeometeric function
    ( 1F1(a,b;x) ) evaluated at the values a, b, and x.
    """
    pass


# real signature unknown; restored from __doc__
def hyp1f2(x1, x2, x3, x4, out1=None, out2=None):
    """
    hyp1f2(x1, x2, x3, x4[, out1, out2])
    
    (y,err)=hyp1f2(a,b,c,x) returns (y,err) with the hypergeometric function 1F2 in y and an error estimate in err.
    """
    pass


# real signature unknown; restored from __doc__
def hyp2f0(x1, x2, x3, x4, out1=None, out2=None):
    """
    hyp2f0(x1, x2, x3, x4[, out1, out2])
    
    (y,err)=hyp2f0(a,b,x,type) returns (y,err) with the hypergeometric function 2F0 in y and an error estimate in err.  The input type determines a convergence factor and
    can be either 1 or 2.
    """
    pass


# real signature unknown; restored from __doc__
def hyp2f1(x1, x2, x3, x4, out=None):
    """
    hyp2f1(x1, x2, x3, x4[, out])
    
    y=hyp2f1(a,b,c,z) returns the gauss hypergeometric function
    ( 2F1(a,b;c;z) ).
    """
    pass


# real signature unknown; restored from __doc__
def hyp3f0(x1, x2, x3, x4, out1=None, out2=None):
    """
    hyp3f0(x1, x2, x3, x4[, out1, out2])
    
    (y,err)=hyp3f0(a,b,c,x) returns (y,err) with the hypergeometric function 3F0 in y and an error estimate in err.
    """
    pass


# real signature unknown; restored from __doc__
def hyperu(x1, x2, x3, out=None):
    """
    hyperu(x1, x2, x3[, out])
    
    y=hyperu(a,b,x) returns the confluent hypergeometric function of the
    second kind U(a,b,x).
    """
    pass


def i0(x, out=None):  # real signature unknown; restored from __doc__
    """
    i0(x[, out])
    
    y=i0(x) returns the modified Bessel function of order 0 at x.
    """
    pass


def i0e(x, out=None):  # real signature unknown; restored from __doc__
    """
    i0e(x[, out])
    
    y=i0e(x) returns the exponentially scaled modified Bessel function
    of order 0 at x.  i0e(x) = exp(-|x|) * i0(x).
    """
    pass


def i1(x, out=None):  # real signature unknown; restored from __doc__
    """
    i1(x[, out])
    
    y=i1(x) returns the modified Bessel function of order 1 at x.
    """
    pass


def i1e(x, out=None):  # real signature unknown; restored from __doc__
    """
    i1e(x[, out])
    
    y=i1e(x) returns the exponentially scaled modified Bessel function
    of order 0 at x.  i1e(x) = exp(-|x|) * i1(x).
    """
    pass


# real signature unknown; restored from __doc__
def it2i0k0(x, out1=None, out2=None):
    """
    it2i0k0(x[, out1, out2])
    
    (ii0,ik0)=it2i0k0(x) returns the integrals int((i0(t)-1)/t,t=0..x) and 
    int(k0(t)/t,t=x..infinitity).
    """
    pass


# real signature unknown; restored from __doc__
def it2j0y0(x, out1=None, out2=None):
    """
    it2j0y0(x[, out1, out2])
    
    (ij0,iy0)=it2j0y0(x) returns the integrals int((1-j0(t))/t,t=0..x) and 
    int(y0(t)/t,t=x..infinitity).
    """
    pass


def it2struve0(x, out=None):  # real signature unknown; restored from __doc__
    """
    it2struve0(x[, out])
    
    y=it2struve0(x) returns the integral of the Struve function of order 0 
    divided by t from x to infinity:  integral(H0(t)/t, t=x..inf).
    """
    pass


# real signature unknown; restored from __doc__
def itairy(x, out1=None, out2=None, out3=None, out4=None):
    """
    itairy(x[, out1, out2, out3, out4])
    
    (Apt,Bpt,Ant,Bnt)=itairy(x) calculates the integral of Airy functions from 0 to x
    for positive (Apt, Bpt) and negative (Ant, Bnt) arguments.
    """
    pass


# real signature unknown; restored from __doc__
def iti0k0(x, out1=None, out2=None):
    """
    iti0k0(x[, out1, out2])
    
    (ii0,ik0)=iti0k0(x) returns simple integrals from 0 to x of the zeroth order 
    modified bessel functions i0 and k0.
    """
    pass


# real signature unknown; restored from __doc__
def itj0y0(x, out1=None, out2=None):
    """
    itj0y0(x[, out1, out2])
    
    (ij0,iy0)=itj0y0(x) returns simple integrals from 0 to x of the zeroth order 
    bessel functions j0 and y0.
    """
    pass


def itmodstruve0(x, out=None):  # real signature unknown; restored from __doc__
    """
    itmodstruve0(x[, out])
    
    y=itmodstruve0(x) returns the integral of the modified Struve function
    of order 0 from 0 to x:  integral(L0(t), t=0..x).
    """
    pass


def itstruve0(x, out=None):  # real signature unknown; restored from __doc__
    """
    itstruve0(x[, out])
    
    y=itstruve0(x) returns the integral of the Struve function of order 0 
    from 0 to x:  integral(H0(t), t=0..x).
    """
    pass


def iv(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    iv(x1, x2[, out])
    
    y=iv(v,z) returns the modified Bessel function of real order v of
    z.  If z is of real type and negative, v must be integer valued.
    """
    pass


def ive(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    ive(x1, x2[, out])
    
    y=ive(v,z) returns the exponentially scaled modified Bessel function of 
    real order v and complex z: ive(v,z) = iv(v,z) * exp(-abs(z.real))
    """
    pass


def j0(x, out=None):  # real signature unknown; restored from __doc__
    """
    j0(x[, out])
    
    y=j0(x) returns the Bessel function of order 0 at x.
    """
    pass


def j1(x, out=None):  # real signature unknown; restored from __doc__
    """
    j1(x[, out])
    
    y=j1(x) returns the Bessel function of order 1 at x.
    """
    pass


def jn(*args, **kwargs):  # real signature unknown
    """
    jv(x1, x2[, out])
    
    y=jv(v,z) returns the Bessel function of real order v at complex z.
    """
    pass


def jv(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    jv(x1, x2[, out])
    
    y=jv(v,z) returns the Bessel function of real order v at complex z.
    """
    pass


def jve(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    jve(x1, x2[, out])
    
    y=jve(v,z) returns the exponentially scaled Bessel function of real order
    v at complex z: jve(v,z) = jv(v,z) * exp(-abs(z.imag))
    """
    pass


def k0(x, out=None):  # real signature unknown; restored from __doc__
    """
    k0(x[, out])
    
    y=k0(x) returns the modified Bessel function of the second kind (sometimes called the third kind) of
    order 0 at x.
    """
    pass


def k0e(x, out=None):  # real signature unknown; restored from __doc__
    """
    k0e(x[, out])
    
    y=k0e(x) returns the exponentially scaled modified Bessel function
    of the second kind (sometimes called the third kind) of order 0 at x.  k0e(x) = exp(x) * k0(x).
    """
    pass


def k1(x, out=None):  # real signature unknown; restored from __doc__
    """
    k1(x[, out])
    
    y=i1(x) returns the modified Bessel function of the second kind (sometimes called the third kind) of
    order 1 at x.
    """
    pass


def k1e(x, out=None):  # real signature unknown; restored from __doc__
    """
    k1e(x[, out])
    
    y=k1e(x) returns the exponentially scaled modified Bessel function
    of the second kind (sometimes called the third kind) of order 1 at x.  k1e(x) = exp(x) * k1(x)
    """
    pass


def kei(x, out=None):  # real signature unknown; restored from __doc__
    """
    kei(x[, out])
    
    y=kei(x) returns the Kelvin function ker x
    """
    pass


def keip(x, out=None):  # real signature unknown; restored from __doc__
    """
    keip(x[, out])
    
    y=keip(x) returns the derivative of the Kelvin function kei x
    """
    pass


# real signature unknown; restored from __doc__
def kelvin(x, out1=None, out2=None, out3=None, out4=None):
    """
    kelvin(x[, out1, out2, out3, out4])
    
    (Be, Ke, Bep, Kep)=kelvin(x) returns the tuple (Be, Ke, Bep, Kep) which containes 
    complex numbers representing the real and imaginary Kelvin functions 
    and their derivatives evaluated at x.  For example, 
    kelvin(x)[0].real = ber x and kelvin(x)[0].imag = bei x with similar 
    relationships for ker and kei.
    """
    pass


def ker(x, out=None):  # real signature unknown; restored from __doc__
    """
    ker(x[, out])
    
    y=ker(x) returns the Kelvin function ker x
    """
    pass


def kerp(x, out=None):  # real signature unknown; restored from __doc__
    """
    kerp(x[, out])
    
    y=kerp(x) returns the derivative of the Kelvin function ker x
    """
    pass


def kn(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    kn(x1, x2[, out])
    
    y=kn(n,x) returns the modified Bessel function of the second kind (sometimes called the third kind) for
    integer order n at x.
    """
    pass


def kolmogi(x, out=None):  # real signature unknown; restored from __doc__
    """
    kolmogi(x[, out])
    
    y=kolmogi(p) returns y such that kolmogorov(y) = p
    """
    pass


def kolmogorov(x, out=None):  # real signature unknown; restored from __doc__
    """
    kolmogorov(x[, out])
    
    p=kolmogorov(y) returns the complementary cumulative distribution 
    function of Kolmogorov's limiting distribution (Kn* for large n) 
    of a two-sided test for equality between an empirical and a theoretical 
    distribution. It is equal to the (limit as n->infinity of the) probability 
    that sqrt(n) * max absolute deviation > y.
    """
    pass


def kv(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    kv(x1, x2[, out])
    
    y=kv(v,z) returns the modified Bessel function of the second kind (sometimes called the third kind) for
    real order v at complex z.
    """
    pass


def kve(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    kve(x1, x2[, out])
    
    y=kve(v,z) returns the exponentially scaled, modified Bessel function
    of the second kind (sometimes called the third kind) for real order v at complex z: kve(v,z) = kv(v,z) * exp(z)
    """
    pass


def log1p(x, out=None):  # real signature unknown; restored from __doc__
    """
    log1p(x[, out])
    
    y=log1p(x) calculates log(1+x) for use when x is near zero.
    """
    pass


# real signature unknown; restored from __doc__
def lpmv(x1, x2, x3, out=None):
    """
    lpmv(x1, x2, x3[, out])
    
    y=lpmv(m,v,x) returns the associated legendre function of integer order
    m and real degree v (s.t. v>-m-1 or v<m): |x|<=1.
    """
    pass


# real signature unknown; restored from __doc__
def mathieu_a(x1, x2, out=None):
    """
    mathieu_a(x1, x2[, out])
    
    lmbda=mathieu_a(m,q) returns the characteristic value for the even solution, 
    ce_m(z,q), of Mathieu's equation
    """
    pass


# real signature unknown; restored from __doc__
def mathieu_b(x1, x2, out=None):
    """
    mathieu_b(x1, x2[, out])
    
    lmbda=mathieu_b(m,q) returns the characteristic value for the odd solution, 
    se_m(z,q), of Mathieu's equation
    """
    pass


# real signature unknown; restored from __doc__
def mathieu_cem(x1, x2, x3, out1=None, out2=None):
    """
    mathieu_cem(x1, x2, x3[, out1, out2])
    
    (y,yp)=mathieu_cem(m,q,x) returns the even Mathieu function, ce_m(x,q), 
    of order m and parameter q evaluated at x (given in degrees).
    Also returns the derivative with respect to x of ce_m(x,q)
    """
    pass


# real signature unknown; restored from __doc__
def mathieu_modcem1(x1, x2, x3, out1=None, out2=None):
    """
    mathieu_modcem1(x1, x2, x3[, out1, out2])
    
    (y,yp)=mathieu_modcem1(m,q,x) evaluates the even modified Matheiu function 
    of the first kind, Mc1m(x,q), and its derivative at x for order m and
    parameter q.
    """
    pass


# real signature unknown; restored from __doc__
def mathieu_modcem2(x1, x2, x3, out1=None, out2=None):
    """
    mathieu_modcem2(x1, x2, x3[, out1, out2])
    
    (y,yp)=mathieu_modcem2(m,q,x) evaluates the even modified Matheiu function 
    of the second kind, Mc2m(x,q), and its derivative at x (given in degrees)
    for order m and parameter q.
    """
    pass


# real signature unknown; restored from __doc__
def mathieu_modsem1(x1, x2, x3, out1=None, out2=None):
    """
    mathieu_modsem1(x1, x2, x3[, out1, out2])
    
    (y,yp)=mathieu_modsem1(m,q,x) evaluates the odd modified Matheiu function 
    of the first kind, Ms1m(x,q), and its derivative at x (given in degrees)
    for order m and parameter q.
    """
    pass


# real signature unknown; restored from __doc__
def mathieu_modsem2(x1, x2, x3, out1=None, out2=None):
    """
    mathieu_modsem2(x1, x2, x3[, out1, out2])
    
    (y,yp)=mathieu_modsem2(m,q,x) evaluates the odd modified Matheiu function
    of the second kind, Ms2m(x,q), and its derivative at x (given in degrees)
    for order m and parameter q.
    """
    pass


# real signature unknown; restored from __doc__
def mathieu_sem(x1, x2, x3, out1=None, out2=None):
    """
    mathieu_sem(x1, x2, x3[, out1, out2])
    
    (y,yp)=mathieu_sem(m,q,x) returns the odd Mathieu function, se_m(x,q), 
    of order m and parameter q evaluated at x (given in degrees).
    Also returns the derivative with respect to x of se_m(x,q).
    """
    pass


# real signature unknown; restored from __doc__
def modfresnelm(x, out1=None, out2=None):
    """
    modfresnelm(x[, out1, out2])
    
    (fm,km)=modfresnelp(x) returns the modified fresnel integrals F_-(x) amd K_-(x)
    as fp=integral(exp(-1j*t*t),t=x..inf) and kp=1/sqrt(pi)*exp(1j*(x*x+pi/4))*fp
    """
    pass


# real signature unknown; restored from __doc__
def modfresnelp(x, out1=None, out2=None):
    """
    modfresnelp(x[, out1, out2])
    
    (fp,kp)=modfresnelp(x) returns the modified fresnel integrals F_+(x) and K_+(x)
    as fp=integral(exp(1j*t*t),t=x..inf) and kp=1/sqrt(pi)*exp(-1j*(x*x+pi/4))*fp
    """
    pass


# real signature unknown; restored from __doc__
def modstruve(x1, x2, out=None):
    """
    modstruve(x1, x2[, out])
    
    y=modstruve(v,x) returns the modified Struve function Lv(x) of order
    v at x, x must be positive unless v is an integer and it is recommended
    that |v|<=20.
    """
    pass


# real signature unknown; restored from __doc__
def nbdtr(x1, x2, x3, out=None):
    """
    nbdtr(x1, x2, x3[, out])
    
    y=nbdtr(k,n,p) returns the sum of the terms 0 through k of the
    negative binomial distribution: sum((n+j-1)Cj p**n (1-p)**j,j=0..k).
    In a sequence of Bernoulli trials this is the probability that k or
    fewer failures precede the nth success.
    """
    pass


# real signature unknown; restored from __doc__
def nbdtrc(x1, x2, x3, out=None):
    """
    nbdtrc(x1, x2, x3[, out])
    
    y=nbdtrc(k,n,p) returns the sum of the terms k+1 to infinity of the
    negative binomial distribution.
    """
    pass


# real signature unknown; restored from __doc__
def nbdtri(x1, x2, x3, out=None):
    """
    nbdtri(x1, x2, x3[, out])
    
    p=nbdtri(k,n,y) finds the argument p such that nbdtr(k,n,p)=y.
    """
    pass


# real signature unknown; restored from __doc__
def nbdtrik(x1, x2, x3, out=None):
    """ nbdtrik(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def nbdtrin(x1, x2, x3, out=None):
    """ nbdtrin(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def ncfdtr(x1, x2, x3, x4, out=None):
    """ ncfdtr(x1, x2, x3, x4[, out]) """
    pass


# real signature unknown; restored from __doc__
def ncfdtri(x1, x2, x3, x4, out=None):
    """ ncfdtri(x1, x2, x3, x4[, out]) """
    pass


# real signature unknown; restored from __doc__
def ncfdtridfd(x1, x2, x3, x4, out=None):
    """ ncfdtridfd(x1, x2, x3, x4[, out]) """
    pass


# real signature unknown; restored from __doc__
def ncfdtridfn(x1, x2, x3, x4, out=None):
    """ ncfdtridfn(x1, x2, x3, x4[, out]) """
    pass


# real signature unknown; restored from __doc__
def ncfdtrinc(x1, x2, x3, x4, out=None):
    """ ncfdtrinc(x1, x2, x3, x4[, out]) """
    pass


# real signature unknown; restored from __doc__
def nctdtr(x1, x2, x3, out=None):
    """ nctdtr(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def nctdtridf(x1, x2, x3, out=None):
    """ nctdtridf(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def nctdtrinc(x1, x2, x3, out=None):
    """ nctdtrinc(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def nctdtrit(x1, x2, x3, out=None):
    """ nctdtrit(x1, x2, x3[, out]) """
    pass


def ndtr(x, out=None):  # real signature unknown; restored from __doc__
    """
    ndtr(x[, out])
    
    y=ndtr(x) returns the area under the standard Gaussian probability 
    density function, integrated from minus infinity to x:
    1/sqrt(2*pi) * integral(exp(-t**2 / 2),t=-inf..x)
    """
    pass


def ndtri(x, out=None):  # real signature unknown; restored from __doc__
    """
    ndtri(x[, out])
    
    x=ndtri(y) returns the argument x for which the area udnder the
    Gaussian probability density function (integrated from minus infinity
    to x) is equal to y.
    """
    pass


# real signature unknown; restored from __doc__
def nrdtrimn(x1, x2, x3, out=None):
    """ nrdtrimn(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def nrdtrisd(x1, x2, x3, out=None):
    """ nrdtrisd(x1, x2, x3[, out]) """
    pass


# real signature unknown; restored from __doc__
def obl_ang1(x1, x2, x3, x4, out1=None, out2=None):
    """
    obl_ang1(x1, x2, x3, x4[, out1, out2])
    
    (s,sp)=obl_ang1(m,n,c,x) computes the oblate sheroidal angular function 
    of the first kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0.
    """
    pass


# real signature unknown; restored from __doc__
def obl_ang1_cv(x1, x2, x3, x4, x5, out1=None, out2=None):
    """
    obl_ang1_cv(x1, x2, x3, x4, x5[, out1, out2])
    
    (s,sp)=obl_ang1_cv(m,n,c,cv,x) computes the oblate sheroidal angular function 
    of the first kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0. Requires pre-computed
    characteristic value.
    """
    pass


# real signature unknown; restored from __doc__
def obl_cv(x1, x2, x3, out=None):
    """
    obl_cv(x1, x2, x3[, out])
    
    cv=obl_cv(m,n,c) computes the characteristic value of oblate spheroidal 
    wave functions of order m,n (n>=m) and spheroidal parameter c.
    """
    pass


# real signature unknown; restored from __doc__
def obl_rad1(x1, x2, x3, x4, out1=None, out2=None):
    """
    obl_rad1(x1, x2, x3, x4[, out1, out2])
    
    (s,sp)=obl_rad1(m,n,c,x) computes the oblate sheroidal radial function 
    of the first kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0.
    """
    pass


# real signature unknown; restored from __doc__
def obl_rad1_cv(x1, x2, x3, x4, x5, out1=None, out2=None):
    """
    obl_rad1_cv(x1, x2, x3, x4, x5[, out1, out2])
    
    (s,sp)=obl_rad1_cv(m,n,c,cv,x) computes the oblate sheroidal radial function 
    of the first kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0. Requires pre-computed
    characteristic value.
    """
    pass


# real signature unknown; restored from __doc__
def obl_rad2(x1, x2, x3, x4, out1=None, out2=None):
    """
    obl_rad2(x1, x2, x3, x4[, out1, out2])
    
    (s,sp)=obl_rad2(m,n,c,x) computes the oblate sheroidal radial function 
    of the second kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0.
    """
    pass


# real signature unknown; restored from __doc__
def obl_rad2_cv(x1, x2, x3, x4, x5, out1=None, out2=None):
    """
    obl_rad2_cv(x1, x2, x3, x4, x5[, out1, out2])
    
    (s,sp)=obl_rad2_cv(m,n,c,cv,x) computes the oblate sheroidal radial function 
    of the second kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0. Requires pre-computed
    characteristic value.
    """
    pass


# real signature unknown; restored from __doc__
def pbdv(x1, x2, out1=None, out2=None):
    """
    pbdv(x1, x2[, out1, out2])
    
    (d,dp)=pbdv(v,x) returns (d,dp) with the parabolic cylinder function Dv(x) in 
    d and the derivative, Dv'(x) in dp.
    """
    pass


# real signature unknown; restored from __doc__
def pbvv(x1, x2, out1=None, out2=None):
    """
    pbvv(x1, x2[, out1, out2])
    
    (v,vp)=pbvv(v,x) returns (v,vp) with the parabolic cylinder function Vv(x) in 
    v and the derivative, Vv'(x) in vp.
    """
    pass


# real signature unknown; restored from __doc__
def pbwa(x1, x2, out1=None, out2=None):
    """
    pbwa(x1, x2[, out1, out2])
    
    (w,wp)=pbwa(a,x) returns (w,wp) with the parabolic cylinder function W(a,x) in 
    w and the derivative, W'(a,x) in wp.  May not be accurate for large (>5) 
    arguments in a and/or x.
    """
    pass


def pdtr(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    pdtr(x1, x2[, out])
    
    y=pdtr(k,m) returns the sum of the first k terms of the Poisson
    distribution: sum(exp(-m) * m**j / j!, j=0..k) = gammaincc( k+1, m).
    Arguments must both be positive and k an integer.
    """
    pass


def pdtrc(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    pdtrc(x1, x2[, out])
    
    y=pdtrc(k,m) returns the sum of the terms from k+1 to infinity of the
    Poisson distribution: sum(exp(-m) * m**j / j!, j=k+1..inf) = gammainc( k+1, m).
    Arguments must both be positive and k an integer.
    """
    pass


def pdtri(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    pdtri(x1, x2[, out])
    
    m=pdtri(k,y) returns the Poisson variable m such that the sum
    from 0 to k of the Poisson density is equal to the given probability
    y:  calculated by gammaincinv( k+1, y).  k must be a nonnegative integer and
    y between 0 and 1.
    """
    pass


def pdtrik(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """ pdtrik(x1, x2[, out]) """
    pass


# real signature unknown; restored from __doc__
def pro_ang1(x1, x2, x3, x4, out1=None, out2=None):
    """
    pro_ang1(x1, x2, x3, x4[, out1, out2])
    
    (s,sp)=pro_ang1(m,n,c,x) computes the prolate sheroidal angular function 
    of the first kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0.
    """
    pass


# real signature unknown; restored from __doc__
def pro_ang1_cv(x1, x2, x3, x4, x5, out1=None, out2=None):
    """
    pro_ang1_cv(x1, x2, x3, x4, x5[, out1, out2])
    
    (s,sp)=pro_ang1_cv(m,n,c,cv,x) computes the prolate sheroidal angular function 
    of the first kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0. Requires pre-computed
    characteristic value.
    """
    pass


# real signature unknown; restored from __doc__
def pro_cv(x1, x2, x3, out=None):
    """
    pro_cv(x1, x2, x3[, out])
    
    cv=pro_cv(m,n,c) computes the characteristic value of prolate spheroidal 
    wave functions of order m,n (n>=m) and spheroidal parameter c.
    """
    pass


# real signature unknown; restored from __doc__
def pro_rad1(x1, x2, x3, x4, out1=None, out2=None):
    """
    pro_rad1(x1, x2, x3, x4[, out1, out2])
    
    (s,sp)=pro_rad1(m,n,c,x) computes the prolate sheroidal radial function 
    of the first kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0.
    """
    pass


# real signature unknown; restored from __doc__
def pro_rad1_cv(x1, x2, x3, x4, x5, out1=None, out2=None):
    """
    pro_rad1_cv(x1, x2, x3, x4, x5[, out1, out2])
    
    (s,sp)=pro_rad1_cv(m,n,c,cv,x) computes the prolate sheroidal radial function 
    of the first kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0. Requires pre-computed
    characteristic value.
    """
    pass


# real signature unknown; restored from __doc__
def pro_rad2(x1, x2, x3, x4, out1=None, out2=None):
    """
    pro_rad2(x1, x2, x3, x4[, out1, out2])
    
    (s,sp)=pro_rad2(m,n,c,x) computes the prolate sheroidal radial function 
    of the second kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0.
    """
    pass


# real signature unknown; restored from __doc__
def pro_rad2_cv(x1, x2, x3, x4, x5, out1=None, out2=None):
    """
    pro_rad2_cv(x1, x2, x3, x4, x5[, out1, out2])
    
    (s,sp)=pro_rad2_cv(m,n,c,cv,x) computes the prolate sheroidal radial function 
    of the second kind and its derivative (with respect to x) for mode paramters
    m>=0 and n>=m, spheroidal parameter c and |x|<1.0. Requires pre-computed
    characteristic value.
    """
    pass


def psi(x, out=None):  # real signature unknown; restored from __doc__
    """
    psi(x[, out])
    
    y=psi(z) is the derivative of the logarithm of the gamma function
    evaluated at z (also called the digamma function).
    """
    pass


# real signature unknown; restored from __doc__
def radian(x1, x2, x3, out=None):
    """
    radian(x1, x2, x3[, out])
    
    y=radian(d,m,s) returns the angle given in (d)egrees, (m)inutes, and
    (s)econds in radians.
    """
    pass


def rgamma(x, out=None):  # real signature unknown; restored from __doc__
    """
    rgamma(x[, out])
    
    y=rgamma(z) returns one divided by the gamma function of x.
    """
    pass


def round(x, out=None):  # real signature unknown; restored from __doc__
    """
    round(x[, out])
    
    y=Returns the nearest integer to x as a double precision
    floating point result.  If x ends in 0.5 exactly, the
    nearest even integer is chosen.
    """
    pass


# real signature unknown; restored from __doc__
def shichi(x, out1=None, out2=None):
    """
    shichi(x[, out1, out2])
    
    (shi,chi)=shichi(x) returns the hyperbolic sine and cosine integrals:
    integral(sinh(t)/t,t=0..x) and eul + ln x +
    integral((cosh(t)-1)/t,t=0..x) where eul is Euler's Constant.
    """
    pass


# real signature unknown; restored from __doc__
def sici(x, out1=None, out2=None):
    """
    sici(x[, out1, out2])
    
    (si,ci)=sici(x) returns in si the integral of the sinc function from 0 to x:
    integral(sin(t)/t,t=0..x).  It returns in ci the cosine integral: eul + ln x +
    integral((cos(t) - 1)/t,t=0..x).
    """
    pass


def sindg(x, out=None):  # real signature unknown; restored from __doc__
    """
    sindg(x[, out])
    
    y=sindg(x) calculates the sine of the angle x given in degrees.
    """
    pass


def smirnov(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    smirnov(x1, x2[, out])
    
    y=smirnov(n,e) returns the exact Kolmogorov-Smirnov complementary 
    cumulative distribution function (Dn+ or Dn-) for a one-sided test of 
    equality between an empirical and a theoretical distribution. It is equal 
    to the probability that the maximum difference between a theoretical 
    distribution and an empirical one based on n samples is greater than e.
    """
    pass


# real signature unknown; restored from __doc__
def smirnovi(x1, x2, out=None):
    """
    smirnovi(x1, x2[, out])
    
    e=smirnovi(n,y) returns e such that smirnov(n,e) = y.
    """
    pass


def spence(x, out=None):  # real signature unknown; restored from __doc__
    """
    spence(x[, out])
    
    y=spence(x) returns the dilogarithm integral: -integral(log t /
    (t-1),t=1..x)
    """
    pass


def stdtr(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    stdtr(x1, x2[, out])
    
    p=stdtr(df,t) returns the integral from minus infinity to t of the Student t
    distribution with df > 0 degrees of freedom:
    gamma((df+1)/2)/(sqrt(df*pi)*gamma(df/2)) * integral((1+x**2/df)**(-df/2-1/2),
    x=-inf..t)
    """
    pass


# real signature unknown; restored from __doc__
def stdtridf(x1, x2, out=None):
    """
    stdtridf(x1, x2[, out])
    
    t=stdtridf(p,t) returns the argument df such that stdtr(df,t) is equal to p.
    """
    pass


def stdtrit(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    stdtrit(x1, x2[, out])
    
    t=stdtrit(df,p) returns the argument t such that stdtr(df,t) is equal to p.
    """
    pass


def struve(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    struve(x1, x2[, out])
    
    y=struve(v,x) returns the Struve function Hv(x) of order v at x, x
    must be positive unless v is an integer.
    """
    pass


def tandg(x, out=None):  # real signature unknown; restored from __doc__
    """
    tandg(x[, out])
    
    y=tandg(x) calculates the tangent of the angle x given in degrees.
    """
    pass


def tklmbda(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """ tklmbda(x1, x2[, out]) """
    pass


def wofz(x, out=None):  # real signature unknown; restored from __doc__
    """
    wofz(x[, out])
    
    y=wofz(z) returns the value of the fadeeva function for complex argument
    z: exp(-z**2)*erfc(-i*z)
    """
    pass


def y0(x, out=None):  # real signature unknown; restored from __doc__
    """
    y0(x[, out])
    
    y=y0(x) returns the Bessel function of the second kind of order 0 at x.
    """
    pass


def y1(x, out=None):  # real signature unknown; restored from __doc__
    """
    y1(x[, out])
    
    y=y1(x) returns the Bessel function of the second kind of order 1 at x.
    """
    pass


def yn(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    yn(x1, x2[, out])
    
    y=yn(n,x) returns the Bessel function of the second kind of integer
    order n at x.
    """
    pass


def yv(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    yv(x1, x2[, out])
    
    y=yv(v,z) returns the Bessel function of the second kind of real
    order v at complex z.
    """
    pass


def yve(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    yve(x1, x2[, out])
    
    y=yve(v,z) returns the exponentially scaled Bessel function of the second 
    kind of real order v at complex z: yve(v,z) = yv(v,z) * exp(-abs(z.imag))
    """
    pass


def zeta(x1, x2, out=None):  # real signature unknown; restored from __doc__
    """
    zeta(x1, x2[, out])
    
    y=zeta(x,q) returns the Riemann zeta function of two arguments:
    sum((k+q)**(-x),k=0..inf)
    """
    pass


def zetac(x, out=None):  # real signature unknown; restored from __doc__
    """
    zetac(x[, out])
    
    y=zetac(x) returns 1.0 - the Riemann zeta function: sum(k**(-x), k=2..inf)
    """
    pass


# classes

class SpecialFunctionWarning(RuntimeWarning):
    # no doc

    def __init__(self, *args, **kwargs):  # real signature unknown
        pass

    __weakref__ = property(lambda self: object())  # default
