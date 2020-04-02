def palindrome?(word)
    i = 0
    while i < word.length
        frontLetter = word[i]  
        backLetter = word[-1 - i]  

        return false if frontLetter != backLetter
        i += 1
    end
    true
end

def substrings(str)
    sub_str = []
    i = 0
    while i < str.length
        j = i
        while j < str.length
            sub_str << str[i..j]
            j += 1
        end
        i += 1
    end
    sub_str
end

def palindrome_substrings(word)
    solution = []
    newWords = substrings(word)
    newWords.each {|word| solution << word if palindrome?(word) && word.length > 1}
    solution
end