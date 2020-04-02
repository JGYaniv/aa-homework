# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require 'prime'

def largest_prime_factor(num)
    factors = []
    (2..num).each do |factor|
        if num % factor == 0
            factors << factor
        end
    end

    factors.reverse.each do |factor|
        if Prime.prime?(factor)
            return factor
        end
    end
end

def unique_chars?(string)
  word = string.split("")
  word.uniq == word
end


def dupe_indices(array)
    dupeHash = Hash.new(0)
    array.each do |el|
        dupeHash[el] += 1
    end
    #Hash.new{|hash, k| hash[k] = Array.new}
    indexHash = Hash.new
    array.each_with_index do |el, idx|
        if indexHash.keys.include?(el)
            indexHash[el] << idx
        else
            indexHash[el] = [idx]
        end
    end

    indexHash.select do |key, value|
        dupeHash[key] > 1
    end
end

def ana_array(arr1, arr2)
    hash_count1 = Hash.new(0)
    hash_count2 = Hash.new(0)

    arr1.each do |ele|
        hash_count1[ele] += 1
    end

    arr2.each do |ele|
        hash_count2[ele] += 1
    end

    hash_count1 == hash_count2
end