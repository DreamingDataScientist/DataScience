# -*- encoding:utf-8 -*-
from pymongo import MongoClient
import pprint
import datetime

try:
    client = MongoClient('mongodb://192.168.56.101:27017')
except Exception as ex:
    print(ex)

db = client.qkralswl27

#데이터 추가하기.
student = {'hakbun':'a123456',
           'name' : '혜교',
           'addr' : 'seoul, korea',
            'refdate' : datetime.datetime.now()}

objId = db.students.insert_one(student)
print(objId)
print(db.students.find_one)

many_student = [{'hakbun':'a123456',
                'name' : '지현',
                'addr' : 'pusan, korea',
                'refdate' : datetime.datetime.now()},
                {'hakbun': 'a123456',
                 'name': '지현',
                 'addr': 'pusan, korea',
                 'refdate': datetime.datetime.now()},
                {'hakbun':'a123456',
                'name' : '수지',
                'addr' : 'kyunggi, korea',
                'refdate' : datetime.datetime.now()}
                ]

result = db.students.insert_many(many_student)
print(result.inserted_ids)

#데이터 수정
#학번 a123456인 학생의 주소를 인천으로 변경
result = db.students.update_one({'hakbun':'a123456'}, {"$set":{'addr':'incheon, korea'}})
print(result.matched_count, result.modified_count)

result = db.students.update_many({'hakbun':'a123456'}, {"$set":{'addr':'incheon, korea'}})
print(result.matched_count, result.modified_count)

#데이터삭제
#학번 a123456인 학생 정보 삭제
result = db.students.delete_one( {'hakbun':'a123456'} )
print(result.deleted_count)

result = db.students.delete_many( {'hakbun':'a123456'})
print(result.deleted_count)

result = db.students.delete_many({}) #모두 삭제
print(result.deleted_count)

#몽고디비 끄기


