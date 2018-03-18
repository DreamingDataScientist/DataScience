setwd("D:/빅데이터/R/helloR")
#기초 데이터 관리

#리더쉽에 관한 조사결과
#성별에 따라 매니저의 리더쉽이 관계있나?
#국적도 중요한 요인인가?

manager <- c(1,2,3,4,5)
date <- c('10/24/14', '10/28/14', '10/01/14', '10/12/14', '05/01/14')
country <- c('US', 'US', 'UK', 'UK', 'UK')
gender <- c('M', 'F', 'F', 'M', 'F')
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)

leaders <- data.frame(Manager=manager,Date=date,Country=country,Gender=gender,Age=age, q1, q2, q3, q4, q5, stringsAsFactors = F)
leaders

#1) 새로운 속성(컬럼) 추가 : 다섯개의 평점을 결합.
#데이터 프레임에 새로운 열을 추가하려면 $연산자 사용하거나 transform() 함수를 이용한다.
x1 <- c(2,2,6,4)
x2 <- c(3,4,2,5)

mydata <- data.frame(x1, x2)
mydata

sumx <- mydata$x1 + mydata$x2
sumx
meanx <- (mydata$x1+mydata$x2)/2
meanx

#데이터프레임에 새로운 열추가
mydata$sumx <- mydata$x1 + mydata$x2 
mydata$meanx <- (mydata$x1+mydata$x2)/2
mydata

leaders

#새로운 열 추가.
attach(leaders)
leaders$sum <- (q1+q2+q3+q4+q5)
leaders$mean <- (sum)/5
detach(leaders)
leaders

#새로운 열을 추가하기 위한 함수인 transform 쓰기
mydata <- transform(mydata, sumx = x1+x2, meanx = sumx/2)
mydata

#2) 변수 컬럼 값 재작성
#기존의 변수나 값을 기준으로 새로운 변수값을 생성
#연속값을 가지는 변수를 3개의 카테고리로 나눔
#잘못 작성된 값을 바른값으로 대체
#조건에 따라 통과/탈락 변수 생성

#age가 75보다 크면 age_cate이라는 컬럼을 만드는데 데이터를 노년이라고 붙여라.
#약관 - 20대이하
#청년 - 30대
#불혹 - 40대
#지천명 - 50대
#이순 - 60대
#고희 - 70대 이상
leaders$age_cate[leaders$Age == 99] <- '백수'
leaders$age_cate[leaders$Age >= 80 & leaders$Age < 90] <- '졸수'
leaders$age_cate[leaders$Age >= 70 & leaders$Age < 80] <- '산수'
leaders$age_cate[leaders$Age >= 60 & leaders$Age < 70] <- '고희'
leaders$age_cate[leaders$Age >= 50 & leaders$Age < 60] <- '이순'
leaders$age_cate[leaders$Age >= 40 & leaders$Age < 50] <- '지천명'
leaders$age_cate[leaders$Age >= 30 & leaders$Age < 40] <- '불혹'
leaders$age_cate[leaders$Age >= 20 & leaders$Age < 30] <- '청년'
leaders$age_cate[leaders$Age >= 10 & leaders$Age < 20] <- '청소년'
leaders

#값을 바꾸기 위해 within을 이용해서 간결하게 작성
leaders <- within(leaders, {
  age_cate[age==99] <- '백수'
  age_cate[age<99] <- '졸수'
  age_cate[age<89] <- '산수'
  age_cate[age<79] <- '고희'
  age_cate[age<69] <- '이순'
  age_cate[age<59] <- '지천명'
  age_cate[age<49] <- '불혹'
  })
leaders

fix(leaders)
leaders

#컬럼명 변경 - 변수명이 맘에 안든다면 바꾸자
names(leaders) #데이터 프레임의 이름을 출력
names(leaders)[2] <- 'NewDate' #데이터 프레임 이름 변
names(leaders)[6:10] <- c('Q0NE', 'QTWO', 'QTHREE', 'QFOUR', 'QFIVE')
leaders

#plyr 패키지를 이용해서 이름을 바꿔보자
install.packages('plyr')
library(plyr)
leaders <- rename(leaders, c(Manager='managerID', NewDate='examDate', Country='Nation'))
leaders

install.packages("sqldf")
library(sqldf)
sqldf("select*from leaders")

#결측값 처리
#누락, 오류, 부적절한 데이터를 보완 -NA
# is.na()는 누락값 여부 확인.

x <- c(1,2,3,NA)
is.na(x) #na 여부 확인, TRUE로 출력

is.na(leaders[6:10]) #설문조사항목에 대해 누락값 조

#누락값은 비교불가능 -> 비교연산자 불가능
#분석에서 누락값은 제외하것이 좋음.

