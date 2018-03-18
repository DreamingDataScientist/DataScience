
##튜플##
#리스트 자료구조와유사하지만 한번 입력한 자료는 변경불가.
#즉, 요소 추가는 가능 / 수정,삭제는 불가.
#튜플은 ()를 이용.
#튜플 생성시 단일 요소는 요소 뒤에 ,를 추가


days = ('일', '월', '화', '수', '목', '금', '토')
print(days)

t = [1,1,1,1]
print(t)
t=(1,1,1,1)
print(t)
t={1,1,1,1}
print(t)
t=[1,1,1,3,5,6,7,3,3,2,5,7,8,9]
print(t)
#리스트를 집합으로 변환.
t=set(t) #set은 하나의 집합으로 만들어주는 함수. 중복 불가.
print(t)

#집합set
#저장된 데이터를 순서에 따라 관리 하지 않고
#중복을 허용하지 않는(unique) 자료구조.
#집합은 {}을 이용
#집합의 개념에 따라 합/교/차집합등의 연산이 지원.

#1월 중 교육받는 날을 집합으로 정의
#중복되지 않는 데이터는 집합으로 만들어주면 됨.
edu= {1,2,3,4,5,8,9,10,11,12,15,16,17,18,19,20}

#동물
동물 = {'사자', '늑대', '호랑이', '얼룩말'}
육상동물 = {'치타', '강아지'}
해상동물 = {'고래', '물개'}
조류 = {'독수리', '학'}
print(len(동물))
print('치타' in 육상동물)
# print(동물[2])

print(육상동물.union(해상동물)) #합집합
print(육상동물 | 해상동물) #합집합
새로운동물 = 육상동물 | 해상동물

print(새로운동물.intersection(육상동물))#교집합
print(새로운동물.intersection(해상동물))#교집합
print(새로운동물&해상동물)#교집합

# print(새로운동물.defference(육상동물)) #차집합
# print(새로운동물-육상동물) #차집합
#
# #대칭차집합
# print(새로운동물.symmetric_difference(육상동물))
# print(새로운동물^육상동물)


#집합에서 제공하는 메서드
동물.add('인간') #데이터 추가
print(동물)
동물.discard('인간')
print(동물)
해상동물.remove('물개')
print(해상동물)
육상동물.pop() #데이터 확인 후 제거
print(육상동물)

동물.clear() #데이터 모두 제거
print(동물)

#패킹 : 여러 데이터를 변수 하나에 묶어 담기
#언패킹 : 변수에 담긴 데이터를 여러 변수에 풀어넣기
numbers = (1,2,3,4,5)  # 튜플생성
a,b,c,d,e = numbers
print(c)
#언패킹시 데이터수와 변수갯수 일치

x, y, *z= numbers #언패킹시 변수 갯수 불일치시 처리방법
print(z)

a,b,c=1,2,3 #벼ㅕㄴ수 초기화에 패킹, 언패킹사용

#딕셔너리 : 매핑자료구조
#키에 값을 연겨리크는 방식으로 데이터를 다루는 바업 제공
#키는 저장된 데이터를 식별하기 위한 번호나 이름,
#값은 각 키에 연걸되어 저장된 데이터
#딕셔너리는  {}에 키:값의 형태로 이용
menu = {'1' : 'newSunguk}', '2':'showSungJuk', '3':'showOneSungjk'}


#dictionary
book = {'bookid':'1', 'bookname':'축구의역사', 'publisher':'굿스포츠', 'price':7000}
order = {'orderid':'1', 'custid':'1', 'bookid':'1', 'salesprice':'6000', 'orderdate':'2014-07-01'}
customer = {'custid':'1', 'name':'박지성', 'address':'영국 맨체스타', 'phone':'000-5000-0001'}
print(book, order)

books = []
books.append(book)
books.append(book)
books.append(book)

print(books)

#딕셔너리 처리 메서드
print('1' in book) #in 연산자는 key를 찾음.
print('bookid' in book)

print(book['bookid'])
print(book['bookname'])
print(book['price'])
bkname = book['bookname']
print(bkname)
bkname = 99
print(book['bookname'])
print(bkname)
print(book.get('bookid'))

print(book)
book.update({
    '판형':'3x4'
})
print(book)
print(book)
book.update({
    '판형':'3x6'
}) # 키가 이미 '판형'이라고 존재하고 있기 때문에 values만 바뀜.
print(book)
del book['판형']
print(book)

#book.clear() #모든 키 삭제

print(book.keys())
print(book.values())
print(book.items())
print(list(book.items()))

x = [1,2,3,4,5,6,7,8,9]
x.append(10)
print(x)

x.extend([11,12]) #하나 이상 요소를 리스트에 추가
print(x)

x.reverse()
print(x)

x.insert(3,7) #3번째 자리에 7을 넣어라
print(x)

z = {1,1,1,2,2,3,3,3}
print(z)

z.add(1)
print(z)

hap = 0
for i in range(1,5,2):
    hap += i
print(hap)

for i in [1,5,2]:
    hap+=i
print(hap)



def myRange2(start, end, hop=1):
    retVal = start

    while retVal <= end:
        #return retVal
        yield retVal #yield는 generator형식으로 저장됨.
        retVal += hop

print(myRange2(1,3,2))

a = '민지'
print(next(a)) #generator 타입에 저장된 값은 iterator형식으로 다룰 수 있음
                #iterator는 리스트에 저장된 객체를













