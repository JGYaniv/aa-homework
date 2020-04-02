def hipsterfy(word)
    vowels = "aeiou"
    letters = word.chars
    last_vowel_index = nil
    letters.each_with_index do |letter, idx|
        if vowels.include?(letter.downcase)
            last_vowel_index = idx
        end
    end
    return word unless last_vowel_index
    hispterfied_word = word[0...last_vowel_index] + word[last_vowel_index+1..-1]
end

def vowel_counts(word)
    vowels = "aeiou"
    vowel_count = Hash.new(0)
    word.chars.each do |char|
        vowel_count[char.downcase] += 1 if vowels.include?(char.downcase)
    end
    vowel_count
end

def caesar_cipher(message, cipher)
    alpha = ("a".."z").to_a
    characters = message.chars
    encrypted_letters = characters.map do |char|
        if alpha.include?(char)
            letter_value = alpha.index(char)
            alpha[(letter_value + cipher) % 26]
        else
            char
        end
    end
    encrypted_letters.join("")
end