def partition(numbers, divider)
    left_array = []
    right_array = []
    numbers.each do |num|
        left_array << num if num < divider
        right_array << num if num >= divider
    end
    [left_array, right_array]
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each {|k, v| new_hash[k] = v }
    hash2.each {|k, v| new_hash[k] = v }
    new_hash
end

def censor(sentence, bad_words)
    words = sentence.split
    censored_words = words.map do |word|
        bad_words.include?(word.downcase) ? censor_word(word) : word
    end
    censored_words.join(" ")
end

def censor_word(word)
    vowels = "aeiou"
    letters = word.chars
    censored_letters = letters.map do |letter|
        vowels.include?(letter.downcase) ? "*" : letter
    end
    censored_letters.join("")
end

def power_of_two?(number)
    exp = 0
    while true
        if 2**exp == number
            return true
        elsif 2**exp > number
            return false
        end

        exp += 1
    end
end

