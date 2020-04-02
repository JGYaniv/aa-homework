# Define your methods here.
def string_map!(string, &prc)
    characters = string.chars
    characters.each_with_index do |char, idx|
        string[idx] = prc.call(char)
    end
    string
end

def three?(array, &prc)
    passed_els = array.count do |el|
        prc.call(el)
    end
    passed_els == 3
end

def nand_select(array, proc1, proc2)
    array.select do |el|
        !(proc1.call(el) && proc2.call(el))
    end
end

def hash_of_array_sum(hash)
    total = 0
    hash.values.each do |array|
        total += array.sum
    end
    total
end

def abbreviate(sentence)
    words = sentence.split
    words.map{|word| word.length > 4 ? abbreviate_word(word) : word }.join(" ")
end

def abbreviate_word(word)
    vowels = "aeiou"
    letters = word.chars
    letters.select {|letter| !vowels.include?(letter.downcase) }.join("")
end

def hash_selector(hash, *selectors)
    return hash if selectors.empty?
    filtered_hash = {}
    hash.each {|k,v| filtered_hash[k] = v if selectors.include?(k)}
    filtered_hash
end