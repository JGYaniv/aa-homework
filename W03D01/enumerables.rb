# Pre-Exercise Note
# From this point on, we will be using the command line and pry to test our code, navigate our computer, and perform many other amazing tasks.

# This means that we are not using repl.it anymore to test our code.

# Getting comfortable with these tools early will be very important in becoming an efficient developer. After learning them, these tools will make just about any operation you can think of faster than using a GUI and mouse.

# Iteration Exercises
# We're going to implement some Array methods. There are descriptions for each method, but it may help to also consult the official Ruby docs for Enumerable and Array. These are good resources in general, and useful reading during this first week.

# Note: Unlike in the prepwork, there are no specs to compare against. You'll have to test your code in pry.

# Learning Goals
# Be able to create directories and files from the command line
# Know how to extend classes
# Know how to use pry to test methods
# Be able to write methods that take a block as an argument
# Get comfortable reasoning about how enumerable methods work with arrays
# Start by opening the terminal and changing your directory to the Desktop using the cd command. Create a new directory for your work using the mkdir command and then open a new file in VS Code called enumerables.rb using the code command.

# Enumerable
# My Each
# Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and returns the original array. Do not use Enumerable's each method. I want to be able to write:

require "byebug"

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end
end

#  # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3

# p return_value  # => [1, 2, 3]
# My Select
# Now extend the Array class to include my_select that takes a block and returns a new array containing only elements that satisfy the block. Use your my_each method!

class Array
    def my_select(&prc)
        selected = []
        self.my_each do |el| #[1,2,3].my_each
            selected << el if prc.call(el)
        end
        selected
    end
end

# Example:

# a = [1, 2, 3]
# a.my_select { |num| num > 1 } # => [2, 3]
# a.my_select { |num| num == 4 } # => []
# My Reject
# Write my_reject to take a block and return a new array excluding elements that satisfy the block.

class Array
    def my_reject(&prc)
        unrejected = []
        self.my_each do |el|
            unrejected << el unless prc.call(el)
        end        
        unrejected
    end
end
# Example:

# a = [1, 2, 3]
# a.my_reject { |num| num > 1 } # => [1]
# a.my_reject { |num| num == 4 } # => [1, 2, 3]
# My Any
# Write my_any? to return true if any elements of the array satisfy the block and my_all? to return true only if all elements satisfy the block.

class Array
    def my_any?(&prc)
        self.my_each do |el|
            return true if prc.call(el)
        end
        false
    end
end

# Example:

# a = [1, 2, 3]
# a.my_any? { |num| num > 1 } # => true
# a.my_any? { |num| num == 4 } # => false
class Array
    def my_all?(&prc)
        self.my_each do |el|
            return false unless prc.call(el)
        end
        true
    end
end
# a.my_all? { |num| num > 1 } # => false
# a.my_all? { |num| num < 4 } # => true
# Array

class Array
    def my_flatten
        return [self] unless self.is_a?(Array)
        return self if self.empty?

        if self[0].is_a?(Array)
            self[0].my_flatten + self[1..-1].my_flatten # 1.my_flatten + [...].my_flatten
        else 
            [self[0]] + self[1..-1].my_flatten
        end
    end
end

# [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!



# Example:
# My Zip
# Write my_zip to take any number of arguments. It should return a new array containing self.length elements. Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. If the size of any argument is less than self, nil is returned for that location.

class Array

    def my_zip(*args)

        matrix = [self] #[[1,2]]
        matrix += args #[[1,2],[4,5,6],[7,8,9]]
        # tranposed_matrix = matrix.transpose
        longest_row = matrix.map {|row| row.length}.max #[2,3,3].max => 3
        
        zipped_matrix = Array.new(self.length){Array.new(matrix.length)} #self.length => 2, matrix.length => 3 [[1, nil, nil],[nil, nil, nil]]

        (0...self.length).each do |row_idx| #self.lenght => 2, row_idx => 0
            (0...matrix.length).each do |col_idx| #matrix.lneght => 3, col_idx => 1
                zipped_matrix[row_idx][col_idx] = matrix[col_idx][row_idx] # zipped_matrix[0][1] = 1
            end
        end

        zipped_matrix
    end
end

