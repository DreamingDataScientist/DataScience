#-*- coding: utf-8 -*-

import requests
from bs4 import BeautifulSoup
import codecs
# musicName = []
#
# #음악차트
# URL = 'http://www.melon.com/chart/month/index.htm#params%5Bidx%5D=1&params%5BrankMonth%5D=' \
#       '201708&params%5BisFirstDate%5D=false&params%5BisLastDate%5D=false'
# sourceCode = requests.get(URL)
# plainText = sourceCode.text
# soup = BeautifulSoup(plainText, 'lxml')
#
# #음악제목
# #<input title="좋니 곡 선택" class="input_check " name="input_check" value="30486509" type="checkbox">
# cnt = 1
# for Name in soup.select("div['class=wrap_song_info']"):
#     if (cnt > 20): break
#     musicName.append(Name.text.strip())
#     cnt += 1
#
# for i in range(0, 20):
#     print(musicName[i])

movie_rank = [] #순위
movie_title = [] #제목
movie_grade = [] #평점
movie_release = [] #개봉일

URL = 'http://ticket2.movie.daum.net/Movie/MovieRankList.aspx'
source_code = requests.get(URL)
plain_text = source_code.text

soup = BeautifulSoup(plain_text, 'html.parser') #html 파서 , xml 파서. 두개의 차이는? 그냥 html.parser쓰라고함..
#print(soup)

for i in range(1, 21):
    findkey = 'span["class=ico_ranking ico_top' + str(i) +'"]'
    for title in soup.select(findkey):
         #print(title.text.strip())
        movie_rank.append(" ".join(title.text.strip().split()))

#영화 제목 추출
findkey = "a['class=link_g']"
for title in soup.select(findkey):
    #print(title.text.strip())
    movie_title.append(title.text.strip())

#평점 추출
findkey = "em['class=emph_grade']"
for title in soup.select(findkey):
    #print(title.text.strip())
    movie_grade.append(title.text.strip())

#개봉일 추출!!! class 내에 여러가지 태그가 있더라도 select를 통해서 배열로 인해 빼내오면 된다용!!
findkey = "dl['class=list_state']"
for title in soup.select(findkey):
    #print(title.text.strip())
    #print(title.select('dd')[1].text)
    movie_release.append(title.select('dd')[0].text)

#모든 내용 출력
for i in range(0, 20):
    print(movie_rank[i])
    print(movie_title[i])
    print(movie_grade[i])
    print("%s\n" % (movie_release[i]))

    # --파일 저장하기--
fmt = '%s, %s, %s, %s \n' #출력형식 정의

#f = open('movie_rank2.txt', 'w') #파일을 쓰기모드로 open
#for i in range(0, 20):
   # rank = fmt % (movie_rank[i], movie_title[i], movie_grade[i], movie_release[i])
    #f.write(rank) : 유니코드 저장시 오류발생!!!!! 한글 인식못함..ㅠㅠㅠㅠ 아놔 .. codecs 추천!
    #파이썬 2는 기본적으로 모든 문자를 ascii로 처리합니다...
    #파일에 기록시 먼저 ascii로 디코딩하기 때문에 오류발생!!!
#f.write('hello, python!!\n') #파일에 내용쓰기
#f.write('안녕하세요, 파이썬!!\n')
#f.close()   #파일 작업 종료(필수!)

f = codecs.open('movie_rank2a.txt','w','utf-8')
for i in range(0, 20):
    rank = fmt % (movie_rank[i], movie_title[i], movie_grade[i], movie_release[i])
    f.write(rank)
f.close()


# --파일 저장하기 (파이썬 3점대)--
#예외 처리 - 왜냐면 여기에서 오류를 잘 안보여줌.
try :
    f = open('movie_rank3.txt', 'w', encoding='utf-8')
    for i in range(0, 20):
        rank = fmt % (movie_rank[i], movie_title[i], movie_grade[i], movie_release[i])
        f.write(rank)
    f.close()
except Exception as ex :
    print(ex)

# --파일 읽어 출력하기. (파이썬 3점대)--
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
