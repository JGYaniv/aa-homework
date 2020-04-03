require "byebug"
# Learning Goals
# Know how to reason about recursive programs
# Be able to write a base case for a recursive method
# Be able to write the inductive step for a recursive method
# Be able to explain the benefits of writing a method recursively vs. iteratively
# Be able to trace a recursive method and figure out how many recursive steps it will take
# Know how to write recursive sorting and searching algorithms

# Warmup
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def range(first, last) # range(1, 5) => [1, 2, 3, 4] == [1,2,3] + range(4, 5)
    return [] if first == last

    [first] + range(first+1, last)
end

# p range(1, 5) # => [1, 2, 3, 4]
# p range(-5, 1)
# p range(10, 15) # =>[10, 11, 12, 13, 14]

def iterative_sum(array)
    sum = 0
    array.each {|num| sum += num }
    sum
end

def recursive_sum(array) #[1,2,3,4] or [-2,5,10,0]
    return 0 if array.empty?
    array[0] + recursive_sum(array[1..-1])
end

arr1 = [1,2,3,4]
# p recursive_sum(arr1)
# p iterative_sum(arr1)
# p recursive_sum([])

# Exponentiation
# Write two versions of exponent that use two different recursions:

# # this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# p exp(b, 0) = 1
# p exp(b, 1) = b
# p exp(b, n) = exp(b, n / 2) ** 2             #[for even n]
# p exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) #[for odd n]

def exp1(base, exp)
    return 1 if exp == 0
    base * exp1(base, exp - 1)
end

def exp2(base, exp)
    return 1 if exp == 0
    #debugger
    if exp.even?
        exp2(base, exp / 2) ** 2
    else 
        base * exp2(base, (exp - 1)/ 2) ** 2
    end
end

# p exp1(2,3) # == 8
# p exp1(2,4) # == 16
# p exp1(2,0) # == 1
# p exp2(2,3) # == 8
# p exp2(2,4) # == 16 
# p exp2(2,0) # == 1



# Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself. So don't cheat and use exponentiation in your solution.

# Suggestion: Break the methods down into parts..

# Suggestion 2: Try walking through your code with Simple Examples.

# If the n == 256, about how many nested recursive steps will we run in the first case?

# How deep will we need to recurse for the second? Keep in mind that the first reduces the exponent by one for each recursion, while the second reduces it by half.

# In addition to testing your methods by running the code, try the following exercise:

# On paper, write out the value of each variable for every line in the code:

# Write out what happens with base 0 and power 0 as inputs (should be easy). e.g., if you had run exp(0,0).
# Write out what happens for base 0 and power 1. e.g., if you had run exp(0,1).
# Write out what happens for base 1 and power 0.
# Write out what happens for base 1 and power 1.
# Write out what happens for base 1 and power 2.
# Write out what happens for base 2 and power 0.
# Write out what happens for base 2 and power 1.
# Write out what happens for base 2 and power 2.
# Make sure you can trace from the very beginning to the very end in these examples.

# How many examples do you need to walk through to be confident that it works?

# Deep dup
# The #dup method doesn't make a deep copy:

def deep_dup(array)
    return array.dup unless array.is_a?(Array) #  true unless array.is_a?(Array) == true if !array.is_a?(Array)
    return array.dup if array.empty?

    if array[0].is_a?(Array)
        [deep_dup(array[0])] + deep_dup(array[1..-1]) #
    else
        [array[0].dup] + deep_dup(array[1..-1])
    end
    #arr2 = array.new_object_id
    #new_array.all.object_id != array.all.object_id (unless its immutable)
end
#108: [["nuts", "bolts", "washers"],["capacitors", "resistors", "inductors"]]
#109: false
#110: false
#111: []

arr1 = [1,[2,[3,[4]]] ,[5,6]]
robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"],
  []
]

# p arr1_dup = deep_dup(arr1)
# p robot_dup = deep_dup(robot_parts)

# p arr1.last.object_id != arr1_dup.last.object_id
# p robot_parts.last.object_id != robot_dup.last.object_id

# p arr1[1].object_id != arr1_dup[1].object_id
# p robot_parts.first.object_id != robot_dup.first.object_id

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# When we dup an Array, it creates a new array to hold the elements, but doesn't recursively dup any arrays contained therein. So the dup method creates one new array, but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, we are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.

# It's okay to iterate over array elements using the normal each for this one :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

# Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

def fibonacci(n) # n => 3
    return [0] if n == 0
    return [0, 1] if n == 1
    next_step = fibonacci(n-1)
    next_step << (next_step[-1] + next_step[-2])
