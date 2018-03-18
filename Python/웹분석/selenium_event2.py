# -*- coding: utf-8 -*-

from bs4 import BeautifulSoup
from selenium import webdriver

#탐색할 URL 정의
URL = 'https://kr.investing.com/currencies/'

#웹 브라우저 자동화를 위해 드라이버 초기화
driver = webdriver.Firefox( executable_path =
    r'C:\Program Files\Mozilla Firefox\geckodriver.exe' )

#브라우져를 지정한 URL로 이동시킴
driver.get(URL)

#웹 페이지 오른쪽 '암호화폐'탭의 xpath 정의
alink = driver.find_element_by_xpath("//li[@id='QBS_7']/a")

#마우스, 단축키 이벤트 처리를 위해 ActionChains 초기화
mouse = webdriver.ActionChains(driver)

#해당 링크를 마우스클릭으로 처리하기 위해 move_to_element 사용
#즉, 마우스를 링크로 이동한 다음 클릭
mouse.move_to_element(alink).click().perform()

#클릭 후 보여지는 페이지 내용을 source_code 에 저장 후 출력
source_code = driver.page_source
print(source_code)

#웹 페이지 내용을 parsing 하기 위해 bs4로 초기화
soup = BeautifulSoup(source_code, 'html.parser')

#암호화폐 종류 (data-gae="-btc-usd")


#암호화폐 환율 (id="sb_last_945629")
