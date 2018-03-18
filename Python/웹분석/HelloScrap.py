#-*- coding: utf-8 -*-
#requests
#Beautifulsoup4

# 파이썬 패키지 설치 방법
# 1) 미리 설치하고 작업: pip 패키지 관리자. 2)작업중 설치 :alt + enter
#PY3에서는 BS4로 설치.
#PY2에서는 BeautifulSoup으로 설치

import requests
import bs4
import lxml

# 지정한 URL로부터 HTML 소스를 가져옴
from bs4 import BeautifulSoup

source_cod = requests.get('http://naver.co.kr')
#source_cod.encoding = 'euc-kr'
#웹 사이트에서 HTML 소스를 출력함 - 보기불편..
#print(source_cod.text)

#지정한 웹페이지 소스를 변수에 저장.
plain_text=source_cod.text

#웹 소스를 단순히 파싱
#soup = BeautifulSoup(plain_text, 'lxml')
#print(soup)
soup = BeautifulSoup(plain_text, 'lxml')
#print(soup)

for title in soup.select('title'):
    print(title.text)

for h3 in soup.select('h3'):
    print(h3.text)

for title in soup.select("h3['class=tit']"):
    print(">>>" + title.text)