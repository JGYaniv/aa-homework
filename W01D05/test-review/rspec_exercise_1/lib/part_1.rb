def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(numbers)
    numbers.inject(&:+) / numbers.length.to_f
end

def repeat(message, repeat_num)
    # (0...repeat_num).inject(""){|repeated_message, el| repeated_message + message}
    Array.new(repeat_num){message}.inject(&:+) || ""
end

def yell(message)
    message.chars.map(&:upcase).join("") + "!"
end

def alternating_case(sentence)
    words = sentence.split
    mapped_words = words.map.with_index do |word, idx| 
        idx.even? ? word.upcase : word.downcase
    end
    mapped_words.join(" ")
end
