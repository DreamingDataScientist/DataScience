#실행흐름 제어 : if, for, switch
#반복문 - 자주 사용하지 x, apply 함수 이용

for(i in 1:10) {
  print(i)
  result <- i *3
  print(result)
}

i <-1
while (i <= 10) {
  print(i)
  i <- i+1
}

i<- 1
while(T) {
  i<-i*3
  print(i)
  if (i > 9999) break
}

i<-1
repeat {      #do-while 구문과 유사
  result <- i*3
  print(result)
  if(i>9999) break
  i<-i+1
}

#조건문 - if
grade <- '수'
grade
class(grade)
#1) if문
#grade가 char이라면 factor로 변경해라.
if(is.character(grade)) #조건을 ()안에 쓰고 조건이 참이라면
  grade <- as.factor(grade) #아랫줄이 실행이 된다.

#2) if-else문
#grade가 factor이 아니라면 factor로 변경해라.
if(!is.character(grade)) {
  grade <- as.factor(grade)
}
  else {
    print('이미 factor형으로 선언된 변수입니다.')
}

# 3)ifelse문 (조건, 문장1, 문장2)
i <- 11
ifelse( i>10, 
      'i는 10보다 큽니다.', 
       'i는 10보다 작습니다.')


x <- c(6:-4)
x
sqrt(x) #경고표시 - 음수는 제곱근 계산 불가@!!!!
sqrt(ifelse(x>=0, x, NA)) #경고표시는 안되고 음수는 na로 표현됨.


#switch : 
todayfeels <- c(1:4)
for(i in todayfeels){
  print(
    switch(i, '행복', '두려움', '우울', '슬픔')
  )
}

#데이터 집계 - aggregate
#특정한 값을 기준으로 그룹화 한 후 다양한 집계 처리
# aggregate (계산된 열 ~ 기준의 열, 데이터 , 함수)

library(googleVis)
Fruits #과일 년도 위치 판매액 비용 이익 날짜
#년도별 판매액
aggregate(Sales ~ Year, Fruits, sum)

#과일별 판매액
aggregate(Sales ~ Fruit, Fruits, sum)

#과일별 최고 판매액
aggregate(Sales ~ Fruit, Fruits, max)

#과일별 최저 판매액
aggregate(Sales ~ Fruit, Fruits, min)

#과일별, 연도별 최저 판매액
aggregate(Sales ~ Fruit+Year, Fruits, min)

#iris 데이터집합에서 종별 줄기의 평균 길이는?
head(iris)
aggregate(Sepal.Length ~ Species, iris, mean)

#iris 데이터집합에서 종별 꽃잎의 평균 길이는?
aggregate(Petal.Length ~ Species, iris, mean)


#차종별 도시와 고속도로의 평균 연비 계산.
install.packages('MASS')
library(MASS)
str(Cars93)
head(Cars93)

a<-aggregate(MPG.highway ~ Manufacturer, Cars93, mean)
mpg_hw <-sqldf("select * from a order by 1 desc")
mpg_hw

b<- aggregate(MPG.city ~ Manufacturer, Cars93, mean)
b
a
mpg_city <- sqldf("select * from b order by 1 desc")
mpg_city
c<-cbind(mpg_city, mpg_hw$MPG.highway)
mean_mpg<-apply(c[,2:3],1,mean)
d<-cbind(c,mean_mpg)
d <- sqldf("select * from d order by 4 desc")
d


names(d) <- c('차', '도시연비', '고속도로연비', '평균 연비')

aggregate(MPG.city ~Type, Cars93, max)

cardata <- subset(Cars93, select =c('Manufacturer', 'Type', 'Price', 'Max.Price', 'Min.Price') )
head(cardata)
library(sqldf)
cardata<-sqldf('select * from cardata order by 3 desc')
head(cardata)



#결측치 - NA, 99999, unknown, not answer
#누락된 값, 비어있는 값 - 함수 적용 불가. 분석결과 왜곡
#제거 또는 대체후 분석 실시

gender <-c('남','여','남','남','여')
score<-c(5,3,2,NA,4)
df <- data.frame(gender, score)
df
is.na(df)
complete.cases(df$gender)
complete.cases(df$score)

#결측치 빈도 확인
table(is.na(df))
df[3,1] <- NA
df
table(is.na(df))

#df의 성별 결측치 확인
table(is.na(df$gender))

#평균계산 - 결측치 포함 상태
sapply(df$score, mean) #에러 - na로 출력
mean(df$score, na.rm=T)
sum(df$score, na.rm=T)

#결측치 처리 - na.omit()
df<-na.omit(df) #na의 행은 다 삭제됨.
df
tapply(df$score, df$gender, mean)

