#-*- encoding:utf-8 -*-
import json
import datetime
import codecs

#jason 데이터를 생성한 뒤 파일에 그것을 저장하는 예제

today = datetime.datetime.now()
sungjuk = {
        'hakbun':'a123456',
        'name': '민지',
        'kor':99,
        'eng':98,
        'mat':99,
        'regdate' : str(today) }

print(sungjuk)

#JSON형식으로 인코딩 - JSON.DUMPs
jsonstring = json.dumps(sungjuk)

print(jsonstring)
print(type(jsonstring))

#json 형식을 보기좋게 출력하면? - indent사용
jsonstring = json.dumps(sungjuk, indent=4)
print(jsonstring)

#json 형식을 python에서 처리할 수 있도록 디코딩 - loads
sjDict = json.loads(jsonstring)
print('학번')
print(sjDict['hakbun'])
print('국어')
print(sjDict['kor'])

#json 형식을 파일에 쓰기.
#json으로 변환된 객체를 파일에 기록
#이게 더 좋음!
with codecs.open('sungjuk.json','w','utf-8') as make_json:
    make_json.write(jsonstring)

#json 형식을 파일에 쓰기.
#파일에 기록할 때 json으로 변환
with codecs.open('sjungjuk2.json', 'w','utf-8') as make_json:
    json.dump(sungjuk, make_json)

#json 형식 파일 읽기.
with codecs.open('sungjuk.json', 'r', 'utf-8') as read_json:
    #sungjuk2내용을 json으로 변환해서 readjson에 저장.
    read_json = json.load(read_json)

    print(read_json)

#파일에서 읽은 내용을 dictionary 형식으로 처리
print(read_json['mat'])
print(read_json['name'])

#uid='abc123'
#pwd='xyz987'
#member = {'uid':str(uid), 'pwd':str(pwd)}

#학생 데이터를 JSON으로 다루기
hakbun = '20130050'
name = '박민지'
addr = '경상남도 울산시'
age = 25
birth = '1993.07.15'
depart = '컴퓨터공학'
profid= '504'
meeting = '목, 2교시'

student = { 'hakbun' : str(hakbun), 'name' : str(name), 'addr' : str(addr), 'age' : str(age),
            'birth' : str(birth), 'depart' : str(depart), 'profid' : str(profid), meeting : str(meeting)}

departname = u'컴퓨터공학'
depttel = '123-4567-8910'
deptoff = 'e동 2층'
deptcf = 504
profdept = '철학'
profid = 504
porfname = '이성계'
student2 = { 'hakbun' : str(hakbun), 'name' : str(name), 'addr' : str(addr), 'age' : str(age),
            'birth' : str(birth), 'depart' : {'deptname' : departname,
                                              'depttel' : depttel,
                                              'deptoff' : deptoff,
                                              'deptcf' : deptcf,
                                              'profdept' : profdept},
            'profid' : {'profid' : profid,
                         'profname' : porfname},
            'meeting' : str(meeting)}

print(student)
print('student2는', student2)

stdjson = json.dumps(student)
stdjson2 = json.dumps(student2)
print(stdjson)
print(stdjson2)

stdDict = json.loads(stdjson)
print(stdDict['name'])
print(stdDict['depart'])

stdDict2 = json.loads(stdjson2)
print(stdDict2['depart'])


for key in stdDict2['depart']:
    print(stdDict2['depart'][key])

print(stdDict2['profid']['profname'])


#json (Javascript Object Notation)
#여러 시스템 간 데이터교환을 위해 고안한 데이터형
#xml : 데이터를 정의하는 태그 때문에 파일 용량이 커짐
#csv : cml보다 용량은 작지만 데이터의 의미 파악이 힘듦

#자바스크립트의 객체 표기법을 차용해서 만듦
#객체는 키, 값의 형식으로 작성
#xml과 csv의 장점만 따서 만든것이라 폭발적인 지지를 받음
#주의! 파이션에는 이것과 유사한 자료구조인 dictionary가 이미있음
#json과 dictionary 자료구조는 서로 구분해야 할 필요가 있기 때문에
#dictionary 자료구조로 정의된 객체는 dumps, loads 명령으로 json 객체로 변환.

#성적 데이터를 json데이터로 생성한 뒤 파일에 그것을 저장하는 예제.
idol_group =OrderDict()
album = OrderDIct()
albums = OrderDict()
dept = OrderDict()
stud = OrderDict()


idol_group['name'] = '소녀시대'
idol_group['member'] = ['태연', '써니', '효연', '유리', '윤아', '제시카', '티파니', '수영', '서현']

album['year'] = 2007
album['name'] = '소녀시대'
album['regular'] = album

idol_group["albums"] = albums


dept['deptname'] = '컴퓨터 공학'
dept['depttel'] = '123-4567-8901'
dept['deptoff'] = 'e동 2층'
dept['deptchf'] = '504'
dept['deptdate'] =' 2007년'

stud['depart'] = dept










