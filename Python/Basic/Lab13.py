#복권 발행 프로그램
import random

print('0~9 중에서 숫자 3개를 뽑아주세요.')
복권숫자1 = int(input('첫 번째 숫자를 입력해주세요.'))
복권숫자2 = int(input('두 번째 숫자를 입력해주세요.'))
복권숫자3 = int(input('세 번째 숫자를 입력해주세요.'))

복권당첨숫자1 = random.randint(0,9)
복권당첨숫자2 = random.randint(0,9)
복권당첨숫자3 = random.randint(0,9)

if (복권숫자1==복권당첨숫자1|복권숫자2!=복권당첨숫자2|복권숫자3!=복권당첨숫자3):
    print('상금 천원 지급')
elif (복권숫자1==복권당첨숫자1|복권숫자2==복권당첨숫자2|복권숫자3!=복권당첨숫자3):
    print('상금 만원 지급')
elif (복권숫자1==복권당첨숫자1|복권숫자2==복권당첨숫자2|복권숫자3==복권당첨숫자3):
    print('추카추카 상금 백만원 지급')
else:
    print('꽝!!!')

#선생님 풀이
#str의 경우에는 리스트형식으로 첫 글자, 두번째 글자 세번째글자끼리 비교가 가능하다.
# 하지만 int는 불가!!!
lotto = str(random.randint(100, 999))
lucky = input('복권번호를 입력하세요')
match = 0 #일치여부

if lucky[0] == lotto[0] or lucky[0] == lotto[1] or lucky[0] == lotto[2]:
    match = match+1
if lucky[1] == lotto[0] or lucky[1] == lotto[1] or lucky[1] == lotto[2]:
    match = match+1
if lucky[2] == lotto[0] or lucky[2] == lotto[1] or lucky[2] == lotto[2]:
    match = match+1

print(lotto, lucky, match)

if match == 3 :
    print('상금 백만원 당첨 !!!')
elif match ==2:
    print('상금 만원 당첨 !!!')
elif match ==1:
    print('상급 천원 당첨')
else :
    print('꽈아아앙')

