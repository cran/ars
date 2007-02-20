\name{ars}
\alias{ars}
\title{Adaptive Rejection Sampling}
\description{
  Adaptive Rejection Sampling from log-concave density functions
}
\usage{
ars(f,fprima,x=c(-4,1,4),ns=100,m=3,emax=64,lb=FALSE,ub=FALSE,xlb=0,xub=0,...)
}
\arguments{
  \item{f}{function that computes log(f(u,...)), for given u, where f(u) is proportional to the density we want to sample from}
  \item{fprima}{d/du log(f(u,...))}
  \item{x}{some starting points in wich log(f(u,...) is defined}
  \item{ns}{maximum number of points defining the hulls}
  \item{m} {number of starting points}
  \item{emax}{large value for which it is possible to compute an exponential}
  \item{lb}{boolean indicating if there is a lower bound to the domain}
  \item{xlb}{value of the lower bound }
  \item{ub}{boolean indicating if there is a upper bound to the domain}
  \item{xub}{value of the upper bound bound }
  \item{...}{arguments to be passed to f and fprima}
}
\details{
  \bold{ifault codes, subroutine initial}

  \item{0:}{successful initialisation}
  \item{1:}{not enough starting points}
  \item{2:}{ns is less than m}
  \item{3:}{no abscissae to left of mode (if lb = false)}
  \item{4:}{no abscissae to right of mode (if ub = false)}
  \item{5:}{non-log-concavity detect}
 
  \bold{ifault codes, subroutine sample}

  \item{0:}{successful sampling}
  \item{5:}{non-concavity detected}
  \item{6:}{random number generator generated zero}
  \item{7:}{numerical instability}
}
\value{
a sampled value from density 
}
\references{
Gilks, W.R., P. Wild. (1992)
Adaptive Rejection Sampling  for Gibbs Sampling,\emph{Applied Statistics}
  \bold{41}:337--348.
}

\author{
Paulino Perez Rodriguez, original C++ code from Arnost Komarek based on ars.f written by P. Wild and W. R. Gilks
}
\examples{

library(ars)

#1000 numeros aleatorios de la distribucion normal
f<-function(x,mu=0,sigma=1){-1/(2*sigma^2)*(x-mu)^2}
fprima<-function(x,mu=0,sigma=1){-1/sigma^2*(x-mu)}
muestra<-rep(0,1000)
for(i in 1:1000)
{
  muestra[i]<-ars(f,fprima,mu=2,sigma=3)
}
hist(muestra) 
}
\keyword{distribution}