#MASS 라이브러리의 Cars93 데이터 집합에서 결측값이 모두 몇개인지 확인
#결측치 확인 - 관측치에 결측값이 있는지 여부 검사
#데이터 프레임의 각 행에 대해 결측치를 확인
#행에 저장된 모든 값이 결측치가 아닌 경우에만 TRUE 반환
names(Cars93)
table(is.na(Cars93)) #결측값은 13개.
table(complete.cases(Cars93)) 
#complete.cases가 False인 경우
Cars93[!complete.cases(Cars93),]


#is.na vs complete.cases
#is.na는 컬럼에 대해 na 여부 확인
#complete.cases는 행에 대해 na 여부 확인

#간단한 예제
iris_na <- iris
iris_na [c(10,20,25,40,32),3] <- NA 
iris_na [c(33,100,125),1] <- NA
iris_na

is.na결과는?
table(is.na(iris_na))
table(complete.cases(iris_na))
iris_na[!complete.cases(iris_na),]

#결측값처리
#결측값이 있는 행을 제거
#평균값 또는 임의의값으로 대체
#R에서는 DMwR 패키지를 이용해서 중앙값으로 대체
#R에서는 DMwR 패키지를 이용해서 KNN알고리즘이용해서 가중평균치로 대체

#임의의값으로 대체
gender <-c('남','여','남','남','여')
score<-c(5,3,2,NA,4)
df <- data.frame(gender, score)
df[3,1] <- NA
df
odf <- df
#1) odf의 score에 na이라면 score의 평균값을 넣고 아니라면 그대로 값을 넣어라.
odf$score <- ifelse(is.na(odf$score),mean(odf$score, na.rm=T),odf$score)
odf
#2)na인 부분에 0을 넣어라.
odf$score[is.na(odf$score)] <- 0

#예) iris에 na에 평균값을 넣어라
table(is.na(iris_na))
iris_na[!complete.cases(iris_na),]
iris_na$Sepal.Length <-ifelse(is.na(iris$Sepal.Length), mean(iris$Sepal.Length, na.rm = T), iris$Sepal.Length)
iris_na$Petal.Length <-ifelse(is.na(iris$Petal.Length ), mean(iris$Petal.Length , na.rm = T), iris$Petal.Length )
table(is.na(iris_na))
iris_na

A<-mapply(median, iris_na[1:4], na.rm=TRUE)
#위에서 구한 중앙값을 NA가 있는 자리에 대체는 불편.

#DmwR
#DMwR 패키지 - 중앙값 대체
install.packages('DMwR')
library(DMwR)
iris_na <- centralImputation(iris_na[1:4])[
  c(10, 20, 25, 40, 32, 100, 125, 33),]
table(is.na(iris_na))
iris_na
#DMwR 패키지 - KNN알고리즘 가중평균치 대체
knnImputation(iris_na[1:4])[
  c(10, 20, 25, 40, 32, 100, 125, 33),
]

#이상치
#정상기준에서 벗어나면 결측 처리.
#논리적판단 : 나이가 150을 넘어가면 (이상)극단치
#국어 점수가100점을 넘어서면 이상 극단치
#통계적 판단 : 평균으로부터 3표준편차 떨어진 값.
# 사분위수에서 하단/상단 경계값을 벗어난 값.
# 편차 = 값 - 평균.
age<-c(10,999,23,33,121)
score<-c(200, 50,150,75,88)
name <- c('a','b','c','d','e')
df2 <- data.frame(name,age,score)
df2

#이상치판단. - NA대체 -> 결측치 처리.
df2$age <- ifelse(df2$age >= 100 | df2$age < 0, NA, df2$age)
df2$score <- ifelse(df2$score > 100, NA, df2$score)
df2
#논리적 판단에 의해 이상치들은 NA로 대체.
centralImputation(df2[2:3])[c(2,3,5),]
!complete.cases(df2[,])
df2_na <- centralImputation(df2)[!complete.cases(df2),]
df2_na
df2
#기존 na결측치는 행으로 다 삭제되고 평균값으로 대체됨. 
#즉, na가 있는 행은 다 삭제, 평균값으로 대체된 행이 올라옴.
df2 <- rbind(na.omit(df2), df2_na)

#mpg 데이터 집합에서 drv(차량종류)에 이상치가 있는지 알아보고
#적적하게 수정하세요. 결측처리시 %in% 연산자를 사용하세요
#drv : r- 후륜구동, f-전륜구동, 4-4륜구동
library(MASS)
install.packages('ggplot2')
library(ggplot2)
mpg
mpg$drv <- ifelse(mpg$drv != 'f' | mpg$drv != '4' |mpg$drv != 'r', NA, mpg$drv ) #잘못함
mpgdrv <- mpg$drv
mpgdrv<- ifelse(mpgdrv %in% c('f','r','4'), mpgdrv, NA)
table(is.na(mpg$drv))
mpg
remove.packages('ggplot2')


filter(Cars93_1, Type == c("Compact") | Max.Price <= 20 | MPG.highway >= 30)
a<-mpg
write.csv(a,'C:/Users/DJA/Desktop')








