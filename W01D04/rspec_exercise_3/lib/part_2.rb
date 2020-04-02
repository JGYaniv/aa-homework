require "byebug"
def element_count(elements)
    count = Hash.new(0)

    elements.each do |element|
        count[element] += 1
    end

    count
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        if hash.has_key?(char)
            str[i] = hash[char]
        end
    end

    str
end

def product_inject(numbers)
    numbers.inject { |acc, ele| acc * ele }
end