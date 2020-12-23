import sys
from collections import deque

num = int(sys.stdin.readline())

cardlist = deque(list(range(1,num+1)))

while len(cardlist) > 1 :
    cardlist.popleft()
    cardlist.append(cardlist.popleft())

print(cardlist.popleft())