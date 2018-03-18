#graph1
#숫자와 텍스트만으로 작성된 통계결과는 지루/따분
#그래프와 그림형태로 제시(시각적묘사) - 열정적반응
#그래프 그리기 함수 : plot(x,y), plot(x~y)
x<- 1:10
y<- 10:1
plot(x,y) #권장!
plot(y~x) #데카르트 방식.

x <- -5:5
y <- 10*x+10
plot(x,y)

x <- rnorm(10000)
y <- -2*x^2-10*x+4
plot(x,y)

x<-1:1000
y<-sqrt(x)
plot(x,y)

x<-1:1000
y<-log(10*x+100)
plot(x,y)

plot(rnorm(15))
hist(rnorm(15))
boxplot(rnorm(15))

#그래프 출력방향 지정 - sink()
bmp('c:/Java/graph.bmp') #그래프를 bmp방식으로 저장
library(sqldf)
mtcars2 <- sqldf('select*from mtcars limit 50')
mtcars2

#x축 중량, y축 연비 / 산점도
attach(mtcars2)
plot(wt, mpg)
abline(lm(mpg~wt)) #상관관계를 의미하는 직선 추가
title('차량중량에 따른 연비 상관관계')
detach(mtcars2)
sink()
dev.off()
str(mtcars)

plot(mtcars$mpg, mtcars$wt)
abline(lm(mtcars$wt~mtcars$mpg))
title('차량중량에 따른 연비 상관관계')
sink()

#그래프 그리기 사례
#두 약물에 따른 환자반응
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)
plot(dose, drugA)
plot(dose, drugA, type='p')
plot(dose, drugA, type='l')
plot(dose, drugA, type='s')
plot(dose, drugA, type='S')
plot(dose, drugA, type='h')

#그래프 옵션 설정 - par()
#par : 점 종류 (0~25)
#lty : 선종류 (1~6)
#cex : 기호 크기 1, 1.5, 0.5
#lwd : 선 굵기 1, 1.5, 0.5
par(lty=1, pch=17, cex=1.4) #선유형, 점유형
plot(dose, drugB, type = 'b')
plot(dose, drugB, type='h')

par(bg='orange') 
plot(dose,drugA,col='red', col.axis='blue', col.lab='green', main='아아아아', col.main='purple', sub='서브제목', col.sub='navy', fg='orange', type='b')

#그래프에서 사용가능한 색깔
colors()

#하지만 자주 사용하느 인기색은 타로 있음

color1 <-rainbow(7)        #무지개 색
color2 <-heat.colors(10)
color3 <-topo.colors(10)
color4 <-cm.colors(10)
color5 <-gray(0:10/10)

plot(1:10,10:1,col=color1)
plot(1:10,10:1,col=color2)
plot(1:10,10:1,col=color3)
plot(1:10,10:1,col=color4)
plot(1:10,10:1,col=color5)

plot(Petal.Width~Sepal.Width,
     iris, xlab='Sepal 길이', 
     ylab='Petal 너비', main='iris 샘플링', 
     col=c('red','blue','green')[Species])

attach(iris)
plot(Petal.Width~ Sepal.Width, iris, xlab='sepal 길이', ylab='petal 너비', main='iris 샘플링', col=c("red", "blue", "green")[Species])
detach(iris)


#원그래프(파이그래프)
pie(rep(1:10), labels=color1, col=color1)
pie(rep(1:10), labels=color2, col=color3)
pie(rep(1:10), labels=color3, col=color4)
pie(rep(1:10), labels=color4, col=color5)
pie(rep(1:10), labels=color5, col=color6)

#글씨체 변경 windowsFonts
windowsFonts(
  A=windowsFont("궁서체"),
  B=windowsFont("Consolas"),
  c=windowsFont("맑은고딕")
)

#그래프 옵션 초기화
par(mfrow=c(1,1)) 

#폰트 : 1 기본, 2진하게 3이탈릭 4진하고 이탤릭
par(font.lab=3, font.main=4, font.axis=4, family='B', bg='white')

plot(1:10, 10:1)plot(dose, drugA, type='b', main='폰트연습')

#범례 - legend(위치, 제목, 범례...)
install.packages('Hmisc') #그래프에 작은 눈금을 그림
library(Hmisc)
minor.tick(nx=3, ny=3, tick.ratio=0.5)

par(mfrow=c(1,1))
plot(dose, drugA,type='b', pch=15,lty=1,col='red',ylim=c(0,60), main = '환자와 약물 a,b 관계', xlab='환자',ylab='약물 반응')

#2번째 그래프 작성
lines(dose, drugB, type='b', pch=17, lty=2, col='blue')

abline(h=c(30), lwd=1.5, lty=2, col='gray') #보조선 

legend('topleft', inset=.05, title='약물종류', c('A','B'), lty=c(1,2), pch=c(15,17),
       col=c('red','blue'))

#위치는 3x3 으로 나누어진 영역을 top,center,bottom,left,center,right를 조합해서 지정.
#한화면에 여러개의 그래프를 배치
#mfrow=c(행,열) 행중심
#mfcol=c(행,열) 열중심

#2x2 형태의 그래프 배치
par(mfrow=c(2,2)) #2x2사이즈로 화면이 나누어지게 됨.

plot(mtcars$wt,mtcars$mpg,main='차량 무게 대비 연비 산점도',col=color5)
plot(mtcars$wt,mtcars$disp,main='차량 무게 대비 연비 산점도',col=color1)
hist(mtcars$wt,main='차량 무게 대비 연비 산점도', col=color2)
boxplot(mtcars$wt,main='차량 무게 대비 연비 산점도', col='grey')


#1x2 형태의 그래프 배치
#layout:영역의 갯수는 행렬을 이용
#layout(matrix(영역번호), 너비, 높이)
#layout.show(): 영역을 미리 볼 수 있음.
attach(mtcars)
layout(matrix(c(1,1,2,3),2,2, byrow=T))
hist(wt)
hist(mpg)
hist(disp)
boxplot(wt)
detach(mtcars)

#split.screen() : 화면분할
#split.screen(c(행,열), 스크린번호) 
attach(mtcars)
split.screen(c(2,1)) #2행1열로 나
split.screen(screen=2, c(1,2)) #두번째 스크린을 1행2열
#2행1열 스크린을 1행2열로 나눔

screen(1)#1,1

hist(wt)

screen(3)#2,1

hist(mpg)

screen(4)#2,2

hist(disp)

detach(mtcars)









