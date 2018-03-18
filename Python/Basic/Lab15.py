# while : 조건을 만족할 때까지 반복
#40. 어떤 상점에서는 상품을 한꺼번에 많이 구매하면 다음과 같이 상품 가격을 할인해 준다.
buy = int(input("몇개 구매하셨나요?"))

if buy<10:
    cost = buy*100
elif buy >=10 and buy<30:
    cost = buy*95
elif buy >=30 and buy<100:
    cost = buy*90
else :
    cost = buy*85

print('총 구매한 수는 {}이며 가격은 {}원 입니다.'.format(buy, cost))

#41. 사용자로부터 키와 몸무게를 입력받아 비만 정도를 알려주는 프로그램을 작성.
키 = float(input("키를 입력하세용(m)"))
몸무게 = int(input("몸무게를 입력하세용(kg)"))

체질량지수 = float(몸무게 / (키*키))
if 체질량지수 < 18.5:
    결과='저체중'
elif 체질량지수 >= 18.5 and 체질량지수 <23 :
    결과 = '정상'
elif 체질량지수 >=23 and 체질량지수 <25 :
    결과 = '과체중'
else :
    결과 = '비만'

print('결과는 {}입니다.'.format(결과))