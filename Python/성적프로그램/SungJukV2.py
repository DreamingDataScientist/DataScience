# 함수로 만들기
이름 = input('이름이 어떻게 되시나요?')
국어 = int(input('국어점수를 넣어주세요.'))
영어 = int(input('영어점수를 넣어주세요.'))
수학 = int(input('수학점수를 넣어주세요.'))
총점 = 0
평균 = 0
학점 = '가'

#pass : dummy code

def getTotal():
    총점 = int(국어+영어+수학)
    return 총점

def getAverage():
    평균 = getTotal()/3
    return 평균

def getGrade():

    if 평균 >= 90:
        학점 = "수"
    elif 평균 >= 80 and 평균 < 90:
        학점 = '우'
    elif 평균 >= 70 and 평균 < 80:
        학점 = '미'
    elif 평균 >= 60 and 평균 < 70:
        학점 = '양'
    else:
        학점 = '가'
    return 학점

총점 = getTotal()
평균 = getAverage()
학점 = getGrade()

print('''국어 : {0}
영어 : {1}
수학 : {2}
총점 : {3}
평균 : {4}
{5}님의 최종 학점은 {6} 입니다.'''.format(국어,영어,수학,총점,평균,이름,학점))
