import matplotlib.pyplot as plt

# Data from the SpeedTest program.
# (SET)_time = the average times of 5 tests.
# (SET)_x = the amount of characters


def average(list):
    return sum(list) / len(list)

# [9, 11, 10, 10, 9]
# [36, 24, 21, 40, 34]
# [332, 389, 361, 401, 380]
# [5137, 6170, 5977, 6572, 6643]
# [9502, 12745, 12895, 10359, 13418]
# [12830, 11753, 17514, 12547, 19877]
# [34478, 20821, 21225, 32540, 29832]


# [12, 12, 19, 10, 13]
# [35, 46, 47, 42, 40]
# [454, 408, 570, 384, 341]
# [5745, 5382, 6580, 6196, 4953]
# [13821, 11598, 14928, 12646, 14718]
# [18572, 16965, 14473, 18154, 14565]
# [27149, 32115, 30610, 26604, 22538]




# [10, 9, 9, 9, 11]
# [29, 40, 41, 37, 38]
# [393, 366, 316, 422, 366]
# [5744, 5329, 6536, 7186, 7494]
# [12977, 14626, 11379, 12531, 12623]
# [21619, 18403, 17075, 18125, 14591]
# [12894, 37033, 26749, 31268, 36290]



# [20, 11, 10, 15, 11]
# [31, 43, 37, 38, 42]
# [376, 514, 475, 407, 629]
# [6909, 5213, 5978, 6733, 6325]
# [19861, 16350, 12429, 9659, 13002]
# [19940, 12212, 13664, 11819, 15582]
# [29427, 25129, 33960, 33742, 38555]



# [7, 13, 9, 10, 9]
# [47, 42, 34, 50, 32]
# [428, 378, 441, 331, 483]
# [5988, 6409, 6811, 6165, 5289]
# [10233, 13333, 12597, 13622, 16478]
# [22341, 13242, 15235, 17135, 17387]
# [32103, 33020, 23240, 23343, 23888]


colors = ["bo", "go", "ro", "co", "mo"]
charlen = [10, 14, 26, 52, 62, 66, 76]

y_set = []

with open ("junk/generated.txt", "r") as f:
    lines = f.readlines()
    for i in range(len(lines)):
        line = lines[i].strip().replace('[', '').replace(']', '').split(", ")
        y_set.append(line)


final_set = []


cnt = 0
for i in range(0, len(y_set)):
    for h in range(0, len(y_set[i])):
        five = []
        five.append(y_set[i][cnt])
        print(five)
        cnt += 1
        if cnt == 4:
            final_set.append(five)
            cnt = 0

print(final_set)

# for i in final_set:
#     print(i)
    # for x in range(0, len(i)):
    #     i[x] = int(i[x])
    # plt.plot(charlen, i, colors[x])
    # print(i)


# averages_x = [10, 14, 26, 52, 62, 66, 76]

plt.title('Character set VS time to crack a password')
plt.xlabel('Number of Characters')
plt.ylabel('Time (ms)')

# # plt.savefig("fullgraph.png")
plt.show()