#성적처리
#성적 처리지표 :ABCDF
#성과 이름을 분리.
#성적 데이터를 표준화 시킴 :scale
#이웃분류 knn, 벡터지원svm, 식녕망 등
#많은 분류 알고리즘에 유용하게 사용
#변수값을 적당한 수준으로 조정 : 0~1 / -1~1
#조정된 값을 평균과 표준편차로 다시 재계산
options(digits=2) #소수점 2자리
roster
summary(roster[2:4])
scale(roster[2:4]) #scale()함수는 표준정규화를 알 수 있게 함.
newdata <- scale(roster[,2:4])
newdata
summary(newdata)

#apply함수 이용
#특정연산을 손쉽게 처리하게 해주는 함수
newdata<- roster[2:4]
mean_score <- apply(newdata, 1, mean)

#구해진 평균점수를 roster 테이블에 열로 추가
roster <- cbind(roster, mean_score)
roster
roster[,6] <- NULL

#학점계산 - 사분위수
#quantile() - 집단에서 측정된 수치의 특성을 표현
#분위수 - 확률적으로 균등하게 영역을 나눠 계산한 수

y <- quantile(roster$mean_score, c(.8, .6, .4, .2))
y
roster
attach(roster)

roster$grade[roster$mean_score >= y[1]] <- 'A' #상위 80프로 속하는 사람들 : 자신의 점수가 0.77이상
roster$grade[roster$mean_score < y[1] & roster$mean_score>= y[2]] <- 'B'
roster$grade[roster$mean_score < y[2] & roster$mean_score>= y[3]] <- 'C'
roster$grade[roster$mean_score < y[3] & roster$mean_score>= y[4]] <- 'D'
roster$grade[roster$mean_score < y[4]] <- 'F'

roster

#이름에서 성과 이름 분리 : strplit
strsplit(roster$Student, '') #글자 한자씩 분리 sep=''
strsplit(roster$Student, ' ') #스페이스 하나(공백)으로 분리 sep=' '

name <- c('a 1', 'b 2')
names <- strsplit(name, ' ')
names
name
names[[1]][1]
names[[1]][2]
apply(names, 1, '[')
#names에 있는 모든 원소에 대해 행단위로 원소추출함수 ([)적용
#1은 첫번째 원소 목록 출력
sapply(names, '[')  
#sapply는 매트릭스나 배열의 경우 반환값을 그대로 적용하여 반환을 하게 된다.
#roster$Student의 경우 입력할 때 edit()으로 했기 때문에 벡터가 아닌 factor로 들어가게 되었다. 그래서 char이 안됨.
#char로 바꾸기 위한 아래 함수를 사용. class()를 사용하게 되면 알 수 있다.
as.character()
roster$Student <- sapply(roster$Student,as.character)  #sapply가 더 반환값이 정확하게 나옴
roster$Student <- apply(roster$Student,1,as.character) #apply를 반환한 값이 매트릭스나 배열에 못맞춤. 그냥 벡터로 나옴

class(roster$Student)
names <- strsplit(roster$Student, " ")
lname <- sapply(names, '[', 1)
fname <- sapply(names, '[', 2)

roster<-cbind(fname, lname, roster)
roster

#이름과 성을 각각 열로 추가하고, 기존 데이터프레임에서 첫번째 열을 제외한뒤
#나머지를 여기에 각각 열로  추가한다.

roster <- roster[order(lname, fname),]
