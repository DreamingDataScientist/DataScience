#apply (행/열 함수)
# : 배열, 행렬에 함수를 행(1)이나 열(2)로 방향을 적용. 결과는 벡터, 행렬, 리스트로 출력 (범용으로 사용)
#sapply (대상 함수)
# : apply나 lapply를 사용하기 편하게 간편화 시킴.
#lapply

a<-c(1:10) #1~20 까지의 합 - 벡터, 1차원의 배열
a
nums <- matrix(1:20, nrow=5, ncol=4) #2차원의 배열
nums

#중요한건 apply의 리턴값은 벡터로 나옴!!!!!!
apply(nums, 1, sum)
apply(nums, 2, sum)
num1<-c(1:4)
num2<-c(5:8)
num3<-c(9:12)
nums<-as.data.frame(nums)
num <-data.frame(num1,num2,num3)
sapply(nums, sum)
nums
num

#iris - apply/lapply/sapply
iris[1:4]
class(iris[1:4])
apply(iris[1:4], 2, mean) #리턴값은 벡터로 나옴 
apply(iris[1:4], 1, mean) #리턴값은 벡터로 나옴 
lapply(iris[1:4], mean) #리턴값은 리스트로 나옴  
sapply(iris[1:4], mean) #리턴값은 벡터로 나옴 



#tapply : 그룹별로 함수를 적용하는 apply계열의 함수
x<-c(1:20)
y<- rep(c(1,2,3,4),5)
y
x
tapply(x,y,sum)


tapply(x, x%%2==0, sum)

#iris에서 종별 꽃받침 평균길이
tapply(iris$Sepal.Width, iris$Species, mean)

#Fruits의 연도별 총 매출액
b<-tapply(Fruits$Sales, Fruits$Year, sum)
a<-sqldf("select sum(Sales) as total_sales, Year from Fruits group by year ")
c<-aggregate(Sales ~ Year, Fruits, sum)
c
class(a)
class(b)
class(c)


#데이터재구성 reshape (데이터마트)
#데이터를 좀 더 향상된 방식으로 자르고 붙이는 기능 제공
#wide-format data :데이터분석시 많이 이용
#long-format data : 다양한 상황에 사용

#melt : 기존 데이터를 long-format data로 변형
#cast : 기존 데이터를 wide-format data로 변형

#이 처럼 데이터의 구조를 바꾸려면 reshape2패키지를 설치.
#melt : 특정컬럼을 기준으로 variable, value로 나눔.
#데이터프레임을 다룰때 데이터구조를 행의 키를 기준으로 나머지를 변수화해서 하나의 열에 담아버리는 것을 melt, melting이라고 함.

install.packages('reshape2')
library(reshape2)
head(airquality) #대기질에 관련된 데이터 집합
air1<-melt(airquality, id.vars=c('Month', 'Day'))
head(air1)
row_number(airquality)

#mydata 생성하기
ID<-c(1,1,2,2)
Time<-c(1,2,1,2)
X1<-c(5,3,6,2)
X2<-c(6,5,1,4)
mydata<-data.frame(ID,Time,X1,X2)
mydata
melted<-melt(mydata, id.vars=c("ID",'Time'))
melted

air2<-melt(airquality, id=c('Month', 'Day'), measure=c('Solar.R', 'Wind'))
head(air2)


#문제) Fruits데이터를 year기준으로 나머지 데이터를 melt
fruits_melt <- melt(Fruits, id='Year')
head(Fruits)
head(fruits_melt)
yfruits<-melt(Fruits, id='Year', variable.name = 'fruits_type', value.name='qty_price')
yfruits

#melt 된 데이터를 새로운 형식의 데이터로 만들려면 집계함수가 적용된/ 적용되지 않은 dcast함수를 이용
#dcast(데이터, 기준컬럼~대상컬럼, 적용함수)

#ID를 기준으로 variable 컬럼의 모든데이터를 그룹화해서 평군을 계산
melted
dcast(melted, ID~variable, mean)
mydata

dcast(melted,Time~variable, mean )
time_data <- dcast(melted, ID+variable ~ Time)
names(time_data) <- c('ID', 'variable', 'time1', 'time2')
time_data
dcast(melted, ID ~ variable+Time)

yfruits
dcast(yfruits, Year ~ fruits_type)

#Fruits 데이터를 year, fruits를 기준으로 sales,expense,profit데이터를 melt하세요...!

head(Fruits)
yfruits <- sqldf("select Fruit,Year,Sales,Expenses,Profit from Fruits")
yfruits
melfru<- melt(yfruits, id=c('Year', 'Fruit'), variable.name = 'type', value.name='amount')
melfru

dcast(melfru, Year~Fruit)
dcast(melfru, Year+Fruit~type)
dcast(melfru, Year~Fruit+type)
dcast(melfru, Fruit~type)



split(Cars93$MPG.city, Cars93$Origin)
head(Cars93)

substr('statistics', 3,4)
nchar('statistics')
length('statsitcs')
















