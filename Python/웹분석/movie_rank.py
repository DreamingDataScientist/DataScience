#-*- coding: utf-8 -*-
#영화순위
import requests
from bs4 import BeautifulSoup

movieName = []
movieGrade = []
movieRate = []

URL = 'http://ticket2.movie.daum.net/Movie/MovieRankList.aspx'
sourceCode = requests.get(URL)
plain_text=sourceCode.text

#print(plain_text)

soup = BeautifulSoup(plain_text, 'lxml')


cnt = 1
for Name in soup.select("a['class=link_g']"):
    if(cnt > 20): break
    movieName.append(Name.text.strip())
    cnt+=1
#평점
#<em class="emph_grade"> 5.5</em>
cnt = 1
for grade in soup.select("em['class=emph_grade']"):
    if(cnt > 20): break
    movieGrade.append(grade.text.strip())
    cnt+=1

#예매율
#<span class="ico_ranking ico_top1">TOP 1</span>
cnt = 1
for rate in soup.select("dd"):
    if (cnt > 20): break
    movieRate.append(rate.text.strip())
    cnt += 1

for i in range(0, 20):
    print
    print(movieName[i] + " / " + movieGrade[i]+ " / " + movieRate[i])
