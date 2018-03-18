
#리스트가 주어지면 이것의 가운데에 있는 요소값을 출력
a = [1,2,6,8,4]
b = [1,2,6,8,4,10]

print(a[2])
print(b[2],b[3])

size = len(a)
mid = float(size/2)
print(mid)

# 함수를 완성해서 매개변수 list의 평균값을 return하도록 만들어 보세요.
list10 = [1,2,3,4,5,6,7,8,9,10]

def average(list10):
    for i in range(len(list10)):
        tot = list10[i]
    return tot

print('함수', average(list10))



def listcenter(list):
    size = len(list)
    mid = int(size/2)
    if size %2 ==0:
        print(list[mid-1:mid+1])
    else :
        print(list[mid:mid])