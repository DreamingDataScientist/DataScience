# 변수 - 알파벳, 숫자, _, . 으로 구성
# 첫 글자는 문자나 . 으로 시작할 것.
a <- 0
b1 <- 2
.x <- 3
.x 
#3c <- 4
#.4 <- 5
#변수할당 <-(추천!), <<-, =

#변수만 입력하면 값을 출력
a
b1
.x

#데이터집합 : 행(관측값,레코드,사례), 열(변수, 필드, 속성)로 이루어진 2차원 배열
#R에서 데이터를 생성하려면 스칼라, 벡터, 배열, 데이터프레임, 리스트등의 다양한 자료구조를 사용
#R에서 다룰수 있는 데이터의 유형은 숫자,문자,논리,복소수 등이 있다.

#벡터 : 숫자,문자,논리형 데이터들로 구성된 1차원 배열
#스칼라 : 요소가 하나만 존재하는 벡터
#벡터안의 자료는 반드시 단일 유형이어야 함.

a <- 3
b <- 4.5
c <- a+b
c
d<-'hello world'
e<-c(1,2,3,4,5,-9,-8,-7,-6)
e
f<-c('one', 'two', 'three', '가', '나', '다')
f
g<-c(TRUE, FALSE, T,F)
g
h<-c("9", 8, "7")
h
i<-c(1,"2",3)
i
j<-c(9,8,7,c(1,2,3)) #벡터를 중첩으로 저장한다면?
j
k<-1:10 #숫자 데이터형의 경우 '시작값:끝값'형태로 값 생성 가능
k
l<-seq(1,10) #seq(시작, 끝, 간격) 함수
l
m<-seq(1,10,2)
m
n<-rep(1:2,3) #rep(값,반복) 함수
o<-rep(1:2, each=5)
n
o
e
e[3] #[]를 이용해서 벡터/스칼라의 요소를 출력. 3추가
e[-3] #위치값이 음수라면??? 3 삭제
e[c(1,5,7)] #무작위 위치값을 벡터에 저장해서 검색
e[2:6]

#patioent dataset
PatientID<-c(1,2,3,4)
AdmDate <- c(as.Date("2014-10-15"),as.Date("2014-01-11"),as.Date("2014-10-21"),as.Date("2014-10-28"))
Age<-c(25,34,28,52)
Diabetes<-c("Type1", "Type2", "Type1", "Type1")
Status <- c("Poor", "Improved", "Excellent","Poor")
PatientID
AdmDate
Age
Diabetes
Status

?seq
?rep

seq(0,1, by=0.01)
seq(0,1, length.out=1002)

rep(1:10, each=3)
rep(1:10, time=3)

length(m)

#비교연산자
#데이터에 갑이 존재하지 않을 경우 NA로 설치
ex<-c(1,3,5,7,9, NA)
ans<-ex<5
ans

#산술연산자 : +,-,*,/,%
ex
ex - 5
#나머지 구하기
ex %% 5 
#정수 나누기 (나머지 버림)
ex%/%5


#논리연산자 &, |, !, &&, ||
#1) 벡터의 각 원소간 연산처리
c(T,T) & c(F,T) 
#2)단일 논리값을 계산 (단축식 평가지원)
c(T,F) && c(F,T)

ex
ex[1]
is.na(ex[6])

x<- NULL #변수를 선언할 뿐 초기화하지 않는 경우 NULL사용
is.null(x)
is.null(1)
is.null(NA)

#matrix = 벡터의 2차원 배열. 동일한 유형의 원소들로 구성.
#1행은 숫자, 2행은 문자 같은 구성 불가
#matrix(벡터, nrow=숫자, ncol=숫자)
a<-matrix(c(1,2,3,4,5,6,7,8,9,10,11,12), nrow=2)
b<-matrix(1:12, ncol=2)
c<-matrix(1:20,nrow=5,ncol=4)

cells <-c(1,35,67,99)
rnames<-c('r1', 'r2')
cnames<-c('c1','c2')
d<-matrix(cells,nrow=2,ncol=2,byrow=F,dimnames=list(rnames,cnames))
d
d<-matrix(cells,nrow=2,ncol=2,byrow=T,dimnames=list(rnames,cnames))

#행렬의 각 요소는 '행렬이름[행,열]'로 접근 가능
#imnames()으로 행과 이름에 이름을 부여했다면 그 이름을 접근 가능
d
d['r1',] #1행만 출력
d['r2',] #2행만 출력
d[,'c1'] #1열만 출력
d[,'c2'] #2열만 출력
d
d[2,]#두번째 행 출력
d[,2]#두번째 열 출력
d[2,2]#2행에 2열 출력

dim(d) #행렬의 전체 차원 출력
ncol(d)
nrow(d)
d
solve(d) #역행렬
t(d)     #전치행렬

#array : n차원 행
#array(벡터, 차원, 행열이름)

