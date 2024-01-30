if (!require(dplyr)) {install.packages(('dplyr'))} ; library(dplyr)
if (!require(reshape2)) {install.packages(('reshape2'))} ; library(reshape2)
if (!require(tidyr)) {install.packages(('tidyr'))} ; library(tidyr)

dat <- data.frame(name = c("ChangSik Park", "HaeHee Song","InHo Kim","YeoJin Lee"),
                  gender = c("M","F","M","F"),
                  age0 = c(74.69, 81.23, 88.24, 88.77),
                  age1 = c(84.99, 88.21, 92.74, 96.45),
                  age2 = c(91.73, 75.74, 101.85, 106.76)) ; dat

#reshape2::melt (Wide -> Long)
dat1 <- melt(dat, id.vars = c("name","gender"), measure.vars = c('age0','age1','age2')) ; dat1
dat2 <- melt(dat, id.vars = c("name","gender")) ; dat2
dat3 <- melt(dat, measure.vars = c('age0','age1','age2')) ; dat3

##vector순서로 열 순서 정하기
mdat2 <-melt(dat, id.vars = c('gender','name')) ; mdat2

##선택적 melting
melt(dat, id.vars = c("name","gender"), measure.vars = c("age0","age1"))

##NA 제거
df2 <- melt(dat, measure.vars = c("age0","age1","age2"), na.rm = T)

#reshape2::dcast (Long -> Wide)
dcast(dat1, name+gender ~ variable, value.var = 'value')
##값에 대한 summary
dcast(dat1, name+gender ~ variable, value.var = 'value',sum,margins = 'name')


#tidyr::gather (Wide -> Long) 
gdat1 <- gather(dat,key = "new_name", value = "valuables",age0,age1,age2) ; gdat1

##쓸 부분만 써도 된단다 ^^
gather(dat,,,c(age0,age1,age2))

#tidyr::spread (Long -> Wide)
spread(gdat1,key = 'new_name', value = 'valuables')
tdat1 <-gdat1 %>% spread(key="new_name", value = "valuables")
spread

##pivot table in r
pdata <- data.frame(id = c(1,1,1,1,2,2,2),
                    site = c('a','b','c','a','a','b','b'),
                    pageview = c(1,2,3,4,5,6,7),
                    dwelltime = c(7,6,5,4,3,2,1));pdata
pdata %>% group_by(id,site) %>% summarise(sum_page = sum(pageview)) %>% spread(key = 'site', value = 'sum_page')

#xtab
##xtabs로 어떻게 만들까
xtabs(pageview~id+site, data = pdata)
##더 복잡한 것도 만들 수 있나요?
xtabs( (age2 - age0)/age0~name + gender, data = dat)

## 1.apply
# apply는 행렬의 행 또는 열 방향으로 특정 함수를 적용하는 데 사용한다.

data <- iris
data %>% head

apply(data,1,sum) #왜 안 돼? 문자포함.
str(data)

data <- data %>% select(c(1,2,3,4)) # 수치형 열만 추출
data %>% head
apply(data,1,sum) # 행 방향으로 각 행의 합계를 알고 싶다
apply(data,2,sum) # 열 방향으로 각 열의 합계를 알고 싶다

# apply 에 내가 만든 함수를 적용
# Normalize = Min-Max Scaling 을 적용할 것이다.
# 정규화는 0 ~ 1 범위에 들도록 값을 조정하는 것인데
# 데이터에서 최솟값을 뺀 후 최댓값과 최솟값의 차이로 나누면 된다
min_max_scaling <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

apply(data,1,min_max_scaling) # 행 방향으로 각 행을 정규화 시킴

# 2. lapply

# list에 lapply 적용
lst <- list(c(1,2,3),c(4,5,6),c(7,8,9)) ;lst
lapply(lst,sum)

# data frame에 lapply 적용
# 데이터 프레임에 적용할 경우 각 열을 리스트의 한 요소로 취급한다
lapply(data,sum) #%>% class => list

# 3. Sapply
sapply(data,sum) #%>% class => numeric
sapply(data,min_max_scaling)
