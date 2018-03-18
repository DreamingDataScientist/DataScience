#데이터 시각화
#시각화의 기능은 설명, 탐색, 표현의 세 가지로 구분할 수 있다.
#R

accid_2015 <- read.csv('c:/Java/seoul_car_acci_v1.txt', sep=',')

accid_2016 <- read.csv('c:/Java/car_accid_2016.txt', sep='\t')

accid_2005_2016 <- read.csv('c:/Java/car_accid.txt', sep='\t')

head(accid_2015)
head(accid_2016)
head(accid_2005_2016)

#R시각화 도구
#graphics: R기본 시각화도구, 별도 설치 X, 쉽고 사용하기 편함.
#ggplot2 : R고급 시각화도구, 별도 설치 O, 배우기 다소 어려움
#lattice : R 시각화도구, 다중 그래프 작성시 편리.
install.packages('ggplot2')
install.packages('lattice')
library(ggplot2)
?ggplot2

#그래프 작성 보조 도구 - dplyr
install.packages('dplyr')
library(dplyr)

#산점도
head(iris)
gg1 <- ggplot(iris, aes(Sepal.Length, Sepal.Width))
#그래프 작성 초기화 (데이터집합, x, y)
gg1 <- gg1+geom_point()
#점 그래프 : 산점도, 산포도
print(gg1)

#Speices 별로 색상을 지정해 산포도 그림
gg2 <- ggplot(iris, aes(Sepal.Length, Sepal.Width))
#그래프 작성 초기화 (데이터집합, x, y)
gg2 <- gg2+geom_point(aes(colour=Species, size=Petal.Width))
#점 그래프 : 산점도, 산포도
print(gg2)

#서울 중구 2015 교통사고 현황을 산점도 geom_point로 선정.
#str(accid_2015)

junngu2015 <- subset(accid_2015, 자치구명=='중구')

p1 <- ggplot(data=junngu2015, aes(x=월, y=발생건수))

p1 <- p1+geom_point()
p1 <- p1+geom_point(aes(colour=월, size= 월))
p1 <- p1 + xlim(1,13) + ylim(0,150) #x,y 상하한 값.
p1 <- p1 + ggtitle('2015년 중구 월별 교통사고 발생')
p1 

#또 다른 유형 산점도
x<- 1:50
y<- sapply(x, function(x) { (x)/(x+1) } )
df<-data.frame(x,y)
head(df)

gg3 <- ggplot(df, aes(x,y))
gg3 <- gg3 + geom_point()
gg3

#다이아몬드 데이터 집합
#캐럿당 가격을 산포도를 그림, 색상은 color 변수 사용
head(diamonds)
gg4 <- ggplot(diamonds, aes(carat, price))
gg4 <- gg4+geom_point(aes(colour=color, size=carat))
gg4

#선그래프 - geom_line
#시기date별 실업률 unemploy 현황.
head(economics)
gg5 <- ggplot(economics)
gg5 <- gg5 + geom_line(aes(x=date,y=unemploy))
gg5

#선 그래프에 색상/크기 지정.
gg6 <- ggplot(economics, aes(x=date, y=unemploy))
gg6 <- gg6 + geom_line(colour='red', size=1, linetype=5)

#여러 개의 선 그래프 작성
gg7 <- ggplot(economics)
gg7 <- gg7 + geom_line(aes(x=date, y=unemploy))
gg7 <- gg7 + geom_line(aes(x=date, y=pce), colour='red')
gg7

#오렌지 나무 연령별 둘레 현황
head(Orange)

gg8 <- ggplot(Orange, aes(age, circumference))
gg8 <- gg8 + geom_line(aes(colour=Tree))
gg8 <- gg8 + geom_point()
gg8

#선그래프 + 점 그래프 

#서울 중구 2015 교통사고 현황(월/발생건수)을 선그래프 geom_line으로 작성.

junngu2015 <- subset(accid_2015, 자치구명=='중구')
p2b <- ggplot(data=junngu2015, aes(x=월, y=발생건수))
p2b <- p2b + geom_line() + geom_point()
#p2b <- p2b + xlim(1,13) + ylim(0, 150)
p2b <- p2b + ggtitle('2015년 중구 월별 교통사고 발생')
p2b <- p2b + scale_x_continuous(breaks=1:12)
p2b <- p2b + theme(panel.background = element_rect(colour='grey', fill='white'), plot.title = element_text(hjust=0.5))

p2b

#막대그래프 : geom_bar
head(mtcars)

#차량별 실린더수 현황 히스토그램
gg9 <- ggplot(mtcars, aes(cyl))
gg9 <- gg9 + geom_bar()
#gg9<- gg9 + geom_bar(aes(fill=cyl), width=0.5)
gg9

fcyl <- factor(mtcars$cyl)
gg9b <- ggplot(mtcars, aes(fcyl))
#cyl은 num타입 - factor형으로 변환
gg9b <- gg9b + geom_bar(aes(fill=fcyl), width=0.5)
gg9b

#누적막대그래프
fgear = factor(mtcars$gear)
gg9c <- ggplot(mtcars, aes(fcyl))
gg9c <- gg9c + geom_bar(aes(fill=fcyl), width=0.5)
gg9c <- gg9c + geom_bar(aes(fill=fgear), width=0.5)
gg9c