names(leaders)
#na가 포함된 벡터에 산술연산이 불가하다.
y<-x[1:4] #x에 하나라도 na가 있으면 계산이 안된다. 
z<-sum(x)

#na.rm=T를 사용해서 누락값 제외
z <- sum(x, na.rm=T)
z

#NA가 있는 관측치를 아예 제거 - na.omit()
na.omit(leaders)
leaders

#현재 날짜/시간 출력 -Sys.Date(), Sys.Time()
Sys.Date()
Sys.time()
Sys.timezone()
date()

#날짜 데이터를 입력할때는 보통 문자형식으로 사용
#경우에 따라 날짜로 검색하거나 계산해야 할 필요가 있으면 문자형식을 날짜 형식으로 변환해야 함.
#- as.Date():기본형식은 yyyy-mm-dd
mydate <- c('2008/10/12', '2010/03/01')
mydates <- as.Date(mydate)
class(mydate)
class(mydates)
mydate
mydates

#기본형식이 아닌 다른 형식의 날짜 데이터는 형식 지정자를 사용해서 변환 해야 함.
mydate <-c('01/05/2016')
mydates <- as.Date(mydate, '%m/%d/%Y')
mydates

leaders$Date <- c('10/24/14', '10/28/14', '10/01/14', '10/12/14', '05/01/14')
fmt <- '%m/%d/%y' # %y는 2자리 연도
leaders$Date <- as.Date(leaders$Date, fmt)
leaders

#날짜 변환 - format() : 형식지정자 %m %d %y
today <- Sys.Date()
format(today, format= '%m %b %B %Y %y')
format(today, format= '%A %a %d %D')

#날짜 계산 
sdate <- as.Date('1993-07-15')
edate <- as.Date('2018-02-28')
mydats <- edate - sdate
mydats

difftime(edate, sdate)
difftime(edate,sdate,units='weeks')
difftime(edate,sdate,units='hours')
difftime(edate,sdate,units='mins')

#날짜를 문자로 변환 - as.Character()
strDate <- as.character(edate)
edate

#형변환 
#as.numeric(), is.numeric()
#as.Character(), is.chracter()
#as.logical(), is.logical()
#as.vector(), is.vector()
#날짜를 문자로 변환 - as.Character()

x <- c(1,2,3)
is.vector(x)
as.numeric(x)
is.numeric(x)
is.character(x)
is.vector(x)

#데이터 정렬 - order()
leaders[order(leaders$Age),]
leaders[order(leaders$Age, leaders$Gender), ]
leaders[order(-leaders$Age),]
leaders[order(-leaders$Age, leaders$Gender),]

#데이터 병합 -merge(), rbind()
#데이터가 여러 위치에 존재한다면 이것을 결합해 보자!!

#열 추가하기 - 수평적 결합
#조건 : 두개의 데이터 프레임을 결합하려면 공통의 키가 존재해야한다.

merge(dfA, dfB, by='ID')
merge(dfA, dfB, by=c('ID', 'country'))

#근데요... 키가없는데유??? 그냥 붙이기하면되잖앙 -> cbind()사용
id <- c(1:4)
fname <- c('park', 'kim', 'jeong', 'song')
pinfo <- data.frame(id,fname)
pinfo

id <- c(2:5)
fname <- c('lim', 'lee', 'seo', 'park')
pinfo2 <- data.frame(id, fname)
pinfo
pinfo2
cbind(pinfo, pinfo2) #column기준으로 bind하기 위해서는 열이 같아야함.
rbind(pinfo, pinfo2) #r은 행이 같아야함.

#참고@!!!! 2개의 데이터프레임만 가능함...ㅠㅠ
#merge는 교집합.
merge(pinfo, pinfo2, by='id')
#합집합 하기 위해서는 all=T / 겹쳐지지 않는 부분은 NA라고 뜸.
merge(pinfo, pinfo2, by='id', all=T)
#X축만 합치고 싶다.
merge(pinfo, pinfo2, by='id', all.x = T)
#y축만 합치고 싶다.
merge(pinfo, pinfo2, by='id', all.y = T)

#데이터 부분집합 만들기
#df[행,열] 표기로 원소에 접근 가능
newdata <- leaders[, c(6:10)]
newdata    
myvars <- c('q1','q2','q3','q4','q5')
myvars
newdata <- newdata[myvars] #열이름으로 추출.
newdata

paste('hello', 'world', '!!!')
paste('hellp', 'world', '!!!', sep='~')

#변수 제외하기 : !, -, NULL
#%in% : R의 특수 연산자 -특정값 포함 여부 검사.
myvars <- names(leaders) %in% c('QTHREE','QFOUR')
myvars #TRUE인 열만 출력

