import sys

n = int(sys.stdin.readline())

i = 1
numberofline = 0

for i in range(1, n+1):
    numberofline += len(str(i))
    
print(numberofline)