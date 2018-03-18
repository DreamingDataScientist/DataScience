#파이썬 자료구조
#리스트 : sequence 자료구조를 사용
#sequence : 순서가 있는 데이터 구조를 의미
#리스트, 튜플, 레인지, 문자열 등이 sequence 구조 사용.
#리스트는 []를 이용해서 각 요소에 접근할 수 있당.

msg = 'Hello, World!'

#파이썬에서는 자료구조를 의미하는 접미사를 변수명에서 사용하기도 한다.
list1_list = []
list2_list = [1,2,3,4,5]
list3_list = ['a', 'b', 'c', 'd', 'e', 1,2,3,True]
list4 = {'one' : 1,
         'two' : 2,
         'three' : 3}


print(1 in list2_list)
print(1 not in list2_list)
print(len(list3_list))

print(list2_list + list3_list)
print(list2_list * 2)

print(msg[4], msg[9])
print(list2_list[2])
print(list3_list[3])

#요소 변경
list2_list[2] = -3
print(list2_list)

#주민코드에서 성별 여부 판별
jumin = [1,2,3,4,5,6,1,2,3,4,5,6,7]
askJumin = input('주민번호 입력')
if askJumin[6] == '1':
    print('남자입니다.')
elif askJumin[6] =='2':
    print('여자입니다.')


for i in range(0, 6):
    print(askJumin[i], end='') #줄바꿈없이 출력시 정결문자를 지정!

#특정범위내 요소들을 추출할 때는 슬라이스를 사용[i:j:step]
print()
print(jumin[0:6]) # 생년월일
print(jumin[:6])
print(jumin[6:]) #생년월일을 제외한 나머지 부분
print(jumin[:]) #몽땅

print(jumin[0:6:2])
print(jumin[::-1]) #역순출력
#리스트관련 통계함수
print(sum(list2_list))



# print(jumin[0:100:2]) #인덱스 초과 - 오류
# print(jumin[100])#인덱스 초과 - 오


print(min(list2_list))
print(max(list2_list))








