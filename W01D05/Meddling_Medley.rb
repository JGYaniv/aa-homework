require "byebug"
# Meddling Medley
# This problem set will test your knowledge about the last few topics you explored. Like usual, the difficulty will ramp up as work through the set. Ready? Let's do it.

# The solution is available here, but please do not look at it until you have attempted all of the problems!

# Phase 1: Modest problems.
# duos
# Write a method duos that accepts a string as an argument and returns the count of the number 
# of times the same character appears consecutively in the given string.

def duos(string)
    count = 0
    (0...string.length-1).each do |i|
        count += 1 if string[i] == string[i+1]
    end
    count
end

# Examples

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

# sentence_swap
# Write a method sentence_swap that accepts a sentence and a hash as arguments. 
# The method should return a new sentence where every word is replaced with it's corresponding 
# value in the hash. If a word does not exist as a key of the hash, then it should remain unchanged.

def sentence_swap(sentence, swapper)
    sentence.split.map { |word| swapper.has_key?(word) ? swapper[word] : word }.join(' ')
end

# Examples

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

# hash_mapped
# Write a method hash_mapped that accepts a hash, a proc, and a block. The method should return a new hash where each key is the result of the original key when given to the block. Each value of the new hash should be the result of the original values when passed into the proc.

def hash_mapped(hash, value_fun, &key_fun)
    result = {}
    hash.each do |k, v|
        new_val = value_fun.call(v)
        new_key = key_fun.call(k)
        result[new_key] = new_val 
    end
    result
end

# Examples

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}

# counted_characters
# Write a method counted_characters that accepts a string as an argument. The method should return an array containing the characters of the string that appeared more than twice. The characters in the output array should appear in the same order they occur in the input string.

def counted_characters(string)
    counter = Hash.new(0)
    string.chars.each {|char| counter[char] += 1}
    counter.select {|k, v| v > 2}.keys
end


# Examples

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []


# triplet_true?
# Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating whether or not the string contains three of the same character consecutively.

def triplet_true(str)
    (0...str.length-2).any? do |idx|
        str[idx] == str[idx+1] && 
        str[idx] == str[idx+2]
    end
end

# Examples

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false


# energetic_encoding
# Write a method energetic_encoding that accepts a string and a hash as arguments. The method should return a new string where characters of the original string are replaced with the corresponding values in the hash. If a character is not a key of the hash, then it should be replaced with a question mark ('?'). Space characters (' ') should remain unchanged.

def energetic_encoding(string, hash)
    encoded = ""
    string.each_char do |char|
        if hash.has_key?(char)
            encoded += hash[char]
        elsif char == " "
            encoded += char
        else
            encoded += "?"
        end
    end
    encoded
end

# Examples

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

# uncompress
# Write a method uncompress that accepts a string as an argument. The string will be formatted so every letter is followed by a number. The method should return an "uncompressed" version of the string where every letter is repeated multiple times given based on the number that appears directly after the letter.

def uncompress(string)
    uncompressed_string = ""
    (0...string.length-1).each do |idx|
        if idx.even?
            uncompressed_string += string[idx] * string[idx+1].to_i
        end
    end
    uncompressed_string
end

# Examples

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# Phase 2: More difficult, maybe?

# conjunct_select
# Write a method conjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that return true when passed into all of the given procs.

def conjunct_select(array, *procs)
    array.select {|el| procs.all?{|prc| prc.call(el)}}
end

# Examples

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# convert_pig_latin
# Write a method convert_pig_latin that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def convert_pig_latin(sentence)
    pig_sentence = sentence.split.map do |word| 
        capitalized = word == word.capitalize ? true : false
        if capitalized
            convert_pig_latin_word(word).capitalize
        else
            convert_pig_latin_word(word)
        end
    end
    pig_sentence.join(' ')
end

def convert_pig_latin_word(word)
    first = first_vowel(word)
    if word.length < 3
        word
    elsif first == 0
        word + "yay"
    else
        word[first..-1] + word[0...first] + 'ay'
    end
end

def first_vowel(word)
    vowels = 'aeiou'
    word.chars.each.with_index { |char, i| return i if vowels.include?(char.downcase) }
end

# Examples

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# reverberate
# Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def reverberate(sentence)
    words = sentence.split
    mapped = words.map do |word|
        if word.length < 3
            word
        else
            reverb(word)
        end
    end
    mapped.join(' ')
end

def reverb(word)
    vowels = 'aeiou'
    if vowels.include?(word[-1].downcase)
        word + word.downcase
    else
        vowel_idx = 0
        word.chars.each_with_index do |char, idx|
            vowel_idx = idx if vowels.include?(char.downcase)
        end
        word + word[vowel_idx..-1].downcase
    end
end


# Examples

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

# disjunct_select
# Write a method disjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that return true when passed into at least one of the given procs.

def disjunct_select(array, *procs)
    array.select {|ele| procs.any?{|prc| prc.call(ele)}}
end

# Examples

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ["ace", "dog", "apple", "teeming", "boot"]
# alternating_vowel
# Write a method alternating_vowel that accepts a sentence as an argument. The method should return a new sentence where the words alternate between having their first or last vowel removed. For example:

# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.

def alternating_vowel(sentence)
    words = sentence.split
    dumbWords = words.map.with_index do |word, idx|
        vowels = vowel_indices(word)
        if vowels.empty?
            word
        else
            if idx.even?
                first = vowel_indices(word).first
                word[0...first] + word[first+1..-1]
            else
                last = vowel_indices(word).last
                word[0...last] + word[last+1..-1]
            end
        end
    end
    dumbWords.join(" ")
end

def vowel_indices(word)
    vowels = %w(a e i o u)
    (0...word.length).select { |idx| vowels.include?(word[idx].downcase) }
end

# Examples

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"
# silly_talk
# Write a method silly_talk that accepts a sentence as an argument. The method should translate each word of the sentence according to the following rules:

# if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def silly_talk(sentence)
    words = sentence.split.map do |word|
        vowels = vowel_indices(word)
        if vowels.empty?
            word
        elsif vowels.last == word.length - 1
            word + word[-1]
        else
            new_word = ''
            word.each_char.with_index do |char, i|
                if vowels.include?(i)
                    new_word += char + "b" + char.downcase
                else
                    new_word += char
                end
            end
            new_word
        end
    end

    words.join(' ')
end

# Examples

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

# compress
# Write a method compress that accepts a string as an argument. The method should return a "compressed" version of the string where streaks of consecutive letters are translated to a single appearance of the letter followed by the number of times it appears in the streak. If a letter does not form a streak (meaning that it appears alone), then do not add a number after it.

def compress(string)
    compressed = ''

    i = 0
    while i < string.length
        
        j = i
        count = 1
        while j < string.length
            if string[i] != string[j+1]
                if count == 1
                    compressed += string[i] 
                else
                    compressed += string[i] + count.to_s
                end
                break
            else
                count += 1
            end
            j += 1

        end
        i += count
    end

    compressed
end

# def compress(string)
#     str = ""
#     count = 1
#     (0...string.length).each do |i|
#         if string[i] == string[i+1]
#             count += 1
#         else
#             str += string[i] + count.to_s if count > 1
#             str += string[i] if count == 1
#             count = 1
#         end
#     end
#     str
# end

# Examples

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"