#myvars에 TRUE만 만들어짐
newdata <- leaders[myvars]
newdata
#myvars에 FALSE만 만들어짐
newdata <- leaders[!myvars]
newdata

newdata <- leaders[c(8,9)] #8,9열만 출력
newdata
newdata <- leaders[c(-8,-9)] #8,9열만 빼고 출력
newdata

#null값 넣고 그 데이트는 아예 그 행이 사라지게 됨.
leaders$QTHREE <- NULL
leaders
leaders$Q0NE <- leaders$QFIVE <- NULL #두개 다 사라지게 만듦.
leaders

#관측치를 검색 후 선택
newdata <-leaders[1:3,]  #1,2,3행 출력
newdata

leadership[leaders$gender == 'M' & leaders$age > 30,] #성별=남자, 나이>30 

attach()
detach()
with({}) 

#날짜기간으로 검색
#먼저, 문자형식을 날짜형식으로 변환
leaders$examDate<- as.Date(leaders$examDate)
startdate <- as.Date('2009-01-01')

#which 함수 사용
# 검색기간도 날짜형식으로 작성
startdate <- as.Date('2014-01-01')
enddate <- as.Date('2014-05-31')
which (leaders$examDate >= startdate & leaders$examDate <= enddate) #조건일치시 위치값 출력.

#mtcars 자료집합을 이용해서 which 사용하기
help('mtcars')
mtcars

#변속기가 am이 0, 실린더가 4인 자동차의 연비 출력
attach(mtcars)
  which(am==0 & cyl==4)
  cardata <- mtcars[which(am==0 & cyl ==4), 'mpg']
detach(mtcars)
cardata

#위 사례들보다 쉽게 부분 데이터 추출 - subset()
newdata <- subset(leaders, age>35 | age<24, select=c(q1,q2,q3,q4))
newdata

#성별이 m 남이고, 나이가 25이상의 매니저는?
newdata <- subset(leaders, Gender=='M' & Age>=35, all=T)
newdata
leaders

#무작위 표본 추출 - sample : 비복원/복원 추출
sample(x=1:10) 
sample(x=1:10, replace=T)
runif(10)

data<-c(1:10)
sample(data,3)
sample(data, 5, replace=T)
leaders[c(1,3,5)]
mysample = leaders[sample(nrow(leaders), 3),]
mysample

#행/열의 수 출력
nrow(leaders)
ncol(leaders)
leaders

#데이터를 sql처럼 사용하자! -sqldf
#sqldf는 sql명령이 호출돼면 자동으로 스키마 생성후 데이터를 테이블에 불러온 후 sql문을 실행함.
install.packages('sqldf')
library(sqldf) 
detach('RMySQL', unload=T)
detach('sqldf', unload=T)
remove.packages('RMySQL')
remove.packages('sqldf')
#구글에서 제공하는 데이터집합 -Fruits
install.packages('googleVis')
library(googleVis)
Fruits

iris #붓꽃3가지 종류에 대해 꽃받침, 꽃잎길이 정
table(iris$Species)

sqldf('select * from iris')

#붓꽃 종을 출력 - 중복배제
sqldf('select Species from iris')

setosa <- subset(iris, Species == 'setosa', all=T)
setosa
versicolor <- subset(iris, Species == 'versicolor', all=T)
virginica <- subset(iris, Species == 'virginica', all=T)
summary(setosa)
setosa
nrow(setosa)

mean_setosa<-c(mean(setosa$Sepal.Length), mean(setosa$Sepal.Width), mean(setosa$Petal.Length), mean(setosa$Petal.Width))
mean_setosa
mean_versicolor <-c(mean(versicolor$Sepal.Length), mean(versicolor$Sepal.Width), mean(versicolor$Petal.Length), mean(versicolor$Petal.Width))
mean_virginica <-c(mean(virginica$Sepal.Length), mean(virginica$Sepal.Width), mean(virginica$Petal.Length), mean(virginica$Petal.Width))
sort <- c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')
mean_iris <- data.frame(sort, mean_setosa, mean_versicolor, mean_virginica)
mean_iris



unique(iris$Species)
iris[!duplicated(iris$Species),]
install.packages('dplyr')
library(dplyr)
distinct(iris)

library(googleVis)
sqldf('select * from Fruits')
sqldf('select * from Fruits where Fruit = "Apples"')
sqldf('select * from Fruits limit 3')
sqldf('select * frok Fruits order by Year')
sqldf('select sum(Sales), max(Sales) from Fruits')
sqldf('select Fruit, avg(Sales) from Fruits group by Fruit')

sqldf('select * from iris')
sqldf('select * from iris where Species="setosa" limit 3')
sqldf('select max("Sepal.Length") as max from iris group by Species')

mean_iris
