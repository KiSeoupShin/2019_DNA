
 #1
 x<-matrix(2:10,3)
 y<-x%%2
 y<-as.logical(y)
 matrix(y,3)
 z<-matrix(y,3)
 diag(z)


 #2
 t<-matrix(c(2,3,4,1,5,6,8,9,4,11,30,20),nrow=3,ncol=4);t
 t[,4]


 #3
 a<-c(2,3,4,1,5,6,8,9,4,11,30,20)
 d<-matrix(a,3,4,byrow=TRUE)
  e<-d[,c(2,3,4,1)]
 diag(e)


 #4
 b<-matrix(1:9,3)
 matrix(b,3)
 c<-c(6,15,24)+diag(b)
 c


 #5
 f<-c(1,6,8,6,8,7)
 g<-matrix(f,3,2)
 g
 

 
 