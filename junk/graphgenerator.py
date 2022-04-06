import matplotlib.pyplot as plt
import ast

# Data from the SpeedTest program.
# (SET)_time = the average times of 5 tests.
# (SET)_x = the amount of characters


def average(list):
    return sum(list) / len(list)


colors = ["bo", "go", "ro", "co", "mo"]
charlen = [10, 14, 26, 52, 62, 66, 76]

y_set = []

with open ("./source/resorces/output/output.txt", "r") as f:
    arrs = f.read().split("\n")
    for x in range(0, len(arrs)-1):
        arrs[x] = ast.literal_eval(arrs[x])

for a in arrs:
    for b in a:
        plt.plot([10, 14, 26, 52, 62, 66, 76], b, "go")

plt.title('Character set VS time to crack a password')
plt.xlabel('Number of Characters')
plt.ylabel('Time (ms)')

plt.show()