# 클래스로 만들어보기
class SungJuk:
    type='성적프로그램'
    def __init__(self, name, kor, eng, mat):
        self.name = name
        self.kor = int(kor)
        self.eng = int(eng)
        self.mat = int(mat)


    def getTot(self):
        tot = self.kor + self.eng + self.mat
        return tot

    def getAverage(self):
        avg = self.getTot()/3
        return avg

    def getGrade(self):

        if self.getAverage() >= 90:
            self.grd = "수"
        elif self.getAverage() >= 80 and self.getAverage() < 90:
            self.grd = '우'
        elif self.getAverage() >= 70 and self.getAverage() < 80:
            self.grd = '미'
        elif self.getAverage() >= 60 and self.getAverage() < 70:
            self.grd = '양'
        else:
            self.grd = '가'
        return self.grd

student1 = SungJuk('박민지', 90, 90, 100)
student2 = SungJuk('박민재', 80, 80, 90)
student3 = SungJuk('김우빈', 50, 70, 40)

print(student1.name, student1.kor, student1.mat, student1.eng,
      student1.getTot(), student1.getAverage(), student1.getGrade())
print(student2.name, student2.kor, student2.mat, student2.eng,
      student2.getTot(), student2.getAverage(), student2.getGrade())
print(student3.name, student3.kor, student3.mat, student3.eng,
      student3.getTot(), student3.getAverage(), student3.getGrade())






