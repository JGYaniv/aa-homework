def hipsterfy(word)
  vowels = "aeiou"
  reversed_word = word.reverse
  last_vowel = nil

  reversed_word.each_char.with_index do |char, idx|
    if vowels.include?(char.downcase)
      last_vowel = word.length - idx - 1
      break
    end
  end

  return word if last_vowel == nil

  word[0...last_vowel] + word[last_vowel + 1..-1]
end

def vowel_counts(string)
    new_hash = Hash.new(0)
    vowels = "aeiou"
    string.downcase.each_char do |char|
        if vowels.include?(char)
            new_hash[char] += 1
        end
    end

    new_hash
end

def caesar_cipher(message, cipher)
  alpha = ("a".."z").to_a

  encrypted_message = ""

  message.downcase.each_char do |char|
    if alpha.include?(char)
      current_index = alpha.index(char)
      new_index = (current_index + cipher) % 26
      encrypted_message += alpha[new_index]
    else
      encrypted_message += char
    end
  end

  encrypted_message
end

