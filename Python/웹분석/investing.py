#-*- coding:utf-8 -*-
from bs4 import BeautifulSoup
from selenium import webdriver
import lxml

URL = 'http://kr.investing.com/currencies'

#firefox를 띄워 브라우져에 나타난 소스를 스크래핑함.
driver = webdriver.Firefox(
    executable_path=r'C:\Program Files\Mozilla Firefox\geckodriver.exe')

driver.get(URL)
source_code = driver.page_source

soup = BeautifulSoup(source_code, 'lxml')
currency = [1, 2, 3, 125, 5, 6, 7, 8, 650, 159]

for i in range(0, len(currency)):
    findkey = 'td["class=left noWrap"]'
    #print(findkey)
    for title in soup.select(findkey):
        print(title.text.strip())

    findkey = 'td["class=pid-"' + str(currency[i]) + '"-last"]'
    for title in soup.select(findkey):
        print(title.text.strip())