ars<-function(f,fprima,x=c(-4,1,4),ns=100,m=3,emax=64,lb=FALSE,ub=FALSE,xlb=0,xub=0,...)
{
  mysample<-NaN
  iwv<-rep(0,ns+7)
  rwv<-rep(0,6*(ns+1)+9)
  hx<-f(x,...)
  hpx<-fprima(x,...)
  initial<-.C("initial_",as.integer(ns),as.integer(m),
                  as.double(emax),as.double(x),
                  as.double(hx),as.double(hpx),
                  as.integer(lb),as.double(xlb),
                  as.integer(ub),as.double(xub),
                  ifault=as.integer(0),
                  iwv=as.integer(iwv),
                  rwv=as.double(rwv))
  if(initial$ifault==0)
  {
   h<-function(x) f(x,...)
   hprima<-function(x) fprima(x,...)
   sample<-.C("sample_",as.integer(initial$iwv),as.double(initial$rwv),h,hprima,new.env(),
               beta=as.double(0),ifault=as.integer(0))
   if(sample$ifault==0)
   {
     mysample<-sample$beta  
   }
   else
   {
      cat("\nError in sobroutine sample_...") 
      cat("\nifault=",sample$ifault,"\n")
   }
  }
  else
  {
      cat("\nError in sobroutine initial_...") 
      cat("\nifault=",initial$ifault,"\n")      
  }
  return(mysample)
}
