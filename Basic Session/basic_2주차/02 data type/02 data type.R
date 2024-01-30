#벡터 생성
vec <- c(1,2,3)
vec2<- rep(1,5)
vec3<- seq(1,3)
vec4<-5:1
vec;vec2;vec3;vec4

rep(1:3,2)
seq(1,5,by=2)

#벡터 연산
a<- 1:3
b<- 2:4
a+b
a*b

#벡터의 함수
x<- c(1.35,1.53,1.88)
round(x)
round(x,1)

x<- 1:5
cumsum(x)
cumprod(x)
cummax(x)
cummin(x)

#벡터의 인덱싱&필터링
x<-c(2,4,1,9,3)
x[1]
x[2:4]
x[1:length(x)]
x[6]<-5
x
x[x>3]

#Matrix & Array 생성
matrix(1:6,nrow=3)
matrix(1:10,2,5)
matrix(1:9,3,3,byrow=T)
array(1:8,dim=c(2,2,2))

#Matrix & Array 인덱싱 & 필터링
a<-matrix(1:9,3)
a[2,3]
a[c(2,3),]
b<-array(1:8,dim=c(2,2,2))
b[1,2,2]
a[1:nrow(a)%%2==1,]

#factor
경영학과<-factor(c('경영학전공','빅데이터 경영통계'))
경영학과

gender<-factor(c('남자','여자','남자','여자','남자'),levels=c('여자','남자'))
gender


gender <- c(1,1,2,2,1,2,2,2,1,2)
gender <- factor(gender, levels=c(1,2),labels=c("male","female"))
gender

