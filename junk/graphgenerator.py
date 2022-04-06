import matplotlib.pyplot as plt
import ast

from numpy import average
from MathFuncs import MathFuncs as fun

# Data from the SpeedTest program.
# (SET)_time = the average times of 5 tests.
# (SET)_x = the amount of characters


colors = ["bo", "go", "ro", "co", "mo"]
charlen = [10, 14, 26, 52, 62, 66, 76]

y_set = []

with open ("./source/resorces/output/output.txt", "r") as f:
    arrs = f.read().split("\n")
    for x in range(0, len(arrs)-1):
        arrs[x] = ast.literal_eval(arrs[x])

for a in arrs:
    for b in range(0, len(a)):
        plt.plot(charlen, a[b], colors[b])

averages_y = []
tmp = []
tmp2 = []
for x in range(0, len(arrs[0][0])):
    for a in arrs:
        for b in a:
            tmp.append(b[x])
        if tmp != []:
            try:
                tmp2[x].append(fun.mean(tmp))
            except IndexError:
                tmp2.append([])
                tmp2[x].append(fun.mean(tmp))
        tmp = []

for a in tmp2:
    averages_y.append(fun.mean(a))

plt.plot(charlen, averages_y, "g--")

plt.title('Character set VS time to crack a password')
plt.xlabel('Number of Characters')
plt.ylabel('Time (ms)')

plt.show()