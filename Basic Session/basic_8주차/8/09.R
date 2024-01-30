rm(list = ls())
gc()

if (!require(ggplot2)) {install.packages(('ggplot2'))} ; library(ggplot2)
if (!require(MASS)) {install.packages(('MASS'))} ; library(MASS)
if (!require(scales)) {install.packages(('scales'))} ; library(scales)
str(Cars93)

#단변량
##이산적(barplot)
ggplot(Cars93,aes(x=Type))+geom_bar()

ggplot(Cars93,aes(x=Type))+geom_bar(fill='blue',colour='white')#fill=그래프색,colour=테두리

ggplot(Cars93,aes(x=Type))+geom_bar(fill='blue',colour='white')+ggtitle('차 종류에 따른 수')

ggplot(Cars93,aes(x=Type))+geom_bar(fill='blue',colour='white')+
  ggtitle('차 종류에 따른 수')+theme_bw()

##연속적(histgram & 커널)
ggplot(Cars93,aes(x=Price))+geom_histogram()

ggplot(Cars93,aes(x=Price))+geom_density()

ggplot(Cars93,aes(x=Price))+geom_density(fill='yellow',alpha=0.5)#alpha=투명도

ggplot(Cars93,aes(x=AirBags))+ggtitle('AIRBAG의 종류에 따른 수')+geom_bar(fill='red',colour='white')+xlab('airbag')+ylab('수')
#이변량
##연속,연속(산점도)
ggplot(Cars93,aes(x=EngineSize,y=MPG.highway))+
  geom_point(colour='blue')+ggtitle('Scatter plot:MPG.highway vs EngineSize')

ggplot(Cars93,aes(x=EngineSize,y=MPG.highway))+
  geom_point(shape=15,size=3,colour='blue')+
  ggtitle('Scatter plot:MPG.highway vs EngineSize')

ggplot(Cars93,aes(x=Weight,y=MPG.highway))+
  geom_point(shape=19,size=3,color='red')+
  geom_smooth()+
  ggtitle('추세선 포함 산점도')

ggplot(Cars93,aes(x=EngineSize,y=MPG.highway,colour=Type))+
  geom_point(shape=19,size=3)+
  ggtitle('Type별 색 지정 산점도')

ggplot(Cars93,aes(x=EngineSize,y=MPG.highway))+
  geom_point(shape=19,size=3)+
  facet_grid(.~Type)+
  ggtitle('Type별로 나누어 산점도(세로)')

ggplot(Cars93,aes(x=EngineSize,y=MPG.highway))+
  geom_point(shape=19,size=3)+
  facet_grid(Type~.)+
  ggtitle('Type별로 층나누어 산점도(가로)')


##연속,연속(선-시계열)
unemployment = read.csv("http://datasets.flowingdata.com/unemployment-rate-1948-2010.csv")
unemployment = transform(unemployment, 
                         year_month = paste(Year, substr(Period,2,3), "01", sep="-"))
unemployment$year_month=as.Date(unemployment$year_month)

head(unemployment)

ggplot(unemployment, aes(x=year_month, y=Value))+
  geom_line()+
  geom_smooth(span=0.5, color="red")+
  geom_smooth(span=0.3, color="green")+
  scale_x_date(date_breaks="5 years", labels =date_format("%Y"))

##이산,연속(boxplot)
ggplot(Cars93,aes(x=Type,y=Price))+
  geom_boxplot()+
  ggtitle('Box plot by Car Type')

##이산,연속(barplot)
ggplot(Cars93,aes(x=Type,y=Price))+
  geom_bar(stat='identity')+
  ggtitle('Bar plot by Car Type')

ggplot(Cars93,aes(x=Type,y=Price,fill=Type))+
  geom_bar(stat='identity')+
  ggtitle('Bar plot by Car Type')
Cars93$Passengers<-as.character(Cars93$Passengers)
ggplot(Cars93,aes(x=Passengers,y=Length,fill=Passengers))+ggtitle('passenger의 종류에 따른 length')+geom_bar(stat='identity')