end    

# p fibonacci(0)
# p fibonacci(5)
# p fibonacci(20)

# Binary Search
# The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array. If the target value is equal to the middle element's value, then the position is returned and the search is finished. If the target value is less than the middle element's value, then the search continues on the lower half of the array; or if the target value is greater than the middle element's value, then the search continues on the upper half of the array. This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element of the remaining elements - until the target value is either found (and its associated element position is returned), or until the entire array has been searched (and "not found" is returned).



# Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

def bsearch(numbers, target_num)
    mid_idx = numbers.length/2
    mid_num = numbers[mid_idx]
    
    return mid_idx if mid_num == target_num
    return nil if numbers.empty?
    
    right = numbers[mid_idx+1..-1]
    left = numbers[0...mid_idx]


    if target_num > mid_num
        idx = bsearch(right, target_num)
        #debugger if idx == nil
        idx += left.length + 1 unless idx == nil  #Review after
        idx
    else
        bsearch(left, target_num)
    end
end
#wtf is this?
# def b_search(arr, target) 
#     return 0 if arr[0] == target 
#     return nil if caller_locations.length >= arr.length 
#     return caller_locations.length if arr[caller_locations.length] == target 
#     b_search(arr, target) 
# end
# Make sure that these test cases are working:

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 2) # => 0
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# Merge Sort
# Implement a method merge_sort that sorts an Array:
# https://medium.com/@oshiryaeva/overview-of-fast-sorting-algorithms-quicksort-merge-sort-heap-sort-and-radix-sort-part-1-e96d0c8209f7
# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.


# Array Subsets
# Write a method subsets that will return all subsets of an array.

def merge_sort(array) #[3,2,1]
    return array if array.length <= 1 #[[4],[3],]
    mid_idx = array.length/2 # 1
    left = array[0...mid_idx] #[3]
    right = array[mid_idx..-1] #[2,1]

    merge(merge_sort(left), merge_sort(right)) 
end

#iterative style
def merge(left, right)
    sorted_arr = [] 
    until left.empty? || right.empty?
        if right.first > left.first
            sorted_arr << left.shift
        else
            sorted_arr << right.shift
        end
    end
    return sorted_arr + left + right
end

#recursive style
# def merge(left, right)
#     return [] if left.empty? && right.empty?
#     sorted_arr = [] #
#     if left.empty? 
#         sorted_arr += right
#         right = []
#     elsif right.empty?
#         sorted_arr += left
#         left = []
#     elsif right.first > left.first
#         sorted_arr << left.shift
#     else
#         sorted_arr << right.shift
#     end
    
#     sorted_arr + merge(left, right) #
# end

# p merge_sort([]) 
# p merge_sort([1]) 
# p merge_sort([1, 2]) 
# p merge_sort([1, 2, 3])
# p merge_sort([3,2,1])
# p merge_sort([400,2,3,12,908,90,1,2,7,48,127,389])
#subsets([1, 2]) # => [[], [1], [2], [1, 2]]
def subsets(array) 
    return [[]] if array.empty?

    last_el = array.pop
    subs = subsets(array)

    combined = subs.map {|el| el += [last_el]}
    subs + combined
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])

# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# # => [[] << []]
# # => [[] << 1]
# # => [[] << 2, [1] << 2]
# # => [[] << 3, [1] << 3, [2] << 3, [1, 2] << 3]
# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.
# Permutations
# Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

def permutations(array)
    return array if array.length <= 1
    perms = []
    array.each_with_index do |el, idx|
        other_els = array[0...idx] + array[idx+1..-1]
        sub_perms = permutations(other_els)

        mapped_perms = sub_perms.map {|perm| ([perm] << el).flatten }
        perms += mapped_perms
    end
    perms
end

# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]
# Make Change
# RubyQuiz: Make change.

# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. This allows each coin to be available each time we get a new remainder. By iterating over the denominations and continuing to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using coins less than or equal to the current coin.
# Add the single coin to the change returned by the recursive call. This will be a possible solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. Remember that a permutation is not the same thing as a combination - we will need to check every combination of coins that add up to our target, we just don't want to check the same combination in different orders. If you get stuck you can start by writing a solution that calculates and compares all of the permutations without storing them in an array. Then go back and refactor your solution so that it only calculates and compares all of the different combinations. If you and your partner get totally stuck, or would like to compare your answer, feel free to reference this video walkthrough of the problem.

# Make sure you and your partner understand each line before moving on.

def make_change(total, coins)
    
    possible_change = []
end