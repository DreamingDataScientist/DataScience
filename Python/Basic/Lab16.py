#21. 구구단
#숫자만 입력받기
#문자 - 아스키코드값 : ord()
#아스키 코드값 - 문자 : chr()

#dan = input('출력할 단을 입력하세요')

dan = input('출력할 단을 입력하세요')
if ord(dan[0]) >= ord('0') and ord(dan[0]) <= ord('9') :
    print('구구단출력')
else :
    print('숫자만입력해요')

#22 소문자를 대문자로 변환
#숫자나 대문자 입력시 오류메시지 출력
lower = input('소문자를 입력하세요')
if ord(lower[0]) <= ord('a') and ord(lower[0]) >= ord('z') :
    print('소문자만 입력가능해요')
else :
    print(lower.upper())

import random
key = int(random.randint(1,100))


while True:
    luck = input('1-100 사이 숫자 입력하세요.')
    if key==int(luck):
        print('당첨됐쪙')
        break;
    elif key < int(luck):
        print('으음 숫자가 크네용..')
    else :
        print('으음 숫자가 작으네용...')

# break continue

while True:
    msg=input('아무문자나 입력해봐')
    if msg == 'quit':
        break
    elif len(msg) <3:
        print('너무작게입력헀어')
        continue

num= input('숫자를 쓰세요');














