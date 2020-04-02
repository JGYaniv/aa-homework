def zip(*arrays)
    zipped = Array.new(arrays[0].length){Array.new}
    arrays.each do |array|
        array.each_with_index do |el, idx|
            zipped[idx] << el
        end
    end
    zipped
end

def prizz_proc(array, proc1, proc2)
    array.select do |el|
        proc1.call(el) != proc2.call(el)
    end
end

def zany_zip(*arrays)
    max_length = arrays.map(&:length).sort.last
    zipped = Array.new(max_length){Array.new(arrays.length)}
    arrays.each_with_index do |row, row_idx|
        row.each_with_index do |el, el_idx|
            zipped[el_idx][row_idx] = el
        end
    end

    zipped
end

def maximum(array, &prc)
    mapped_array = array.map{|el| prc.call(el)}
    max_idx = 0
    mapped_array.each_with_index {|el, idx| max_idx = idx if el >= mapped_array[max_idx]}
    array[max_idx]
end

def my_group_by(array, &prc)
    result = Hash.new{|h,k| h[k] = []}
    array.each do |el|
        result[prc.call(el)] << el
    end
    result
end

def max_tie_breaker(array, proc, &prc)
    return nil if array.empty?
    maximum = array.first
    array.each do |el|
        if prc.call(el) > prc.call(maximum)
            maximum = el
        elsif prc.call(el) == prc.call(maximum)
            if proc.call(el) > proc.call(maximum)
                maximum = el
            end
        end 
    end
    maximum
end

def silly_syllables(sentence)
    words = sentence.split
    mapped_words = words.map do |word|
        vowel_indices = vowel_indices(word)
        if vowel_indices.length < 2
            word
        else
            first = vowel_indices.first
            last = vowel_indices.last
            word[first..last]
        end
    end
    mapped_words.join(" ")
end

def vowel_indices(word)
    vowels = "aeiou"
    indices = []
    word.chars.each_with_index do |char, idx|
        indices << idx if vowels.include?(char.downcase)
    end
    indices
end
