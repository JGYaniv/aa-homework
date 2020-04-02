# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    i = 0
    compressed = ""

    while i < str.length
        char = str[i]
        count = 0
            
        while str[i] == char
            count += 1
            i += 1
        end
        
        if count > 1
            compressed += "#{count}#{char}"
        else
            compressed += char
        end

    end

    compressed
end


p compress_str_v2("aaabbc")        # => "3a2bc"
p compress_str_v2("xxyyyyzz")      # => "2x4y2z"
p compress_str_v2("qqqqq")         # => "5q"
p compress_str_v2("mississippi")   # => "mi2si2si2pi"
