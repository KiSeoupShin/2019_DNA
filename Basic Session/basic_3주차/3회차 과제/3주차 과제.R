## 3주차 과제입니다.
## 각 문제에 맞는 코드를 적어서 제출해주세요

## 제출방식은 1. 파일명 >> "basic_3회차과제_이름" 
##            2. 한글파일에 코드와 출력결과를 같이 첨부해주세요.


rm(list=ls())

# setwd
setwd("C:/Users/rltjq/Desktop/D&A/basic_3주차/3회차 과제")

# 문제1 )  파일명 : 'search' 데이터를 불러서 변수에 저장하고 결과값을 출력하세요.
install.packages("data.table")
library("data.table")
a<-fread('search.csv')
a

# 문제2 ) 파일명 : 'football' 데이터를 불러서 변수에 저장하고 결과값을 출력하세요.
b<-fread('football.txt')
b

# 문제3 ) 파일명 :'PUBG' 데이터를 불러서 변수에 저장하고 결과값을 출력하세요.
c<-fread('PUBG.csv')
c

# Hint : read.csv는 가급적 피하세요... (4446966 x 29 데이터 입니다.)
#        >> 대용량 데이터를 불러오는 방법을 구글링을 통해 확인하면 됩니다


# 문제4 ) 파일명 :'서울시 시간 평균 대기오염도 정보' 데이터를 불러서 변수에 저장하고 결과값을 출력하세요.
install.packages('readxl')
library('readxl')
d<-read_xlsx('서울시 시간 평균 대기오염도 정보.xlsx')
d

# 문제5 ) 다음 URL로 데이터를 불러서 변수에 저장하고 결과값을 출력하세요
theURL = "http://www.sthda.com/upload/boxplot_format.txt"
read.csv(file=theURL,header=T,sep=',')


# 문제 6 ) 4번 문제로 불러온 데이터에서 '성북구'에 해당하는 데이터를 출력하세요 
seoul<-read_xlsx('서울시 시간 평균 대기오염도 정보.xlsx')
seoul[seoul$측정소명=='성북구',]

# 문제 7 ) 4번 문제로 불러온 데이터에서 '초미세먼지'가 30 이상이 데이터만을 출력하세요
seoul[seoul$초미세먼지>=30,]

# 문제 8 ) 4번 문제로 불러온 데이터에서 '강남구'의 '미세먼지'값을 0으로 만들고 결과값을 출력하세요
seoul[seoul$측정소명=="강남구",]$미세먼지<-0
seoul[seoul$측정소명=="강남구",]



