import matplotlib.pyplot as plt
import ast

from numpy import average
import MathFuncs

# Data from the SpeedTest program.
# (SET)_time = the average times of 5 tests.
# (SET)_x = the amount of characters

fun = MathFuncs.MathFuncs()

d_output_path = "./source/output/"
py_output_path = "./pythonscripts/output/"
colors = ["bo", "go", "ro", "co", "mo", "yo", "ko", "b^", "g^", "r^", "c^", "m^", "y^", "k^", "b*", "g*", "r*", "c*", "m*", "y*", "k*", "b+", "g+", "r+", "c+", "m+", "y+", "k+", "bx", "gx", "rx", "cx", "mx", "yx", "kx", "b.", "g.", "r.", "c.", "m.", "y.", "k.", "b,", "g,", "r,", "c,", "m,", "y,", "k,"]
charlen = [10, 14, 26, 52, 62, 66, 76]

y_set = []

with open (d_output_path + "output.txt", "r") as f:
    arrs = f.read().split("\n")
    for x in range(0, len(arrs)-1):
        arrs[x] = ast.literal_eval(arrs[x])

for a in arrs:
    for b in range(0, len(a)):
        plt.plot(charlen, a[b], colors[b])

averages_y = []
medians_y = []

mean_tmp2 = []
median_tmp2 = []
tmp = []

for x in range(0, len(arrs[0][0])):
    for a in arrs:
        for b in a:
            tmp.append(b[x])
        if tmp != []:
            try:
                mean_tmp2[x].append(fun.mean(tmp))
                median_tmp2[x].append(fun.median(tmp))
            except IndexError:
                mean_tmp2.append([])
                mean_tmp2[x].append(fun.mean(tmp))
                median_tmp2.append([])
                median_tmp2[x].append(fun.median(tmp))
        tmp = []

for a in mean_tmp2:
    averages_y.append(fun.mean(a))

for a in median_tmp2:
    medians_y.append(fun.median(a))

print(averages_y)
print(medians_y)

plt.plot(charlen, averages_y, "g--")
plt.plot(charlen, medians_y, "g--")

plt.title('Character set VS time to crack a password')
plt.xlabel('Number of Characters')
plt.ylabel('Time (ms)')

plt.savefig(py_output_path + "output.png")
plt.show()