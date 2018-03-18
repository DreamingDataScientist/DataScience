# 윤년여부 코딩

year = int(input('올해는 몇년도 입니까?'))
yun = '윤년입니다.'
noyun = '윤년이 아닙니다.'


if (year%4==0 and year%100!=0) or year%400==0:
    print(yun)
else :
    print(noyun)

total = 0
#1~50까지의 합
for n in range(1,51):
    total += n
    print(total)

# 1~100사이의 짝수 출력
for n in range(1,51):
    n+=n
    print(n)

# 1~100사이의 홀수 출력
for n in range(0,101):
    if(n%2 != 0):
        print(n)