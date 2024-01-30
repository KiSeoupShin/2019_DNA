rm(list=ls())
gc()

library(dplyr)

data <- read.csv("data.csv")
data %>% head()

#시청역 미세먼지 데이터
#Date: 관측일시
#R_PM10, P_PM10: 미세먼지 농도
#ON_CNT, OFF_CNT: 승차객, 하차객
#year, month, day, hours: 연, 월, 일, 시
#week: 요일 
#weekend: 주중/ 주말 여부(주말이면 TRUE)
#season: 계절 

# 요일별 P_PM10의 평균
data %>% group_by(week) %>% summarise(mean(P_PM10,na.rm=T))
# Date 별 R_pm10과 P_PM10의 합으로 새로운 열을 만들고 새로운 열의 상위 10개 값만 추출하시오
data %>% mutate(sum=R_PM10+P_PM10) %>% select(sum) %>% slice(1:10)
# 계절별로 주중/ 주말 탑승객의 평균을 구하시오
data %>% group_by(season,weekend) %>% summarise(mean(ON_CNT))
# 시간대별 P_PM10의 변동계수를 구하고 내림차순으로 정렬하여라 (변동계수 = 표준편차/평균)
data %>% group_by(hours) %>% summarise(cv=sd(P_PM10,na.rm=T)/mean(P_PM10,na.rm=T)) %>% arrange(desc(cv))
# 9시부터 18시까지인 행을 뽑고 SKY의 NA값을제거하고 SKY별 P_PM10의 평균을 구하시오
data %>% filter(hours >= 9 & hours <= 18) %>% na.omit(SKY) %>% group_by(SKY) %>% summarise(mean(P_PM10,na.rm=T))
# 월별 P_PM10의 평균을 구하고 평균값이 제일 큰 월과 평균값을 추출하여라
data %>% group_by(month) %>% summarise(MEAN=mean(P_PM10,na.rm=T)) %>% arrange(MEAN) %>% slice(12)
# 요일 별로 하자객 대비 승차객 비율의 평균을 구하시오
data %>% mutate(new= ON_CNT/OFF_CNT) %>% group_by(week) %>% summarise(mean(new,na.rm=T))