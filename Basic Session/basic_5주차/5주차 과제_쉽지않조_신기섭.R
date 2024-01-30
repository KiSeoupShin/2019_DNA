# 과제1 근의 공식을 이용해서 이차식의 해를 구하는 함수를 작성하여라(인자로 a, b, c 사용)
# 사용자로부터 a, b, c를 읽는다. 
# if (a == 0)이면 일차 방정식의 근을 구한다. 실근을 출력한다. 
# else 판별식(b^2 -4ac)을 계산한다. 
# if 판별식 > 0 이면 근의 공식을 이용하여 실근 두개를 구한다. 실근을 출력한다. 
# else if 판별식 = 0 이면 중근 하나를 구한다. 중근을 출력한다.
# else  실근은 없다는 메시지 출력
fo<-function(a,b,c){
if(a==0){
  xa<- -c/b
  print(x)
}else{
  xa<- b^2-4*a*c
  if(xa>0){
    x1<- {-b+sqrt(b^2-4*a*c)}/(2*a)
    x2<- {-b-sqrt(b^2-4*a*c)}/(2*a)
    print(x1)
    print(x2)
  }else if(xa==0){
    x3<- -b/2
    print(x3)
  }else{
    print('실근이 없다')
  }
    
  }
}
fo(1,5,6)



# 과제2 주어진 벡터의 최빈값을 구하는 함수를 작성하여라(인자는 x(입력값))

x <- c(1, 5, 3, 2, 6, 1, 1)
most<-function(a){
  q<-table(x)
  w<-which.max(q) 
  print(w)
}
most(x)




# 과제3 sub()는 첫번째 나오는 단어만 바꿔주고 gsub()은 다 바꿔준다. 
# n번째 나오는 단어를 바꿔주고 싶을때 코드를작성하여라
# (인자는 x(입력값), pattern, replace, n을 사용)

# >  txt <- “사과 톡톡톡 트로피카나, 복숭아 톡톡톡 트로피카나, 포도 톡톡톡 트로피카나, 오렌지 톡톡톡 트로피카나”
# >  n <- 3, a <- “톡톡톡”, b <- “toktoktok”
# >  change(a,b,n)
# [1] “사과 톡톡톡 트로피카나, 복숭아 톡톡톡 트로피카나, 포도 toktoktok 트로피카나, 오렌지 톡톡톡 트로피카나”


txt<-'사과 톡톡톡 트로피카나, 복숭아 톡톡톡 트로피카나, 포도 톡톡톡 트로피카나, 오렌지 톡톡톡 트로피카나'
change<-function(n){
  if(n==1){
  sub(pattern='톡톡톡',replacement='toktoktok',x=txt)}
  else{
  for(i in 1:n){  
  txt<-sub(pattern='톡톡톡',replacement='toktoktok',x=txt)
  }
  for(i in 1:(n-1)){
  txt<-sub(pattern='toktoktok',replacement='톡톡톡',x=txt)
  }
print(txt)
}}
change(3) 


# 과제4 n이하의 수까지 나열하는 피보나치 수열을 만드는 함수를 작성하여라(인자는 n 하나 사용)
fibo<-function(f){
  if(f==1){
    func<-c(1)
    print(func)
  }else if(f==2){
    func<-c(1,1)
    print(func)
  }else{
    func<-c(1,1)
    for(n in 3:f){
      func[n]<-func[n-1]+func[n-2]
    }
  }
  func1<-func[c(func<=f)]
  print(func1)
}
fibo(80)



# 과제5 mean함수의 파라미터중 trim에대하여 조사하고 
# trim 파라미터를 넣어서 벡터의 평균을 구하는 함수를 작성하여라
# (인자는 x(입력값)와 trim사용)
# ?mean 코드 실행 후 참조
MEAN<-function(x,trim=0){
  if(trim!=0){
    z<-x[((trim*10)+1):(length(x)-((trim*10)))]
    sum(z)/length(z)
  }else{
    sum(x)/length(x)
  }
}

MEAN(c(1,5,7,2,9),trim=0.2)


















