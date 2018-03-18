# 클래스로 만들어보기
class SungJukVO:
    type='성적프로그램'
    def __init__(self, name, kor, eng, mat):
        self.name = name
        self.kor = int(kor)
        self.eng = int(eng)
        self.mat = int(mat)

class SungJukService:
    def getTot(self, sj):
        tot = sj.kor + sj.eng + sj.mat
        return tot


    def getAverage(self, sj):
        avg = self.getTot(sj)/3
        return avg

    def getGrade(self, sj):

        if self.getAverage(sj) >= 90:
            self.grd = "수"
        elif self.getAverage(sj) >= 80 and self.getAverage(sj) < 90:
            self.grd = '우'
        elif self.getAverage(sj) >= 70 and self.getAverage(sj) < 80:
            self.grd = '미'
        elif self.getAverage(sj) >= 60 and self.getAverage(sj) < 70:
            self.grd = '양'
        else:
            self.grd = '가'
        return self.grd

sjsrv = SungJukService()
student1 = SungJukVO('박민지', 90, 90, 100)
student2 = SungJukVO('박민재', 80, 80, 90)
student3 = SungJukVO('김우빈', 50, 70, 40)


print(student1.name, student1.kor, student1.mat, student1.eng,
      sjsrv.getTot(sj=student1), sjsrv.getAverage(sj=student1),sjsrv.getGrade(sj=student1))
print(student2.name, student2.kor, student2.mat, student2.eng,
      sjsrv.getTot(sj=student2), sjsrv.getAverage(sj=student2), sjsrv.getGrade(sj=student2))
print(student3.name, student3.kor, student3.mat, student3.eng,
      sjsrv.getTot(sj=student3), sjsrv.getAverage(sj=student3), sjsrv.getGrade(sj=student3))
