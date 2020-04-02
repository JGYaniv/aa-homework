def element_count(elements)
    count = Hash.new(0)
    elements.each {|el| count[el] += 1}
    count
end

def char_replace!(string, string_hash)
    characters = string.chars
    characters.each_with_index do |char, idx| 
        if string_hash.has_key?(char) 
            string[idx] = string_hash[char]
        end
    end
    string
end

def product_inject(array)
    array.inject(&:*)
end

