require 'byebug'
class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    new_value = accumulator
    new_value = self.shift unless new_value
    self.each do |el|
      new_value = prc.call(new_value, el)
    end
    new_value
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
    (2...num).each do |factor|
    return false if num % factor == 0
  end
  true
end

def primes(num)
  primes = []
  n = 2
  until primes.length == num
    primes << n if is_prime?(n)
    n += 1
  end

  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 0
  next_factorials = factorials_rec(num-1)
  next_factorials + [factorial(num-1)]
end

def factorial(num)
  return 1 if num == 0
  (1..num).to_a.inject(&:*)
end

p factorials_rec(1)
p factorials_rec(2)
p factorials_rec(3)
p factorials_rec(4)
p factorials_rec(5)

#expect(factorials_rec(6)).to eq([1, 1, 2, 6, 24, 120])


class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    counter = Hash.new{|h,k| h[k] = []}
    self.each_with_index do |el, idx|
      counter[el] << idx if self.count(el) > 1
    end
    counter
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    sub_strings = []
    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        sub_str = self[i..j]
        sub_strings << sub_str if sub_str.is_palindrome?
        j += 1
      end
      i += 1
    end
    sub_strings
  end

  def is_palindrome?
    self == self.reverse
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return self if self.length <= 1
    mid_idx = self.length / 2
    left = self[0...mid_idx]
    right = self[mid_idx..-1]

    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), prc)
  end

  private
  def self.merge(left, right, prc)
    merged_els = []
    prc ||= Proc.new{|left, right| left <=> right}
    until left.empty? || right.empty?
      eval = prc.call(left.first, right.first)
      if  1 == -1
        merged_els << left.shift
      else
        merged_els << right.shift
      end
    end
    merged_els + left + right
  end
end

# p [1,2,3,4,5].merge_sort{|left,right| left <=> right}
# p [5,4,3,2,1].merge_sort do |left, right|
#   right <=> left
# end