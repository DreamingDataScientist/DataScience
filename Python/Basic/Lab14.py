#구구단

for i in range(1,20):
    for j in range(1,10):
        print('{}단 구구단 :'.format(i), '{}*{} ='.format(i,j), i*j)


for i in range(1, 101, 2):
    print(i)

for i in range(2, 101, 2):
    print(i)

#특정코드 단순 반복
#_ : 변수를 사용하지 않겠다. 횟수만큼 실행하겠따 라는 뜻임.
n=10
for _ in range(n):
    print('안녕하세요')

for i in [1,2,3,4,5]:
    print(i)

#while 문
#난수 생성 이용
# 맞출때까지 계속 반복
import random
guess = random.randint(1,100)
isLoop = True


while (isLoop):
    key = int(input('숫자 하나를 입력하세용'))

    if key == guess:
        print('축하합니다!!!')
        print('하지만, 상품은 없어용')
        isLoop = False #while문 실행 종료
    elif key < guess:
        print('아쉽지만 추축한 숫자는 커요')
    else :
        print('아쉽지만 추축한 숫자는 적어요')

print('프로그램이 종료되었습니다.')