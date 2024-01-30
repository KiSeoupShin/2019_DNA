setwd("C:\\Users\\hongjaekwak\\Desktop\\홍재\\대학\\학회\\2019BS\\5주차 함수만들기")

#이름이 홍재면 안녕이라고 말하는 코드를 짜고 싶다...
Name <- "Hongjae"

if (Name == "Hongjae") {
  print("Hello")
} else {
  print("Bye")
}

Name <- "Taeyong"

if (Name == "Hongjae") {
  print("Hello")
} else if(Name == "Taeyong") {
  print("Hi hi")
} else {
  print("Bye")
}

Name <- c("Hongjae", "Taeyong")

ifelse(Name == "Hongjae", 
       "Hello", 
       "Bye")

#1부터 5를 출력하고 싶다
for (i in 1:5){
  print(i)
}

#x가 6이 될 때까지 수식을 반복 
x <- 0
while (x <= 6) {
  print(x)
  x <- x+1
}

#1부터 8까지 출력
#4까지만 출력
for (i in 1:8){
  print(i)
  if (i == 4) {
    break
  }
}

#이름을 적으면 인사해주는 함수

hi <- function(Name) {
  sprintf("Hi %s", Name)
}

hi("홍재")

hello.world <- function(){
  print("hello world")
}

#5배 해주는 함수를 만들고 싶다.
#return을 안하면 맨 마지막 문장이 출력
num <- function(a) {
  a*5
  a*4
  a*3
}

num2 <- function(a) {
  return(a*5)
  a*4
  return(a*3)
}

num2(6)

##############################################
hello.world <- function(){
  print("hello world")
}
hello.world()

#숫자를 넣으면 구구단을 반환하는 함수
gugu <- function(x){
  for (i in 1:9){
    print(sprintf("%d %d는(은) %d", x, i, x*i))
  }
}

gugu(9)

#mean 함수를 만들어보자 NA값을 제외하는 기능 추가
?mean
MEAN <- function(x, na.rm = FALSE){
  if (na.rm == TRUE){
    x <- na.omit(x) #NA값을 제거하는 함수
    Mean <- sum(x)/length(x)
    return(Mean)
  } else if(na.rm == FALSE){
    if (sum(is.na(x) %in% TRUE)>=1){
      print("vector has NA")
    } else {
      Mean <- sum(x)/length(x)
      return(Mean)
    }
  }
}

a <- c(65, 6, 78, 51, 23, NA, 41)
MEAN(a)
MEAN(a, na.rm = T)
mean(a, na.rm = T)

# 벡터의 최빈값을 구하는 함수

x <- c(1, 5, 3, 2, 6, 1, 1)

MODE(x)

# 과제1 근의 공식을 이용해서 이차식의 해를 구하는 함수를 작성하여라(인자로 a, b, c 사용)
# 사용자로부터 a, b, c를 읽는다. 
# if (a == 0)이면 일차 방정식의 근을 구한다. 실근을 출력한다. 
# else 판별식(b^2 -4ac)을 계산한다. 
# if 판별식 > 0 이면 근의 공식을 이용하여 실근 두개를 구한다. 실근을 출력한다. 
# else if 판별식 = 0 이면 중근 하나를 구한다. 중근을 출력한다.
# else  실근은 없다는 메시지 출력

# 과제2 주어진 벡터의 최빈값을 구하는 함수를 작성하여라(인자는 x(입력값))

# 과제3 sub()는 첫번째 나오는 단어만 바꿔주 gsub()은 다 바꿔준다. 
# n번째 나오는 단어를 바꿔주고 싶을때 코드를작성하여라
# (인자는 x(입력값), pattern, replace, n을 사용)

# >  txt <- “사과 톡톡톡 트로피카나, 복숭아 톡톡톡 트로피카나, 포도 톡톡톡 트로피카나, 오렌지 톡톡톡 트로피카나”
# >  n <- 3, a <- “톡톡톡”, b <- “toktoktok”
# >  change(a,b,n)
# [1] “사과 톡톡톡 트로피카나, 복숭아 톡톡톡 트로피카나, 포도 toktoktok 트로피카나, 오렌지 톡톡톡 트로피카나”

# 과제4 n이하의 수까지 나열하는 피보나치 수열을 만드는 함수를 작성하여라(인자는 n 하나 사용)

# 과제5 mean함수의 파라미터중 trim에대하여 조사하고 
# trim 파라미터를 넣어서 벡터의 평균을 구하는 함수를 작성하여라
# (인자는 x(입력값)와 trim사용)
# ?mean 코드 실행 후 참조
