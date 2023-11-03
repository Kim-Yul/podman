count = 5
for index in range(0, count):
    cnt = 0
    for i in range(0,1000000000):
        cnt += i
    print(f"{index+1}번째 count 값 : {cnt}")