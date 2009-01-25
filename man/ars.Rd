\name{ars}
\alias{ars}
\title{Adaptive Rejection Sampling}
\description{
  Adaptive Rejection Sampling from log-concave density functions
}
\usage{
ars(n=1,f,fprima,x=c(-4,1,4),ns=100,m=3,emax=64,lb=FALSE,ub=FALSE,xlb=0,xub=0,...)
}
\arguments{
  \item{n}{sample size}
  \item{f}{function that computes log(f(u,...)), for given u, where f(u) is proportional to the density we want to sample from}
  \item{fprima}{d/du log(f(u,...))}
  \item{x}{some starting points in wich log(f(u,...) is defined}
  \item{ns}{maximum number of points defining the hulls}
  \item{m}{number of starting points}
  \item{emax}{large value for which it is possible to compute an exponential}
  \item{lb}{boolean indicating if there is a lower bound to the domain}
  \item{xlb}{value of the lower bound }
  \item{ub}{boolean indicating if there is a upper bound to the domain}
  \item{xub}{value of the upper bound bound }
  \item{...}{arguments to be passed to f and fprima}
}
\details{
  \bold{ifault codes, subroutine initial}
  \enumerate{
  \item{0:}{successful initialisation}
  \item{1:}{not enough starting points}
  \item{2:}{ns is less than m}
  \item{3:}{no abscissae to left of mode (if lb = false)}
  \item{4:}{no abscissae to right of mode (if ub = false)}
  \item{5:}{non-log-concavity detect}
  }
  \bold{ifault codes, subroutine sample}
  \enumerate{
  \item{0:}{successful sampling}
  \item{5:}{non-concavity detected}
  \item{6:}{random number generator generated zero}
  \item{7:}{numerical instability}
  }
}
\value{
a sampled value from density 
}
\references{
Gilks, W.R., P. Wild. (1992)
Adaptive Rejection Sampling  for Gibbs Sampling, \emph{Applied Statistics}
  \bold{41}:337--348.
}

\author{
Paulino Perez Rodriguez, original C++ code from Arnost Komarek based on ars.f written by P. Wild and W. R. Gilks
}
\examples{

library(ars)

#Example 1: sample 20 values from the normal distribution N(2,3)
f<-function(x,mu=0,sigma=1){-1/(2*sigma^2)*(x-mu)^2}
fprima<-function(x,mu=0,sigma=1){-1/sigma^2*(x-mu)}
mysample<-ars(20,f,fprima,mu=2,sigma=3)
mysample
hist(mysample)

#Example 2: sample 20 values from a gamma(2,0.5)
f1<-function(x,shape,scale=1){(shape-1)*log(x)-x/scale}
f1prima<-function(x,shape,scale=1) {(shape-1)/x-1/scale}
mysample1<-ars(20,f1,f1prima,x=4.5,m=1,lb=TRUE,xlb=0,shape=2,scale=0.5)
mysample1
hist(mysample1)

#Example 3: sample 20 values from a beta(1.3,2.7) distribution
f2<-function(x,a,b){(a-1)*log(x)+(b-1)*log(1-x)}
f2prima<-function(x,a,b){(a-1)/x-(b-1)/(1-x)}
mysample2<-ars(20,f2,f2prima,x=c(0.3,0.6),m=2,lb=TRUE,xlb=0,ub=TRUE,xub=1,a=1.3,b=2.7)
mysample2
hist(mysample2)
}
\keyword{distribution}


