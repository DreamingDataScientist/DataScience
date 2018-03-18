flag = 1
if flag:
    print(':)')



#8.
aroomw = 2.5
aroomc= 3
aroomcost = 27

broomw = 4
broomc = 2
broomcost = 30

aroomsize = aroomw*aroomc
aroompercost = aroomsize/aroomcost

broomsize = broomw*broomc
broompercost = broomsize/broomcost

print(aroompercost, broompercost)

if (broompercost<aroompercost):
    print('방A를 선택하시는 것이 현명합니다.')
else :
    print('방 B를 선택하시는 것이 현명합니다.')