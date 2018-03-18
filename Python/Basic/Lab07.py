#12. 운동장 원형의 지름이 100m
# 안쪽 선수는 5m 안쪽에서 달린다.
# 바깥쪽 선수가 안쪽 선수보다 몇 미터 더 달려야 하나?

pi = 3.14
radius = 100
groundlen = radius*pi

radius2 = 90
groundlen2 = radius2*pi

answer = groundlen - groundlen2

print(answer)

#16. 증감연산자가 파이썬에도 있나?
#파이썬에서는 기본적으로는 ++, --는 지원하지 않는다.
n = 3
print(++n)
n+=1
print(n)
