# library
library(data.table)
library(ggplot2)
library(dplyr)

# load data
ft <- as.data.frame(fread('fine_dust_tweet.csv'))
fd <- as.data.frame(fread('fine_dust.csv'))

cc<-fread('ccc.csv')
ggplot(cc,aes(x=전체))

# merge
fd$date <- substr(fd$측정일시,1,8)
ft$date <- as.Date(ft$date,format = '%Y%m%d')
df <- left_join(fd, ft, by = 'date')
class(ft$date)

ft$date

head(fd)
head(ft)

fd$SCORE<-as.character(fd$SCORE)
ggplot(fd,aes(x=SCORE))+geom_bar()+ggtitle('미세먼지 농도 수치')
ggplot(df,aes(x=SCORE,y=count))+geom_bar(stat='identity')+ggtitle('미세먼지 농도에 따른 트윗 횟수')

x<-as.character(x)


grep('-01-',ft$date)

ddd<-df %>% group_by(측정소명='중구',month) %>% summarise(MEAN=mean(PM10,na.rm=T))

ddr<-grep('대로',ddd$측정소명)

dddr<-ddd[ddr,]

ggplot(ff,aes(x=측정소명,y=MEAN))+geom_line(stat='ident')

ff<-fd %>% group_by(측정소명) %>% summarise(MEAN=mean(PM10,na.rm=T))
fff<-fd %>% group_by(month) %>% summarise(MEAN=mean(PM10,na.rm=T))

df$month<-as.character(df$month)
dd$SUM<-as.numeric(dd$SUM)
dd<- df %>% group_by(month) %>% summarise(SUM=sum(count))
 
ggplot(dd,aes(x=month,y=SUM))+geom_bar(stat='identity')+ggtitle('미세먼지 트윗 횟수')
ggplot(fff,aes(x=month,y=MEAN))+geom_bar(stat='identity')+ggtitle('미세먼지 평균')
fff$month<-as.character(fff$month)
str(fff$month)

ggplot(dddg,aes(x=측정소명,y=MEAN))+geom_bar(stat='identity')+ggtitle('구별 미세먼지 평균')
ggplot(dddr,aes(x=측정소명,y=MEAN))+geom_bar(stat='identity')+ggtitle('대별 미세먼지 평균')

year<-df %>% group_by(측정년도) %>% summarise(MEAN=mean(PM10,na.rm=T))

mean<-df %>% group_by(측정년도,month) %>% summarise(MEAN=mean(PM10,na.rm=T))

sum1<-sum[sum$month==1,]
mean1<-mean[mean$month==1,]
                
ggplot(year,aes(x=측정년도,y=MEAN))+geom_smooth()
ggplot(sum,aes(x=측정년도,y=SUM))+geom_smooth()
ggplot(sum1,aes(x=측정년도,y=SUM))+geom_bar(stat='identity')
ggplot(mean1,aes(x=측정년도,y=MEAN))+geom_bar(stat='identity')