#수평 누적 막대 그래프
gg9d <- ggplot(mtcars, aes(fcyl))
gg9d <- gg9d + geom_bar(aes(fill=fcyl), width=0.5)
gg9d <- gg9d + geom_bar(aes(fill=fgear), width=0.5)
gg9d <- gg9d + coord_flip()
gg9d

#일반적인 막대그래프
#실린더 수에 따른 연비 그래프
#stat='identity'는 y의축 값을 mpg 값 그대로 사용하라는 의미.
gg10 <- ggplot(mtcars, aes(fcyl, mpg)) + geom_bar(aes(fill=fcyl), stat='identity')
gg10

#서울 중구 2015년 교통사고 현황(월/발생건수)을 막대그래프 geom_bar로 작성
head(accid_2015)
p4 <- ggplot(accid_2015 , aes(월, 발생건수)) + geom_bar(fill='blue', width=0.5, stat='identity')
p4

#서울 중구 2015 교통사고 자치구 별 (자치구명/발생건수)을 막대그래프 geom_bar로 작성
head(accid_2015)
accid_2015_12 <- subset(accid_2015, 월==12)
head(accid_2015_12)

f = factor(accid_2015_12$자치구명)
f 
#p5 <- ggplot(accid_2015_12, aes(자치구명, 발생건수)) + geom_bar(fill=rainbow(25), stat='identity')
#aes쓰는 것과 안쓰는 것 차이가 있다.
p5 <- ggplot(accid_2015_12, aes(자치구명, 발생건수)) + geom_bar(aes(fill=자치구명), stat='identity')
p5

p5 <- p5 + theme(axis.text.x = element_text(angle=90, hjust=1))
p5

#2015년 12월 서울 각 자치구별 교통사고 현황(자치구명/사망자수)를 출력

p6 <- ggplot(accid_2015_12, aes(자치구명, 사망자수)) + geom_bar(aes(fill=자치구명), stat='identity') + coord_flip() 
p6

#2015년 12월 서울 각 자치구별 교통사고 현황(자치구명/부상자수)를 출력

p7 <- ggplot(accid_2015_12, aes(자치구명, 부상자수)) + geom_bar(fill=rainbow(25), stat='identity') + coord_flip() 
p7

#원 그래프 : geom_bar + coord_polar()

gg9 <- gg9+ coord_flip() #coord_flip()은 알다시피 수평으로!
gg9

gg9b <- gg9b + coord_polar() #polar원그래프 
gg9b

#일반적인 파이 그래
gg10 <- ggplot(mtcars, aes(factor(1), fill=fcyl))
gg10 <- gg10 + geom_bar(width=1) + coord_polar(theta = 'y') 
gg10

#
df <- data.frame(group=c('Male', 'Female', 'Child'), age=c(25,27,5))
head(df)

bc <- ggplot(df, aes('', age, fill=group)) + geom_bar(stat='identity') + coord_polar(theta = 'y') #y는 임의의 각도 사용
bc

#heat map : heatmap()
#데이터가 행렬 객체를 사용함.
accid_2015_12

row.names(accid_2015_12) <- accid_2015_12$자치구명
mtx_acc_2015_12<-accid_2015_12[, c(4:6)] #4열 ~ 6열까지 뽑음
mtx_acc_2015_12<-data.matrix(mtx_acc_2015_12) #매트릭스로 바꿈
mtx_acc_2015_12

heatmap(mtx_acc_2015_12, col=cm.colors(128), Rowv=NA, Colv=NA, scale='column', cexCol = 1, margin=c(5,5))

#mtcars
head(mtcars)
mmtcars<-as.matrix(mtcars)
head(mmtcars)

heatmap(mmtcars) #기본 열 그래프작성
heatmap(mmtcars, scale='column') #정규화 작업후 다시그
heatmap(mmtcars, scale='column', Colv = NA, Rowv = NA) #군집화 제거
heatmap(mmtcars, scape='column', Colv = NA, Rowv = NA, cold=terrain.colors(256))#색상지정1
heatmap(mmtcars, scape='column', Colv = NA, Rowv = NA, col=rainbow(256))#색상지정2

#버블차트
#2015년 12월 서울 각 자치구 별
#교통사고 현황(발생건수/사망자수)를 출력
gg11 <- ggplot(accid_2015, aes(발생건수, 사망자수))
gg11 <- gg11 + geom_point(aes(size=사망자수),shape=16, color='red3', alpha=0.45)
gg11 <- gg11 + scale_fill_brewer(palette='Paired')
print(gg11)

#scale_fill_brewer 에서 지원하는 색상 팔레트 조회
RColorBrewer::display.brewer.all()

#Cars93 데이터 이용 - 도시. 고속도로별 연비
library(MASS)
library(ggplot2)
head(Cars93)
ggplot(Cars93, aes(Weight, MPG.highway)) + geom_point(shape=21, size=6, fill='red')

#연속형 변수값에 따라 색깔 변화
ggplot(Cars93, aes(Weight, MPG.highway, fill=Price)) + geom_point(shape=21, size=6)

#범주형 변수값에 따라 색깔 변화
ggplot(Cars93, aes(Weight, MPG.highway, fill=Cylinders)) + geom_point(shape=21, size=6) +scale_fill_brewer(palette='Oranges')     

#색깔 지정을 미리 저의된 팔레트로 이용                              
ggplot(Cars93, aes(Weight, MPG.highway, fill=Cylinders)) + geom_point(shape=21, size=4) +scale_fill_brewer(palette='Paired') 



