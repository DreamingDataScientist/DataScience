# 여러줄에 걸쳐 입력하기
print( 
  "hello, R, again"
  )
# R 스크립트 샘플
# 나이와 몸무게의 상관관계 파악
#q 벡터 형식으로 데이터 정의하고 변수 age에 대입.
age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
age
weight

#산술평균
mean(weight)  
mean(age)

#표준편차(평균에서 얼마나 떨어져있나?)
sd(weight)
sd(age)


#두 사건간의 연관성(관계) 조사 
#두 변수간의 선형적 관계 파악
#예_GDP와 기대수명
#상관계수
cor(age, weight)

# 그래프로 보기 
plot(age, weight)

#간단한 그래프 데모
demo()
demo('graphics')

#도움말 함수
help.start()
#http://homepage.usask.ca/~chl948/doc/maunal/R-intro-ko.html
# q()에 대한 도움말 출력 
help('q')
?q

q() #종료

help.search('q') #searching for specific words
RSiteSearch('q') #seraching for words online.

apropos('q', mode='function') # finding function including 'q' words. 

data() #Available data of packages you use.
vignette() # detailed manual for packages 

#작업공간 관련 함수
getwd() #현재 작업 디렉토리 출력
setwd("c:/java") #새로운 작업 디렉토리를 설정

ls()#현재 작업공간의 모든 객체를 출력
rm() #하나 이상의 객체를 제거
rm(weight)
rm(age)
ls()

options() #현재 작업공간에서 사용가능한 설정에 대한 정보 제공.

history()
history(5) #끝에서 n개의 명령어를 출력.
savehistory('c:/Java/myhistory.abc') #명령어 히스토리를 저장.(Rhistory)
loadhistory('c:/Java/myhistory.abc') #명령어 히스토리를 불러서 메모리에 적재 (.Rhistory)

save(age, file='c:/Java/myhistory.abc')#특정 객체를 파일에 저장
load('c:/Java/myhistory.abc') #파일을 작업공간으로 읽어들임
setwd('c:/Java')
dir.create('xyz') #디렉토리 생성

#sample R scripts 2
setwd('c:/Java/xyz')
options('digits') #소수점 출력 자릿수
options(digits = 2)
x <- runif(100000) #20개의 임의의 난수 생성
x

#기본적인 통계 정보 출력.
#최소/최대, 평균, 중간값 , 최빈값
#하한 사분위 값 , 상한 사분위 값
summary(x)

#히스토그램출력
hist(x)

.libPaths() #패키지 설치정보확인

installed.packages() #설치되어 있는 패키지 확인

library(help='datasets') #특정 패키지에 대한 정보.

#DATASETS 패키지의 HairEyeColor 자료를 사용하려면?
library('datasets') #특정 패키지를 메모리에 올림.
HairEyeColor

install.packages('패키지명')

update.packages()

#패키지 설치는 단 한번만 실행.
#라이브러리 적재는 매번 실행
#한편, 특정 함수를 실행할때, library명령없이 사용가능한 함수들이 있음
# -base system 패키지.

# 도움말을 열어 'introduction R'을 열어보자. 
# vcd 패키지를 설치하라. 이 패키지에서 이용가능한 함수와 데이터 집합을 살펴보라.
# 이 패키지를 적재하고 Arthritis 데이터집합을 살펴보라.
# Arthritis 데이터집합을 출력하라
help.start()
install.packages("vcd")
library("vcd")
library(help="vcd")
Arthritis
example('Arthritis')
hist()














