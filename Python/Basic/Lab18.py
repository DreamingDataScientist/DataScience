# 이름 짓기
# 파스칼표기법 : 첫 단어를 대문자로 시작하여 이름을 지음. Employees, Departments, RegisterEmployee...
# 카멜표기법 : 첫단어를 소문자로 시작하며 이름을 지음. registerEmployee, joinMember...
# 스네이크 표기법 : 소문자와 _ 기호를 이용해서 이름을 지음. register_employee, join_member... @변수선언할때@
# 헝가리언 표기법 : 자료형을 의미하는 접두사를 이용해서 이름을 지음. strName, isMarried, booleanMarried...

#함수로 재작성하기


#8 자취방 구하기
def compareRoom(width, height, price):
    return float(width*height/price)

roomA = compareRoom(2.5,3,27)
roomB = compareRoom(4,2,30)

if(roomA > roomB):
    print('방A가 더 좋아요')
else:
    print('방 B가 더 좋아요')

#10
def computeProfit():
    c=int(input('불변자본을 입력하세요')) #constant capital
    v=int(input('가변자본을 입력하세요')) #variable capital
    s=int(input('잉여자본을 입력하세요')) #surplus capital

    return (c+v) /s

print(computeProfit())

#11
exchange = 0
def getExchangeRate(country):
   if country == 'us':
       return 1010
   elif country =='euro':
       return 1400

buyUS = 780*getExchangeRate('us')
buyEuro = 650*getExchangeRate('euro')

if buyUS > buyEuro:
    print('유로화로 구입하는게 더 싸용')
else:
    print('달라로 구입하는게 더 싸용')

#12
import math
def howManyRun(radius):
    return math.pi*radius

studentA = howManyRun(100)
studentB = howManyRun(90)

print('학생 A는 학생 B보다 {:1.1f}m 만큼 더 뛰었다.'.format(studentA-studentB))

#17. 계산기 (제곱연산 추가)
def intCalu():
    num1 = int(input('좌변값을 하나 입력해주세요'))
    num2 = int(input('우변값을 하나 입력해주세요'))
    fmt = "%d + %d = %d\n %d -%d = %d\n"
    fmt += "%d * %d = %d\n %d / %d = %.5f\n"
    fmt += "%d ** %d = %d"
    print(fmt % (num1, num2, num1 + num2, \
                 num1, num2, num1 - num2, \
                 num1, num2, num1 * num2, \
                 num1, num2, num1 / num2, \
                 num1, num2, num1 ** num2))

intCalu()

#18. 세금계산
def computeTax():
    marry = input("결혼하셨습니까? 하셨다면 yes를 미혼이라면 no를 입력해주세요.")
    salary = int(input("연봉은 어떻게 되시나요?"))

    if marry == 'no':
        print('미혼이시군요...흠 그렇다면...')
        if salary < 3000:
            tax = float(0.1)
            salary_tax = int(salary * tax)
            print('당신의 세금납부의 금액은', salary_tax, '만원 입니다.')
        else:
            tax = float(0.25)
            salary_tax = int(salary * tax)
            print('당신의 세금납부의 금액은', salary_tax, '만원 입니다.')


    elif marry == 'yes':
        print('결혼하셨군요...흠 그렇다면...')
        if int(salary) < 6000:
            tax = float(0.1)
            salary_tax = int(salary * tax)
            print('당신의 세금납부의 금액은', salary_tax, '만원 입니다.')
        else:
            tax = float(0.25)
            salary_tax = int(salary * tax)
            print('당신의 세금납부의 금액은', salary_tax, '만원 입니다.')

computeTax()

def isLeapYear():
    year = int(input('올해는 몇년도 입니까?'))
    yun = '윤년입니다.'
    noyun = '윤년이 아닙니다.'

    if (year % 4 == 0 and year % 100 != 0) or year % 400 == 0:
        print(yun)
    else:
        print(noyun)

isLeapYear()
import random

#20 복권당첨
def rolletLotto():
    lotto = str(random.randint(100, 999))
    lucky = input('복권번호를 입력하세요')
    match = 0  # 일치여부

    if lucky[0] == lotto[0] or lucky[0] == lotto[1] or lucky[0] == lotto[2]:
        match = match + 1
    if lucky[1] == lotto[0] or lucky[1] == lotto[1] or lucky[1] == lotto[2]:
        match = match + 1
    if lucky[2] == lotto[0] or lucky[2] == lotto[1] or lucky[2] == lotto[2]:
        match = match + 1

    print(lotto, lucky, match)

    if match == 3:
        print('상금 백만원 당첨 !!!')
    elif match == 2:
        print('상금 만원 당첨 !!!')
    elif match == 1:
        print('상급 천원 당첨')
    else:
        print('꽈아아앙')

rolletLotto()
