#-*- coding: utf-8 -*-
#from scrapy import cmdline

#scrapy를 윈도우 상에서 구동하려면 pycharm 환경에서 cmdline.execute()메서드를 이용하면 된다.
# 먼저 pycharm 환경에 scrapy가 설치되어 있어야 함.
# 단 추가 설치해야 하는 패키지는 pypiwind32다

cmdline.execute(
    "scrapy runspider currencySpider.py".split()
)