# Example:

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
# My Rotate
# Write a method my_rotate that returns a new array containing all the elements of the original array in a rotated order. By default, the array should rotate by one element. If a negative value is given, the array is rotated in the opposite direction.

class Array
    def my_rotate(value=1)
        rotated_array = self.map(&:dup)
        if value > 0
            value.times do
                rotated_array = rotated_array[1..-1] + rotated_array[0...1]
            end
        else
            (value * -1).times do
                rotated_array = rotated_array[-1..-1] + rotated_array[0...-1]
            end
        end

        rotated_array
    end
end

# Example:

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# My Join
# my_join returns a single string containing all the elements of the array, separated by the given string separator. If no separator is given, an empty string is used.

class Array
    def my_join(value="")
        # define a joined string
        # iterate through array elements
        # element plus join value concats to string
        joined_string = ""
        self.my_each do |el|
            joined_string += el + value
        end

        return joined_string if value.empty?
        joined_string[0...joined_string.length-value.length]
    end
end

# Example:

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$$$")    # => "a$$$b$$$c$$$d"
# My Reverse
# Write a method that returns a new array containing all the elements of the original array in reverse order.
class Array
    def my_reverse
        return self if self.length == 1

        [self[-1]] + self[0...-1].my_reverse
    end
end

# Example:

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]
# Review
# Now that we're all warmed up, let's review the iteration exercises from the prepwork. Implement the following methods:
class Integer
    def factors
        factors_Array = []
        (2...self).each do |factor|
            factors_Array << factor if self % factor == 0
        end

        factors_Array
    end
end

class Array
    def bubble_sort!(&prc)
        return self if self.length == 1
        
        i = 0
        while i  < self.length - 1 
            if prc.call(self[i], self[i + 1]) == 1
                self[i], self[i + 1] = self[i + 1], self[i]
            end
            i += 1
        end
        last = self.pop
        self.bubble_sort!(&prc) << last #[8,7,6,5,4,3,2,1,9][0...-1].bubble_sort + [9]=> 
    end

    def bubble_sort(&prc)
        sorted_array = self.map{|el| el}
        sorted = false
        length = self.length - 1 

        until sorted
            sorted = true
            (0...length).each do |i|
                if prc.call(sorted_array[i], sorted_array[i+1]) == 1
                    sorted_array[i], sorted_array[i+1] = sorted_array[i+1], sorted_array[i]
                    sorted = false
                end  
            end
            length -= 1
        end

        sorted_array
    end
end

class String
    def substrings
        subs = []

        self.chars.each_with_index do |char1, idx1|
            self.chars.each_with_index do |char2, idx2|
                if idx2 >= idx1
                    subs << self[idx1..idx2]
                end
            end
        end

        subs
    end

    def subwords(dictionary)
        words = []
        subs = self.substrings
        subs.each do |sub|
            if dictionary.include?(sub)
                words << sub
            end
        end

        words
    end
end



require_relative 'dictionary.rb'

# p "ajshdjamonkeyksd".subwords(MY_DICTIONARY).sort == ["jam","monk","key","monkey"].sort
# p "ajshdjamonkeyksd".subwords(MY_DICTIONARY)
# p "dictionaries".subwords(MY_DICTIONARY).sort == ["diction","ion"].sort
# p "dictionaries".subwords(MY_DICTIONARY)
# p "anthropomorphize".subwords(MY_DICTIONARY) == ["diction"]

#merge_sort
#quick_sort

# p "abcd".substrings.sort == %w(a ab abc abcd b bc bcd c cd d).sort
# p "abcd".substrings.sort
# p "a".substrings.sort == %w(a)
# p "a".substrings.sort 
# p "".substrings.sort == []
# p "abcde".substrings.sort == %w(a ab abc abcd abcde b bc bcd bcde c cd cde de d e).sort
# p "abcde".substrings.sort

# #factors(num) v
# #bubble_sort!(&prc) v
# #bubble_sort(&prc) 
# #substrings(string)
# #subwords(word, dictionary)
# Although these exercises are from the prepwork and come with specs, use this opportunity to practice your own testing skills. Write out each method, think of a few different example cases, and test out your code in pry.

# If you are having a tough time thinking of example cases, check out the specs. You can use those examples to test your solutions. Don't forget to move your enumerables_array.rb into a lib directory!