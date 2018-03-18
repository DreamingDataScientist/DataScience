#-*- coding:utf-8 -*-
import requests
from bs4 import BeautifulSoup

from selenium import webdriver

# selenium 설치
# firefox용 webdriver 다운로드

movie_rank = [] #순위
movie_title = [] #제목

URL = 'http://movie.daum.net/main/new#slide-1-0'

#firefox를 띄워 브라우져에 나타난 소스를 스크래핑함.
driver = webdriver.Firefox(
    executable_path=r'C:\Program Files\Mozilla Firefox\geckodriver.exe'
)

#웹브라우져를 자동화할 수 있도록 특수하게 컴파일된 브라우져인 geckodriver.exe를 다운로드 한 후 지정한 위치에 지정.
driver.get(URL)
# source_code = requests.get(URL)
source_code = driver.page_source #firefox로 가져온 소스를 source_code변수에 저장.
#source_code = source_code.text
print(source_code)

soup = BeautifulSoup(source_code, 'html.parser') #html 파서 , xml 파서. 두개의 차이는? 그냥 html.parser쓰라고함..
#print(soup)

for i in range(1, 21):
    findkey = 'em["class=num_rank rank_' + str(i).zfill(2) +'"]'
    #print(findkey)
    for title in soup.select(findkey):
        print(title.text.strip())
        # movie_rank.append(" ".join(title.text.strip().split()))

#영화 제목 추출

    findkey = "a['class=link_txt #top #ranking #title @" + str(i) + "']"
    for title in soup.select(findkey):
        print(title.text.strip())
        # movie_title.append(title.text.strip())

