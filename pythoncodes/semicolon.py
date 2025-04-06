
with open("copy.list",'r') as lines:
        for line in lines:
            print(line.replace('\n',';'))