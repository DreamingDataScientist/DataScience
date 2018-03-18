#-*- coding: utf-8 -*-

import requests
from bs4 import BeautifulSoup
import codecs


# --파일 읽어 출력하기. (파이썬 2점대)--
# readline : 한줄씩 읽어옴 (추가적으로 while 필요함)
# readlines : 모든 줄을 읽어옴 (추가적으로 for문이 필요)
# read : 파일 내용 전체 읽어옴 - 바이너리 파일 처리시 사용

#1. readline.
f = codecs.open('movie_rank3.txt', 'r', 'utf-8')
while True :
    line = f.readline()
    if not line: break
    print(line)
f.close()

#2. readlines - 배열형태로 나옴. 추천
f = codecs.open('movie_rank3.txt', 'r', 'utf-8')
lines = f.readlines()
for line in lines:
    print(line)
f.close()

#3.read
f = codecs.open('movie_rank3.txt', 'r', 'utf-8')
data = f.read()
print(data)
f.close()

# --파일 읽어 출력하기. (파이썬 3점대)--
# 1. readline
f = codecs.open('movie_rank3.txt', 'r', encoding='utf-8')
while True :
    line = f.readline()
    if not line: break
    print(line)
f.close()

#2. readlines - 배열형태로 나옴. 추천
f = codecs.open('movie_rank3.txt', 'r', encoding='utf-8')
lines = f.readlines()
for line in lines:
    print(line)
f.close()

#3.read
f = codecs.open('movie_rank3.txt', 'r', encoding='utf-8')
data = f.read()
print(data)
f.close()

# with ~as 구문으로 파일 다루기
#파일 작업시 파일을 열고 닫는 것은 번거로운 일임
#파이썬이 알아서 닫아주면 어떨까? - 편리함
with codecs.open('movie_rank3.txt', 'r', 'utf-8') as f:
    data = f.read()
    print(data)

#파일 읽기/쓰기 모드
#r : read (읽기), w : write (쓰기)
#t : text (텍스트파일), b : binary (바이너리파일), a : append(추가), + : upadate (수정)
#파일모드의 기본값은 : rt

import numpy

import scipy

import matplotlib
import pandas

