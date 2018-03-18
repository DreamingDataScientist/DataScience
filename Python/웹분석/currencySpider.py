#-*- coding: utf-8 -*-
import scrapy
import codecs
import sys

reload(sys)
sys.setdefaultencoding('utf-8')

class CurrencySpider(scrapy.Spider):
    name = 'currencySpider'
    start_urls = ['http://info.finance.naver.com/marketindex/?tabSel=exchange']

    def parse(self, response):

        currencies = response.css('.blind::text').extract()
        values = response.css('.value::text').extract()

        with codecs.open('currencySpider.csv', 'w', 'utf-8') as f:

            for i in range(0,7):
                currency = currencies[3*i].replace('/r/n', ' ')
                currency = ''.join(currency.split())

                print(currency)

                f.write('%s\n' % (currency))
        f.close()