#리스트 자료구조형으로 만들기

name_list = []
kor_list = []
eng_list = []
mat_list = []
tot_list = []
avg_list = []
grd_list = []


while True:
    idx=len(name_list)
    name_list.append(input('이름이 어떻게 되시나요?'))
    kor_list.append(int(input('국어점수를 넣어주세요.')))
    eng_list.append(int(input('영어점수를 넣어주세요.')))
    mat_list.append(int(input('수학점수를 넣어주세요.')))

    tot_list.append(kor_list[idx]+eng_list[idx]+mat_list[idx])
    avg_list.append((tot_list[idx]/3))
   # grd_list.append((avg_list(idx)))


    print('''국어 : {0} & 영어 : {1} & 수학 : {2} & 총점 : {3} & 평균 : {4} & {5}님의 최종 학점은  입니다.'''
    .format(kor_list[idx],eng_list[idx],mat_list[idx],tot_list[idx],avg_list[idx],name_list[idx]))

    is_exit=input('계속 하시겠습니까? (y/n)')
    if is_exit == 'y':
        print(''''{}'명의 학생 성적처리를 했습니다.'''.format(idx+1))
    elif is_exit == 'n':
        break


