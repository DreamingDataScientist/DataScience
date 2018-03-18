import pandas as pandas

a = ['What  Artisanal pizza heaven', 'What  Colorful trattoria', 'What  Brewpub and pizzeria', 'What  Drab storefront', 'What  Industrial-chic bar', 'What  Throwback storefront', 'What  Spiffy café', 'What  Low-key pizzeria', 'What  Bare-bones storefront', 'What  Two-and-a-half-star Italian restaurant', 'What  Three-star Italian restaurant', 'What  Strip-mall pizzeria', 'What  Italian superstore', 'What  Scruffy joint', 'What  The pizzeria that spawned an empire', 'What  Local chain', 'What  Suburban loft', 'What  Smart storefront', 'What  Local chain', 'What  Soho House’s pizzeria', 'What  Suburban hot spot', 'What  Stark corner storefront', 'What  Sceney restaurant', 'What  Enormous tavern', 'What  Earnest BYO', 'What  Strip-mall eatery', 'What  Rustic pizzeria', 'What  Sunny hangout', 'What  Polished charmer', 'What  Family-friendly sports bar', 'What  Cozy-chic spot', 'What  Spare storefront', 'What  Old-school legend', 'What  No-frills pizzeria', 'What  Splashy tavern', 'What  Rug-rat heaven', 'What  Roadhouse', 'What  Vintage corner tap']
c = []
print(len(a))
print(a[0].replace("What  ", ""))

#글자 split을 하여 What의 글자를 없애고 레스토랑 이름만 출력하게 합니다.
#1)replace("대체하려는 글자", "대체할 글자")
for i in range(len(a)):
    c = a[i].replace("What", "")
    print(c)

#2)split을 사용하기.
b = a[0].split('  ')[1]
print(b)

for i in range(len(a)):
    c = a[i].split('  ')[1]
    print(c)

import folium

from folium import Map
#결측치
import numpy as np
import padas as pd

#난수를 이용해서 5x3 데이터 프레임 생성
df = pandas.DataFrame(np.random.rand(5,3), columns = ['col1', 'col2', 'col3'])

print(df)

