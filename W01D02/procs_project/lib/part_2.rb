def reverser(string, &prc)
    reversed = ""
    string.chars.each{|char| reversed = char + reversed }
    prc.call(reversed)
end

def word_changer(sentence, &prc)
    words = sentence.split
    words.map{|word| prc.call(word)}.join(" ")
end

def greater_proc_value(num, proc1, proc2)
    value1 = proc1.call(num)
    value2 = proc2.call(num)
    value1 > value2 ? value1 : value2
end

def and_selector(array, proc1, proc2)
    array.select do |el|
        proc1.call(el) && proc2.call(el)
    end
end

def alternating_mapper(array, proc1, proc2)
    alternatingArray = []
    array.each_with_index do |el, idx|
        nextEl = (idx.even? ? proc1.call(el) : proc2.call(el))
        alternatingArray << nextEl
    end
    alternatingArray
end

