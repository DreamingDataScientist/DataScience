flag = input('맘에 드는 옷을 골랐나요? (예/아니요)')

if flag =='예':
    print(':) 축하해용')
    price = int(input('옷값은 얼마인가요?'))
    if price > 10000:
        print('구매하지 마세요. 사기당하는 거에요')
    else :
        print('당장 질러버려요~~')

elif flag == '아니오':
    print(':( 어떡해용')
else :
    print('예/아니오로 입력하세요!!!!')