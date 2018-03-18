from mj import Lab_minji

Lab_minji.isLeapYear()
Lab_minji.intCalu()
Lab_minji.rolletLotto()

#한편, python IDE나 다른 프로젝트에서 모듈을 참조하려면 pathonPath 가 정의한 위치에 모듈을 저장해 둔다.
#파이썬설치위치나 '파이썬설치위치/lib'
#다수의 개발자가 만든 모듈의 이름이 서로 같을 경우 파이썬에서는 패키지라는 개념이 있다.
#.연산자를 이용해서 모듈을 계층적(디렉토리)으로 관리
#파이썬에서 디렉토리가 패키지로 인식되려면은 --init--이있어야함

from mj.Hello import sayHello

sayHello()