#(2 x 3 x 4)3차원 행렬 생성
dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4", "C5")
z<-array(1:25,c(2,3,5),dimnames=list(dim1,dim2,dim3))
z
z[1,1,1]
z[1,2,3]
z[,,3]
z[,,4]
dim(z)

#데이터 프레임 dataframe : 열마다 서로 다른 유형을 가질 수 있는 자료구조
#다양한 변수, 관측치, 범주(벡터)를 표현하기 위한 자료구조
#data, frame(열1,열2,열3)

x<-c(1,2,3,4,5)
y<-c('a','b','c','d','e')
z<-c(T,F,T,T,T)
s<-data.frame(x,y,z) #첫 번째 열은 x, 두 번째는 y, 세 번째는 z.

#작업공간에 생성된 객체의 구조 확인.
str(s)
s

#<데이터프레임이름$열이름> 형식으로 접근 가능
s$x
s[1,]
s[,c('x','y')]
s[,c('x')]
s[,c('x'),drop=F] #자동으로 벡터로 변화하는 것을 방지 하려면 drop=F 사

x <-data.frame(x=1:1000)
head(x) #데이터의 앞부분을 살펴봄
tail(x) #데이터의 뒷부분을 살펴봄.

g <- "My First List"
h <- c(25,26,18,93)
j <- matrix(1:10,nrow=5)
k<-c('one','two','three')
mylist<-list(title=g,ages=h,j,k)
mylist

mylist[[2]]
mylist[2] #번지를 알려줌 - 딕셔너리값
mylist[1]
mylist[[1]] #키값.
mylist[['ages']]
mylist$ages
mylist[3]
mylist[[3]]

#patioent dataset
PatientID<-c(1,2,3,4)
AdmDate <- c(as.Date("2014-10-15"),as.Date("2014-01-11"),as.Date("2014-10-21"),as.Date("2014-10-28"))
Age<-c(25,34,28,52)
Diabetes<-c("Type1", "Type2", "Type1", "Type1")
Status <- c("Poor", "Improved", "Excellent","Poor")
patientdata <-data.frame(PatientID,AdmDate,Age,Diabetes,Status)
patientdata

str(patientdata) #데이터 객체의 속성을 알 수 있음.
patientdata[1:2] #1~2속성 출력
patientdata[c('Diabetes','Status')] #속성명으로 출력 가능
patientdata$PatientID
patientdata$AdmDate
patientdata$Age
patientdata$Diabetes

#위 사례처럼 모든 변수 앞에 patientdata$를 사용하여 특정 속성을 
#출력하는 것은 불편
#attach() / detach() / with() 사용해서 해결 가능
#attach : 특정 데이터프레임 명을 검색경로에 추가
#detach : 특정 데이터프레임 명을 검색경로에 제거

attach(patientdata)
  PatientID
  Age
  Diabetes
  Status
detach(patientdata)

#with(객체명, {속성명})
with(patientdata, {Age})
with(patientdata, {
  print(Age)
  print(Status)
})

#list - 하나의 이름 아래 다양한 객체들을 모아놓은 것
#키, 값 형태로 데이터를 담아 두는 연관 배열의 일종
#list(이름1=객체1, 이름2=객체2, 이름3=객체3, ...)

#단일 값을 list로 넣음
sj1 <- list(name='혜교', kor=99, eng=98, mat=87)
sj1
#벡터를 list로 넣음
sja1 <- list(name='혜교', subjects=c(99,98,97))
sja1
#리스트 자신을 리스트의 원소로 구성.
mixed <- list(a=sj1,b=sja1)
mixed

sj1
sj1[1]
sj1[[1]]
sja1
sja1[[2]]
sja1[['subjects']][2]
sja1$'subjects'[2]

#혜교의 영어점수 출력
mixed
mixed$b$subjects[2]
mixed$b[['subjects']][2]

#sample R scripts 3
mtcars
help(mtcars)
summary(mtcars)

#mpg(연료소비율)에 대한 기본통계정보 summary출력
summary(mtcars$mpg)
#연료소비율과 배기량의 관계
plot(mtcars$mpg, mtcars$disp)
#연료소비율과 차량무게의 관계
plot(mtcars$mpg, mtcars$wt)
head(mtcars)

attach(mtcars)
mpg
plot(mpg,disp)
plot(mpg,wt)
detach(mtcars)

#factor
#: 벡터자료구조에 추가정보가 더해진 것
#: 카테고리 자료형을 만들어 데이터에 의미를 부여할때 사용

a <- 1:3
a
factor(a, levels=c(1,3,5)) #1,3만 카테고리에 포함
factor(a, levels=c(1,3,5), labels=c('일', '삼', '오'))

#설문지 답변을 factor로 정의
# 답변 1: 아주 안좋음
# 답변 2: 그럭저럭
# 답변 3: 보통
# 답변 4: 좋음
# 답변 5: 아주 좋음

q <- c(5,4,5,5,5)
levels_q <- c(1,2,3,4,5)
labels_q <- c('아주 안좋음','그럭저럭','보통','좋음', '아주좋음')
factor(q, levels=levels_q, labels = labels_q)
































