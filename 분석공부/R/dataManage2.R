#dataManage2

#학생성적 데이터에 대해 학점을 부여
#3 과목 점수가 일정하지 않음 - 평균, 편차 구하기가 어려움
#학점을 구하려면 백분위를 결정
#이름으로도 정렬도 어려움 - 성과 이름 분리

#수학함수.
data<- c(-3, 3, 0.5)
abs(data) #절대값
sqrt(a) #제곱근
ceiling(data) #올림
floor(data) #내림
round(data) #반올림
trunc(data) #절
signif(data)
sort(data) #정렬
rev(data) #역순
rank(data) #순위
cumsum(data) #누적합
cumpro(data) #누적곱
cummax(data) #누적최대값
cummin(data) #누적최소값

#통계관련함수.
data <- c(2,7,5,3,1,4,6,1)
sum(data)
prod(data)
max(data)
min(data)
diff(data)
which.max(data)
which.min(data)
range(data)
mean(data) #평균
median(data) #중간값
sd(data)#표준편차
var(data)#분산
mad(data)#중위값

#확률함수 : runif()
#set.seed(임의의값) - 난수생성 seed 설
runif(10)
set.seed(999)

#문자함수
#nrow, ncol
ch <- c('ab', 'xyz', 'abc123')
nchar(ch) #문자의 수를 세워준다.

ch<-'abc123xyz987'
substr(ch,2,4) #지정한 위치의 문자를 추

grep('xyz', ch, fixed=T) #지정한 패턴에 의해 문자검색
x<- c('abc', '123', 'xyz', '987')
grep('xyz',x,fixed=T)

sub() #패턴에 의해 지정한 문자를 검색하고 문자 치환
sub('\\s','.','Hello,world!')
sub('\\s','.','Hello,world!')
sub('\\s','.','Hello,world!')

strsplit() #문자에서 특정 요소를 분리
c <- strsplit('abc123', 'b')
c
x
paste() #구분자로 문자열을 분리한 후 결합
paste('x', 1:3, sep='')
paste('x', 1:3, sep='M')
paste(1:3, c('엄마', '민지', '민재'), sep='와')
paste('오늘은', date())

toupper(ch)
tolower(ch)

mean_iris

iris[1:4]
scale(iris[1:4])
#성적처리
#성적 처리지표 :ABCDF
#성과 이름을 분리.
#성적 데이터를 표준화 시킴 :scale
#이웃분류 knn, 벡터지원svm, 식녕망 등
#많은 분류 알고리즘에 유용하게 사용
#변수값을 적당한 수준으로 조정 : 0~1 / -1~1
#조정된 값을 평균과 표준편차로 다시 재계산
options(digits=2) #소수점 2자리

#성적데이터 표준화.
Student <- c('John')
roster <- data.frame(Student)
roster<-edit(roster)
roster

scale(roster[2:4])
summary(roster)
sd(roster$Math)
sd(roster$Science)

newdata <- scale(roster[,2:4])
newdata
summary(newdata)

#apply함수 이용
#특정연산을 손쉽게 처리하게 해주는 함수
newdata<- roster[2:4]
score <- apply(newdata, 1, mean)
score

#구해진 평균점수를 roster 테이블에 열로 추가
roster <- cbind(roster, score)
roster
roster$score <- NULL

head(iris)
iris[1:4]
apply(iris[1:4],1,mean)
apply(iris[1:4],2,mean)
summary(iris)

head(Fruits)
apply(Fruits[4:6],2,mean) #열단위
apply(Fruits[4:6],1,mean) #행단위
Fruits

apply(iris[1:4],1,function(x){x+100})
iris[1:4]

roster
#newdata에서 과목별 최대점수, 최소값을 출력해서 maxscore minscore이름으로 열추가
minMath <- min(roster$Math)
minEng <- min(roster$English)
minScie <- min(roster$Science)

newdata <- data.frame(minMath,minEng, minScie, maxMath, maxEng, maxScience)

newdata

#newdata에서 과목별 최대점수, 최소점수를 출력해서 maxmath, maxscience,maxenglish 이름으로 열을 추가
aver_score <- mean(roster$score)
maxMath <- max(roster$Math)
maxEng <- max(roster$English)
maxScience <- max(roster$Science)
best_Score <- max(roster$score)
best_Student<- sqldf("select Student, score from roster order by score desc limit 1")
aver_score
maxMath
report_score <- data.frame(aver_score,maxMath, maxEng, maxScience, best_Student=best_Student)
report_score
plot(newdata)

cbind(newdata, report_score)
roster

#newdata에서 학생별 최대점수, 최소점수를 출력해서 maxscore, minscore이름으로 열출력
library(sqldf)
mean_score <- sqldf("select score/3 as mean_score from roster")
mean_score
score2 <- cbind(roster, mean_score)
score2
a <- apply(score2[,2:5], 2, max)
a

#학점계산 - 사분위수
#quantile() - 집단에서 측정된 수치의 특성을 표현
#분위수 - 확률적으로 균등하게 영역을 나눠 계산한 수

y <- quantile(score2$mean_score, c(.8, .6, .4, .2))
y
score
attach(roster)

score2$grade[score2$mean_score >= y[1]] <- 'A' #상위 80프로 속하는 사람들 : 자신의 점수가 0.77이상
score2$grade[score2$mean_score < y[1] & score2$mean_score>= y[2]] <- 'B'
score2$grade[score2$mean_score < y[2] & score2$mean_score>= y[3]] <- 'C'
score2$grade[score2$mean_score < y[3] & score2$mean_score>= y[4]] <- 'D'
score2$grade[score2$mean_score < y[4]] <- 'F'

score2






