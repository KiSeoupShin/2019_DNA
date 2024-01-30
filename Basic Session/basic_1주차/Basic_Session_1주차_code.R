#Package
install.packages('psych')
library(psych)
search()
detach("package:psych")
search()
if (!require(psych)) {install.packages(('psych'))} ; library(psych)

#Variables Assignment
a <- 3
b = 2
-1 -> c
d1 <- d2 <- 7

mean(x = c(1,2,3))
x
mean(x <- c(1,2,3))
x

a <- 2
A <- 1
a == A

var_name.1 <- 3
.var_name.2 <- 3
.2varname <- 3
%varname <- 3
2var.name <- 3
_var.name <- 3

#Data Type
#Numeric
x <- 5.23
class(x)

x <- as.integer(x)
class(x)
#Character
x <- 'dna'
class(x)
x <- as.factor(x)
class(x)
x
#logical
x <- TRUE ; y <- FALSE
class(x) ; class(y)
x <- as.numeric(x) ; y <- as.numeric(y)
x ; y
class(x) ; class(y)
#date/time
x <- '2019-03-04'
class(x)
x <- as.Date(x)
x
class(x)
##### 2.1 Numerics
1 + 2
2 - 1
2 * 3
4 / 2
2 ^ 2
2 ** 2
2 ^ (1/2)
sqrt(2)
3 - 2 + 2 * 4 / 2 ^ (1 + 1)	
# PEMDAS(Parenthesize, Exponentiate, Multiply, Divide, Add, Subtract)
7 / 3   # Float division
5 %/% 2 # Integer division
5 %% 2  # Remainder

#
2 == 2
2 != 2
2 != 1
all.equal(2,2,2)
3 > 2
3 < 2
3 >= 2

#
a <- c(1,0,0) ; b <- c(1,1,0)
!a
a|b
a||b
a&b
a&&b
#
a <- 3
b <- c(3,4,5)
a%in%b

x <- matrix(1:4,2,2)
y <- matrix(4:1,2,2)
x%*%y

"%p%" = function(x,y) { 2^x + y^2 }
3 %p% 2
"%p%"(3,2)


### Operations are functions
"+"(3,2)
"*"(3,2)

### Comparison Operations
7 < 3
7 > 3
7 == 3
7 != 3
sqrt(2)^2 == 2
print(sqrt(2)^2)
print(sqrt(2)^2, digits = 21)
all.equal(sqrt(2)^2, 2,2)
all.equal(1e-23, 1e-24)

#as.type
num <- 2
cha <- 'string'
log <- TRUE
time <- as.Date('2019-03-14')

num <- as.character(num) ; num
num <- as.logical(num) ; num
num <- as.Date(num) ; num # x
num <- as.factor(num)

class(num)

cha <- as.numeric(cha) ; cha
cha <- as.logical(cha) ; cha
cha <- as.date(cha) ; cha
cha <- as.factor(cha) ; cha

class(cha)

log <- as.numeric(log) ; log
log <- as.character(log) ; log
log <- as.Date(log) ; log #X

class(log)

time <- as.numeric(time) ; time #
time < -as.Date(time) ; time
time < -as.character(time) ; time
time < -as.Date.POSIXct(time) ; time

class(time)

##### 3.2 Managing variables
# list variables
ls()
ls.str()

# remove all variables
rm(list=ls())

