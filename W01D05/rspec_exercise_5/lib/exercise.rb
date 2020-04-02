
require 'byebug'
def zip(*arrays)
    result = Array.new(arrays.first.length){Array.new()}
    arrays.each do |array|
        array.each_with_index do |el, idx|
            result[idx] << el
        end
    end
    result
end

def prizz_proc(arr, prc_1, prc_2)
    arr.select do |ele|
        truth_1 = prc_1.call(ele)
        truth_2 = prc_2.call(ele)
        # (truth_1 || truth_2) && !(truth_1 && truth_2)
        truth_1 != truth_2
    end
end

def zany_zip(*arrays)
    max_length = arrays.map(&:length).max 
    zipped = Array.new(max_length){Array.new()}
    (0...max_length).each do |i|
        arrays.each.with_index do |arr, idx|
            zipped[i] << arr[i]
        end
    end
    zipped
end

def maximum(array, &prc)
    max = nil
    max_result = 0
    array.each do |el|
       if prc.call(el) >= max_result
            max = el
            max_result = prc.call(el)
       end
    end
    max
end

def my_group_by(arr, &prc)
    answer = Hash.new { |h, k| h[k] = [] }
    arr.each { |el| answer[prc.call(el)] << el }
    answer
end

def max_tie_breaker(arr, tie_breaker, &judge)
    leader = nil
    arr.each do |el|
        leader ||= el
        leader_score = judge.call(leader)
        contested = judge.call(el)
        if leader_score < contested
            leader = el
        elsif leader_score == contested
            leader_score = tie_breaker.call(leader)
            contested = tie_breaker.call(el)
            leader = leader_score < contested ? el : leader
        end
    end
    leader
end

def silly_syllables(sentence)
    new_words = sentence.split(' ').map do |word|
        vowelIndices = vowel_finder(word)
        if vowelIndices.length < 2
            word
        else
            first = vowelIndices.first
            last = vowelIndices.last
            word[first..last]
        end
    end
    new_words.join(" ")
end

def vowel_finder(word) #[firstIdx, secondIdx]
    vowels = %w(a e i o u) # ["a", "e", "i", "o", "u"]
    chars = word.chars
    (0...chars.length).select do |idx|
        vowels.include?(chars[idx])
    end
end