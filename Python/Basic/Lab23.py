list=[1,2,3,4,5,6,7,8,9,10]

def average(list):
    # 함수를 완성해서 매개변수 list의 평균값을 return하도록 만들어 보세요.
    sum = 0
    for tot in range(len(list)):
        sum += tot

    return sum/len(list)

print(average(list))
#total = 0
# 1~50까지의 합
#for n in range(1, 51):
#    total += n
#    print(total)