# -*- encoding:utf-8 -*-
from pymongo import MongoClient
import pprint

#MongoDB 외부접속을 허용하려면 설정파일에 'bind_ip=아이피주소' 를 추가!!!

#몽고디비 연결객체 만들기 - 로컬상에서 가능!
#client = MongoClient()

#외부접속으로 하려면은 포트번호 써야함.
try:
    #client = MongoClient('192.168.56.101', 27017)
    client = MongoClient('mongodb://192.168.56.101:27017') #권장!
except Exception as ex:
    print(ex)

#데이터베이스 객체 가져오기
#db = client['qkralswl27']
db = client.qkralswl27

#컬렉션 객체 가져오기
#coll = db['inventory']
coll = db.inventory
coll2 = db.restraunts

#단일 문서 조회
print(coll.find_one())

#단일 문서 조회 - JSON을 보기좋게 출력하기 (PPRINT)
print('pprint로 사용하여 출력해보기.')
pprint.pprint(coll.find_one())

#전체 문서 조회
print('pprint로 사용하여 전체출력해보기.')
pprint.pprint(coll.find())
cursor = coll.find()
for doc in cursor:
    pprint.pprint(doc)

# cursor = coll2.find()
# for doc in cursor:
#     pprint.pprint(doc)

#레스토랑 컬렉션 출력.
print('레스토랑 컬렉션 출력')
pprint.pprint(coll2.find_one())
pprint.pprint(coll2.find())

#조건으로 질의하기
#아이템이 노트북인 것
print(coll.find_one( {'item':'notebook'}))
#qty가 50보다 작은 item  조회
print(coll.find_one( {'qty' : {"$lt": 50}}))
#우편번호가 10075인 음식점 조회
print(coll2.find_one({'address.zipcode':'10462'}))

#조건의 결과가 두개 이상일때
cursor = coll.find({'qty' : {"$lt": 50}})
for doc in cursor:
    print(doc)

cursor = coll2.find({'address.zipcode':'10462'})
for doc in cursor:
    print(doc)


