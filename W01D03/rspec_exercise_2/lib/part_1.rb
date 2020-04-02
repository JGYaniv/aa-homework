def partition(array, num)
    lesserArray = []
    greaterArray = []

    array.each do |el|
        el >= num ? greaterArray << el : lesserArray << el
    end

    [lesserArray, greaterArray]
end

def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each {|k,v| new_hash[k] = v }
    hash_2.each {|k,v| new_hash[k] = v }
    new_hash
end

def censor(sentence, curseWords)
    words = sentence.split.map do |word|
        if curseWords.include?(word.downcase)
            helper(word)
        else
            word
        end
    end
    words.join(" ")
end

def helper(word)
    vowels = "aeiouAEIOU"
    newWord = word.chars.map do |char|
        if vowels.include?(char)
            "*"
        else
            char
        end
    end
    newWord.join("")
end

def power_of_two?(n)
    (0..n).each do |num|
        return true if 2 ** num == n
    end
    false
end

