########################################패키지 불러오기
if(!require(dplyr)) install.packages("dplyr"); library(dplyr)

########################################

if(!require(ggplot2)) install.packages("ggplot2"); library(ggplot2)
diamonds
str(diamonds)
iris
########################################파이프(pipe)

head(diamonds, 3)
diamonds %>% head(3) %>% dim
diamonds %>% str 

########################################select

select(diamonds, cut, color)
diamonds %>% select(cut, color)
diamonds %>% select(c(cut, color))

var1 <- c("cut", "color")
diamonds %>% select(var1)

var2 <- c("cut", "color", "asd")
diamonds %>% select(var2)
diamonds %>% select(one_of(var2))

diamonds %>% select(2,5)
diamonds %>% select(c(2,5))

diamonds %>% select(starts_with('c'))
diamonds %>% select(ends_with('t'))
diamonds %>% select(contains('c'))


########################################slice

slice(diamonds, 1:10)
diamonds %>% slice(1:10)

########################################filter

filter(diamonds, cut == "Premium")
diamonds %>% filter(cut == "Premium")

diamonds %>% filter(cut %in% c("Premium", "Ideal"))
diamonds %>% filter(price >= 500)
diamonds %>% filter(price >= 500, cut == "Ideal")
diamonds %>% filter(price >= 500 & cut == "Ideal")
diamonds %>% filter(price >= 500 | cut == "Ideal")

#########################################mutate

mutate(diamonds, price/carat)
diamonds %>% mutate(price/carat)
diamonds %>% mutate(new = price/carat)
diamonds %>% mutate(new = price/carat, new2 = new*2)

#########################################arrange

diamonds %>% arrange(cut)
diamonds %>% arrange(desc(cut))

#########################################summarize

diamonds %>% summarise(mean(depth))
diamonds %>% summarise(Mean_d = mean(depth))
diamonds %>% summarise(Mean_d = mean(depth),
                       Mean_p = mean(price),
                       Mean_c = mean(carat))

#########################################group_by

diamonds %>% group_by(cut)
diamonds %>% group_by(cut) %>% summarise(Mean = mean(price))
diamonds %>% group_by(cut) %>% mutate(Mean = mean(price))

#########################################

diamonds %>% filter(color %in% c("E", "J")) %>% group_by(cut) %>% summarise(price_sd = sd(price),
                                                                            carat_mean = mean(carat))
diamonds %>% filter(carat >= 0.25) %>% group_by(cut) %>% summarise(x_mean = mean(x)) %>% arrange(x_mean)

#########################################
                                                                   