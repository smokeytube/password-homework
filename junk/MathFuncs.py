# Statistics python homework from December 2021

from random import choice

class MathUtils:
    # A clunky yet effective quick sort implementation
    @staticmethod
    def quick_sort(set_: list) -> list:
        if len(set_) <= 1:
            return set_
        temp_set_a, temp_set_b, temp_set_c = [], [], []
        snd_element = choice(set_)
        for x in set_:
            if x < snd_element:
                temp_set_a.append(x)
            elif x > snd_element:
                temp_set_b.append(x)
            else:
                temp_set_c.append(x)

        return MathUtils.quick_sort(temp_set_a) + temp_set_c + MathUtils.quick_sort(temp_set_b)
    
    # Removes duplicates from a list
    @staticmethod
    def remove_duplicates(set_: list) -> list:
        new_set = []
        for x in set_:
            if x not in new_set:
                new_set.append(x)
        return new_set

    # Returns the number of occurrences of a given element in a given set
    @staticmethod
    def count(set_: list, num: float) -> int:
        count = 0
        for x in set_:
            if x == num:
                count += 1
        return count



class MathFuncs(MathUtils):
    def __init__(self) -> None:
        pass

    # Combines two sets, removes duplicates, and sorts the result
    def union(self, set_a: list, set_b: list) -> list:
        concat = set_a + set_b
        u = self.remove_duplicates(concat)
        return self.quick_sort(u)
    
    # Returns only the numbers that appear in both sets
    def intersection(self, set_a: list, set_b: list) -> list:
        i = []
        for x in set_a:
            if x in set_b:
                i.append(x)
        return self.quick_sort(i)
    
    # Sums all the numbers in the set then divides by the length of the set
    @staticmethod
    def mean(set_: list) -> float:
        sum_ = 0
        count = 0
        for x in set_:
            sum_ += x
            count += 1
        mean = sum_ / count
        return mean
    
    # Sorts all numbers in the set and then returns the middle value, or the average of the two middle values
    def median(self, set_: list) -> float:
        sorted_set = self.quick_sort(set_)
        if len(sorted_set) % 2 == 0:
            median = (sorted_set[int(len(sorted_set)/2)] + sorted_set[int(len(sorted_set)/2 - 1)]) / 2
        else:
            median = sorted_set[int(len(sorted_set)/2)]
        return median

    # Returns the mode of the set. The mode is returned in a list to account for multiple modes
    def mode(self, set_: list) -> list:
        mode = []
        count = 0
        for x in set_:
            if self.count(set_, x) > count:
                count = self.count(set_, x)
        for j in set_:
            if self.count(set_, j) == count:
                mode.append(j)
        return self.remove_duplicates(mode)
    
    # Returns the range of the set
    def range(self, set_: list) -> float:
        sorted = self.quick_sort(set_)
        return sorted[-1] - sorted[0]
