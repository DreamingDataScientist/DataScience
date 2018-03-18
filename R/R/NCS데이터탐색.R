#NCS 데이터 탐색
phone<-read.csv('c:/Java/phone-01.csv', header=F)
summary(phone)
var(phone)

phone2 <- read.csv('c:/Java/phone-02.csv', header=F, sep=',')
summary(phone2)

#공분산으로 상관계수를 측정
cor(phone2) #공분산

#데이터 사용량 v9는 평균스마트폰 사용시간V7과 상관관계유의미. 
#가장 높은 유의성을 갖는 변수가 데이터 사용량에 미치는 영향을 추정하여 단순회귀분석 실시.
p<-lm(phone2$V9~phone2$V7, data=phone2)
#회귀식 : y= -272.001 + 6.283*phone2$V7
summary(p)
plot(phone2$V9, phone2$V7, xlab='데이터 사용량', ylab='평균스마트폰 사용시')




runif(10)



