# 문제 1번
sum_function <-function(x){
  a<-c()
  b<-c()
  for(i in 1:x){
    if(i%%2==0){
      a[i%/%2]<-i
    }else{
      b[(i%/%2)+1]<-i    
    }
  }
  sprintf("홀수의 합=%d,짝수의 합=%d",sum(b),sum(a))
}
sum_function(10)


#문제 2번
a<-rep(0,100)
for(i in 1:100){
  if(i%%3==0){
    a[i]<-'Fizz'
  }else if(i%%5==0){
    a[i]<-'Buzz'
  }else{
    a[i]<-i
  }
  if(i%%15==0){
    a[i]<-'FizzBuzz'
  }
}
print(a)

#문제 3번
Q3<-function(x){
  y<-as.character(x)
  z<-strsplit(y,'')
  a<-unlist(z)
  b<-length(a)
  print(b)
}
Q3(12355)

#문제 4번
Q4<-function(x){
  y<-as.character(x)
  z<-strsplit(y,'')
  a<-unlist(z)
  c<-length(a)
  d<-1
  b<-rep(0,c)
  for(d in 1:c){
    a<-x%/%10
    b[d]<-x%%10
    x<-a
  d<=d+1
    }
  e<-sum(b)
  print(e)
  }
Q4(1234)

#문제 5번
Q5<-function(x){
 i<-1
 b<-rep(0,sum(1:x)) 
 while(i<=x){
   for(a in 1:i){
     a<-i
     c<-rep(a,a)
   }
   if(a==1){
    b[1]<-c
     }else{
     b[(sum(1:(a-1))+1):(sum(1:(a-1))+i)]<-c
     }
  i=i+1
 }
 print(b)
}
Q5(7)



