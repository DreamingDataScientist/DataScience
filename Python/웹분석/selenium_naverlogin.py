#-*- encoding: utf-8 -*-
from bs4 import BeautifulSoup
from selenium import webdriver
import time

#탐색할 URL 정의
URL = 'https://www.naver.com'

#웹 브라우저 자동화를 위해 웹 드라이버 초기화
#driver = webdriver.Firefox(executable_path = 'C:\Program Files\Mozilla Firefox\geckodriver.exe')
driver = webdriver.Chrome(executable_path = 'C:\Program Files (x86)\Google\Chrome\Application\chromedriver.exe')
driver.get(URL)

#로그인창에 아이디/비번 입력후 로그인 버튼 클릭
#html요소 중 id가 id인 요소를 찾음
userid = driver.find_element_by_id('id')

# @id=id인 요소에 아이디를 입력.
userid.send_keys('qkralswl027')

#html요소 중 id가 pw인 요소를 찾음
passwd = driver.find_element_by_id('pw')

# @id=pw인 요소에 비밀번호를 입력.
passwd.send_keys('alswl258')

#로그인버튼을 찾아 클릭
loginbtn = driver.find_element_by_xpath('//input[@title="로그인"]')
loginbtn.submit()

#처리속도가 빨라서 로그인완료 페이지가 뜨기전에
#메일 페이지로 이동하려고 함 - 메일페이지가 제대로 안뜸. 따라서 로그인완료페이지가 뜨는걸 확인하기 위해
#일정시간동안 브라우져를 잠시 대기시킴.
#driver.implicitly_wait(3)
time.sleep(3)

#메일 페이지로 이동
MailURL = 'http://mail.naver.com/?n=1518060075261&v=f'
driver.get(MailURL)
source_code = driver.page_source
soup = BeautifulSoup(source_code, 'lxml')

#안 읽은 메일(span[class=cnt])
findkey = 'span["id=headUnreadNum"]'
for title in soup.select(findkey):
    print(title.text)

#로그아웃버튼 클릭 - 로그아웃 처리
# time.sleep(3)
#
# mouse = webdriver.ActionChains(driver)
# logoutbtn = driver.find_element_by_xpath("//span[@id='gnb_name1']")
# mouse.move_to_element(logoutbtn).click().perform()

time.sleep(3)
driver.get('https://nid.naver.com/nidlogin.logout?returl=http://mail.naver.com/login')

time.sleep(3)
driver.get('http://naver.com')

search = driver.find_element_by_id('query')

# @id=id인 요소에 아이디를 입력.
userid.send_keys('qkralswl027')
