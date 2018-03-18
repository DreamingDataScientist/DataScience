setwd("D:\빅데이터\R\helloR")

#데이터를 외부로부터 가져오는 방법.
#1. 키보드로 입력 - edit(), fix()
#작은 데이터 집합을 사용해야하는 경우 유용

lildata <- data.frame(age=numeric(0),weight=numeric(0.0))
lildata <- edit(lildata)
lildata

#R의 데이터 타입 : numeric, character, logical
manager <- data.frame(id=numeric(),Date=character(),Country=character(),Gender=character(),Age=numeric(),q1=numeric(),q2=numeric(),q3=numeric(),q4=numeric(),q5=numeric())
manager <- edit(manager)
manager
mean(manager$Age)
manager[1]

#텍스트 형태로 입력 - read.table()함수를 사용
txtdata <- '
age weight
1 0.7
2 1.3
3 2.1
'
txtdata

smalldata <- read.table(header = T, text=txtdata)
smalldata

textdata <- '
manager date country gender age q1 q2 q3 q4 q5
1 10/24/14 US M 32 5 4 5 5 5
2 10/28/14 US F 45 3 5 2 5 5
3 10/01/14 UK F 25 3 5 5 5 2
4 10/12/14 UK M 39 3 3 4 NA NA
5 05/01/14 UK F 99 2 2 1 2 1
'
manager_textdata <- read.table(header = T, text=textdata)
a<-manager_textdata
a$manager

#구분된 텍스트 파일에서 데이터 읽어오기
#read.table(파일명, 옵션)
sales <- read.table("C:/Java/sales.txt", header=T)

#컬럼이름을 의미하는 헤더가 없어서 임의의 컬럼명이 자동으로 부여.
sales <- read.table("C:/Java/sales.txt", sep=',', header=F)
sales

seouldata <- read.csv("c:/Java/seoul.csv", sep=',', header=T)
head(seouldata)

medallist <- read.csv("c:/Java/medallists.csv", sep=',', header=T)
head(medallist)
show(medallist)
summary(medallist)
table(medallist)


summermedal <- read.table("c:/Java/SummerMedallists.txt", sep="\t",  header=T)
head(summermedal)
summermedal

stations <- read.csv("c:/Java/stations.csv", header=T)
head(stations)

#엑셀로 데이터 읽어오기
install.packages()

install.packages('readxl')
library('readxl')
medal <- read_excel("c:/Java/SummerMedallists.xlsx", sheet = 1)
medal

#또 다른 패키지 (xlsx)
Sys.setenv(JAVA_HOME='c:/Java/jdk1.8.0_152')
install.packages('rJava')
install.packages('xlsx')
library('xlsx')
medal_java <-read.xlsx("c:/Java/SummerMedallists.xlsx", sheetIndex = 1)
medal_java
head(medal_java)

#html,xml 파일 읽어오기
install.packages('XML')
library('XML')
library('methods')
xmldata <- xmlParse('c:/Java/emp.xml')
xmldata
xmldata2 <- xmlParse('http://www.naver.com')

#jason파일 읽어오기
install.packages('jsonlite')
library('jsonlite')
install.packages('httr')
library('httr')

jsondata <- fromJSON('https://api.github.com/users/hadley/repos')
names(jsondata)

#대용량 파일 읽어오기
library(readxl)
zip <- read.csv("c:/Java/seoul.csv", header = T)
zip2 <- read_excel("c:/Java/seoul.xlsx", sheet = 1)
zip3 <- read.table("c:/Java/seoul.csv", sep=',', stringsAsFactors=F, header=T, fill=T)
head(zip)
head(zip3)

install.packages('data.table')
library('data.table')
data.table("c:/Java/seoul.xlsx")

#fread는 head+tail임.
fread('c:/Java/seoul.csv', sep=',', header=T, stringsAsFactors=F)

#관계형 데이터베이스
#R에서는 RDBMS에서 데이터를 읽어올수 있는 다양한 환경지원
#R<-Mysql
install.packages('RMySQL')
library('RMySQL')

mysqlconn <- dbConnect(MySQL(), user='qkralswl27', password='Abcd_1234', dbname='qkralswl27', host='192.168.126.128')
dbListTables(mysqlconn)
empdata <- dbSendQuery(mysqlconn, 'select * from employees')
emp <- fetch(empdata)
emp
str(emp)
dbWriteTable(mysqlconn, '테이블명', 객체명, overwrite=T)

#R<-Oracle
Sys.setenv(JAVA_HOME='C:/Java/jdk1.8.0_152')
install.packages('DBI',dep=T)
install.packages('RJDBC', dep=T)
library('DBI')
library('RJDBC')
library('rJava')

drv <- JDBC('oracle.jdbc.OracleDriver', classPath = 'D:/빅데이터/java/JDBC/ojdbc7.jar', '')
oraconn <- dbConnect(drv, 'jdbc:oracle:thin:@192.168.126.128:1521:xe', 'hr', 'hr')

emp <- dbGetQuery(oraconn, 'select * from EMPLOYEES')
emp
dbDisconnect(oraconn)















