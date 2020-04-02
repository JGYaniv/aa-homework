# my_map!

def my_map!(array, &prc)
    array.each_with_index do |el, idx|
        array[idx] = prc.call(array[idx])
    end
    array
end

# arr1 = [1,2,3,4]
# arr2 = ["a","b","c","d"]
# arr3 = [[1,2,3,4], ["a","b","c","d"], [:a,:b,:c,:d]]

# puts "1. my_map(arr): "
# object_id_1 = arr1.object_id
# my_map!(arr1){|el| el**2 }
# p arr1 == [1,4,9,16]
# p arr1.object_id == object_id_1

# object_id_2 = arr2.object_id
# my_map!(arr2){|el| (el*4).upcase + "!" }
# p arr2
# p arr2 == ["AAAA!", "BBBB!", "CCCC!", "DDDD!"]
# p arr2.object_id == object_id_2

# object_id_3 = arr3.object_id
# my_map!(arr3){|el| el.clear << "boobs" }
# p arr3
# p arr3 == [["boobs"], ["boobs"], ["boobs"]]
# p arr3.object_id == object_id_3


def my_rotate!(array, number)
    number.abs.times do
        if number >= 0
            shifted = array.shift
            array << shifted
        else
            popped = array.pop
            array.unshift(popped)
        end
    end
    array
end


arr1 = [1,2,3,4]
arr2 = ["a","b","c","d"]
arr3 = [[1,2,3,4], ["a","b","c","d"], [:a,:b,:c,:d]]

puts "1. my_map(arr): "
object_id_1 = arr1.object_id
my_rotate!(arr1, 10)
p arr1 == [3,4,1,2]
p arr1.object_id == object_id_1

object_id_2 = arr2.object_id
my_rotate!(arr2, -2)
p arr2 == ["c","d","a","b"] || arr2
p arr2.object_id == object_id_2

object_id_3 = arr3.object_id
my_rotate!(arr3, 0)
p arr3 == [[1,2,3,4], ["a","b","c","d"], [:a,:b,:c,:d]]
p arr3.object_id == object_id_3

# Given a two-dimensional array, write code that iterates over all of the inner elements.

def two_dimensional_each

arr3 = [[1,2,3,4], ["a","b","c","d"], [:a,:b,:c,:d]]

object_id_3 = arr3.object_id
my_rotate!(arr3, 0)
p arr3 == [[1,2,3,4], ["a","b","c","d"], [:a,:b,:c,:d]]
p arr3.object_id == object_id_3


# Given an array that contains hashes, write code that iterates over all of the keys in the hashes.
# Given a hash that contains array as values, write code that iterates over all of the elements in the arrays.
# Given a description of a built-in Ruby method that utilizes procs, write a method that mimics the behavior of the described method (such as my_map, my_select, my_any?, my_one?, etc.).
# Write a method that utilizes the splat (*) operator to accept an arbitrary number of additional arguments.
# Write a method that accepts a string as an argument and returns a hash containing the count of characters of the string.
# Write a method that accepts a sentence string as an argument and returns a new sentence where every word is modified according to a given description (such as hipsterfy, aba_translate, etc.).