#graph2
#선형그래프 - plot
#시간별 추세를 표시하는데 적합
apple <- c(30,90,120,160,230)
plot(apple, type = 'o', col='red', axes=F, ann=F)
axis(1, at=1:5, lab=c('월','화','수','목','금'))
axis(2, ylim=c(0,250))
title(main='요일별 사과 섭취량',col.main='purple',font.main=4)
title(xlab='요일', col.lab='black')
title(ylab='섭취량', col.lab='blue')

#막대그래프 - barplot
#: 여러가지 통게나 사물의 양을 막대모양으로 알아보기 쉽도록 그린 그래프.
#수량 비교에 좋음.
#비교하거나 변화 상황의 일별, 월별, 연별 통계 등에 많이 이용.
#자료를 쉽게 비교
apple <- c(30,90,120,160,230)
peach <- c(20, 45, 50, 30, 25)
berry <- c(10,15,15,10,5)
fruits <- data.frame(apple, peach, berry)
fruits <- as.matrix(fruits)
barplot(fruits, main='과일섭취량', ylab='섭취량', xlab='과일', col=rainbow(5), beside=T, ylim=c(0,250))

barplot(fruits, main='과일섭취량', ylab='섭취량', xlab='과일', col=rainbow(5), ylim=c(0,700))

#히스토그램 - hist()
#각 데이터의 구간을 대표하는 대표값을 기준으로 나타낸 분포표를 그래프로 나타낸 것
#연속적인 데이터의 분포를 주로 표현하는데 사용.
stud<- c(0,1,2,3,4,4,5,8,12,11,0)
score<-c(0,10,20,30,40,50,60,70,80,90,100)
hist(stud, main='성적 히스토그램', breaks=11)

#원그래프 - pie
#전체를 기준으로 한 부분의 상대적 크기를 표시
#각 항목의 합 100%가 되어야 함.

slices <- c(10,12,4,16,8)
lbls <- c('미국', '영국', '호주', '독일', '프랑스')
pie(slices, lbls, main='나라별 주류 소비', col=rainbow(5))

#박스 수염 그래프 - boxplot
#중앙값, 평균, 사분위수등과 같은 주요 통계 측정치를 시각화
#변수의 주요통계속성을 검사하는데 유용한 시각적 보조 도구를 제공.
#시각적 보조 도구를 제공

boxplot(apple, peach, berry, col=c('red', 'yellow', 'green'), names = c('사과','복숭아','딸기'), horizontal=T) #상자그래프를 수평으로 표

attach(iris)
boxplot(Sepal.Width, Petal.Width, names=c('꽃받침 너비','꽃잎 너비'))
mean(Sepal.Width)
median(Sepal.Width)
detach(iris)

































