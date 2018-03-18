#모듈 사용하기.
#프로그램을 구성하는 독립적인 단위(함수/클래스)를 각각 정의하고 관리하는 방법
#자주 사용하는 일반적인 기능은 모듈로 한번 만들어 두면
# 필요할 때 마다 도입해서 활용할 수 있따.
# 모듈을 사용하려면 import명령으로 인터프리터


#import pandas as pd
#
#data = {'state' : ['ohio', 'nevada','california'],
#        'year' : [2000, 2001, 2002],
#        'pop' : [1.7, 2.9, 3.1]}
#
#frame = pd.DataFrame(data)
#
#print(frame)

# 모듈을 호출할때는 모듈명(파일이름).함수명
#from math import * =>비추!!!
from math import pi,sqrt #쓰기는 불편하지만 추천!!!
import random
from builtins import print

print(random.randint(1,10))
print(pi)
print(sqrt(9))

