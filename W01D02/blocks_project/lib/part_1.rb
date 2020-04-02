def select_even_nums(arrayOfNumbers)
    arrayOfNumbers.select { |number| number % 2 == 0 }
end

def reject_puppies(dogs)
  dogs.reject do |dog_hash|
    dog_hash["age"] <= 2
  end
end

def count_positive_subarrays(twoDimensionalArray)
    twoDimensionalArray.count do |subArray|
        subArray.sum > 0
    end
end

def aba_translate(word)
  vowel_array = ["a", "e", "i", "o", "u"]

  translated_word = ""

  word.each_char do |char|
    if vowel_array.include?(char)
      translated_word += char + "b" + char
    else
      translated_word += char
    end
  end

  translated_word
end

def aba_array(words)
    words.map{|word| aba_translate(word)}
end

