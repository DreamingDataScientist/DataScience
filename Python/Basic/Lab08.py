#성적처리 프로그램 난이도 하

name = "이름"
kor = "국어"
eng = "영어"
mat = "수학"
tot = "총점"
avg = "평균"
grd = "학점"

name = input("이름은?")
kor = input("국어점수는?")
eng = input("영어점수는?")
mat = input("수학점수는?")

tot = int(kor) + int(eng) + int(mat)
avg = tot/3
if (avg >= 90 ):
    grd = "참 잘했어요"

print("총 점수는 " , tot, "입니다.")
print("평균 점수는 ", avg, "입니다.")
print("결과는 ", grd)

#제곱.
2**3
2**4
2**5
2**6
2**7
2**8
2**9

print('{0}, {1}'.format(name, kor))
print('{0}, {1}'.format(tot, avg))
print('{0}, {1:.1f}'.format(tot,avg)) #:.1f는 소수점 첫 째자리까지 나오게!!!
print('{name}, {kor}'.format(name='혜교', kor=98))

print('이름=%s, 국어=%d' % (name,kor))

