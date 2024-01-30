if (!require(dplyr)) {install.packages(('dplyr'))} ; library(dplyr)
if (!require(reshape2)) {install.packages(('reshape2'))} ; library(reshape2)
if (!require(tidyr)) {install.packages(('tidyr'))} ; library(tidyr)
if (!require(data.table)) {install.packages(('data.table'))} ; library(data.table)

setwd()

#question 1. 차종과 지역에 따라 value의 합을 나타내는 table을 만드시오. mean of milage.csv
mean<-fread('mean of milage.csv')
mean %>% group_by(model,district) %>% summarise(sum(value)) %>% spread(key='district',value='sum(value)')
mean1<-xtabs(value~model+district,data=mean)
# finish

#question 1.1. 차종과 지역에 따라 value의 평균을 나타내는 table을 만드시오.
mean %>% group_by(model,district) %>% summarise(mean(value)) %>% spread(key='district',value='mean(value)')
# finish

#question 2. 해당 데이터에 어떤 열을 기준으로 wide form 변환을 해야 NA값이 발생하지 않는가? 그 이유는?


#question 3. wide form 변환된 data를 다시 원래의 형식으로 만드시오.
melt(mean1,id.vars='model',measure.vars='district')
# finish

#question 4.다음은 Sapply 함수를 활용한 예시이다. sapply함수와 같은 결과값을 도출하는 함수를 만드시오.
# iris_num <- iris[, sapply(iris, is.numeric)]
iris_num<-function(x){
  x %>% select(1:4)
}
iris_num(iris)
#finish....maybe??
#question 5. airquality data의 Ozone Solar.R, Wind가 정규화(min-max)되고, na값이 없는 data 형태로 만드시오. data(airquality)
min_max_scaling <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}
air<-airquality
air %>% select(1:3) %>% na.omit(Ozone) %>% na.omit(Solar.R) %>% sapply(min_max_scaling)
#finish

#question 6. ST_TIME 상위 5개 BACT_NM와  1월~6월에 대한 ST_TIME의 합 clickstream.csv
click<-fread('clickstream.csv')
click1<-click %>% group_by(BACT_NM) %>% summarise(sum=sum(ST_TIME))
click1 %>% arrange(desc(sum)) %>% head(5)
# finish

#question 7. 시도와 나이대에 따른 인구 테이블을 그리시오. 2017인구.csv
population<-fread('2017인구.csv')

  


#question 8. Name 중 title과 Emabarked에 따른 나이의 평균 table을 만드시오. titanic.csv
titanic<-fread('titanic.csv')
Mr<-grep('Mr.',titanic$Name,fixed=TRUE)
Ms<-grep('Ms.',titanic$Name,fixed=TRUE)
Mrs<-grep('Mrs.',titanic$Name,fixed=TRUE)
Miss<-grep('Miss.',titanic$Name,fixed=TRUE)
Dr<-grep('Dr.',titanic$Name,fixed=TRUE)
Rev<-grep('Rev.',titanic$Name,fixed=TRUE)
Col<-grep('Col.',titanic$Name,fixed=TRUE)
Master<-grep('Master.',titanic$Name,fixed=TRUE)
Dona<-grep('Dona.',titanic$Name,fixed=TRUE)
z<-c()
z[Mr]<-'Mr'
z[Mrs]<-'Mrs'
z[Miss]<-'Miss'
z[Dr]<-'Dr'
z[Rev]<-'Rev'
z[Col]<-'Col'
z[Master]<-'Master'
z[Dona]<-'Dona'
z[Ms]<-'Ms'
titanic %>% mutate(Title=z) %>% group_by(Title,Embarked) %>% na.omit(Age) %>% summarise(Mean=mean(Age)) %>% spread(key='Embarked',value='Mean')
#finish
