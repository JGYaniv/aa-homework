#accepts two numbers as args and returns average
def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(num_array)
  sum = num_array.inject do |acc, ele|
    acc += ele
  end

  divisor = num_array.length.to_f

  sum / divisor
end

def repeat(string, num)
    newStr = ""
    num.times {newStr += string}

    newStr
end

def yell(message)
  message.upcase + "!"
end

def alternating_case(string)
    words = string.split
    updatedWords = []

    words.each_with_index do |word, idx|
        if idx.even?
            updatedWords << word.upcase
        else
            updatedWords << word.downcase
        end
    end

    updatedWords.join(" ")
end