

#18. 사용자가 연봉과 결혼 여부를 입력하면 다음의 세금율에 의해 납부해야 할 세금을 계산하는 프로그램을 작성하세요.

marry = input("결혼하셨습니까? 하셨다면 yes를 미혼이라면 no를 입력해주세요.")
salary = int(input("연봉은 어떻게 되시나요?"))

if marry == 'no':
    print('미혼이시군요...흠 그렇다면...')
    if salary < 3000:
       tax = float(0.1)
       salary_tax = int(salary*tax)
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


