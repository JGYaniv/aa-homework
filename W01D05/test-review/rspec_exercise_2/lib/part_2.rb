def palindrome?(word)
    reversed_word = ""
    word.each_char{|char| reversed_word = char + reversed_word}
    word == reversed_word
end

def substrings(word)
    substrings = []
    (0...word.length).each do |idx1|
        idx2 = idx1
        while idx2 < word.length
            substrings << word[idx1..idx2]
            idx2 += 1
        end
    end
    substrings
end

def palindrome_substrings(string)
    substrings(string).select{|sub_string| palindrome?(sub_string) && sub_string.length > 1}
end