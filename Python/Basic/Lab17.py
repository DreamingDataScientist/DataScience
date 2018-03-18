#함수공부

def sayHello():
    print('sayHello')

sayHello()

def sayHello2(msg):
    print('hello~',msg)

sayHello2('msg')

def calplus(x, y) :
    calplus(1,7)
    print(x + y)

print(round(3.15, 1))


#가변 매개변수. 매개변수 두개 꼭 다안써도 괜찮음
def calplus3 (x=0, y=0):
    return x+y;

calplus3(1,4)
calplus3(1)
calplus3()

#매겨변수 명확하게 x와 y 두개 다 있어야함.
def calplus3 (x, y):
    print(x+y)

def myfunc(param):
    param = '함수안에서 생성'
    #함수내 지역변수는 함수 안에서만 사용가능
    #함수 밖에서 선언된 변수는 전역변수.
    #따라서, 지역변수와 이름만 다르다면 어느 함수에서건 사용가능.
    print(param)

param = '함수밖에서 생성'
print(param)

myfunc(param)


def myfunc2():
    global param # 함수내에서 전역변수 호출
    param = '함수에서 전역변수 수정'
    print(param)

#함수내에서 전역변수 사용하기. 함수내에서 실행한 결과값을 외부로 전달해야 할 필요가 있을 때 사용.


def count():
    global times
    times += 1
    print(times)
times = 0
count()






