def proper_factors(number)
    (1...number).select {|num| number % num == 0}
end

def aliquot_sum(number)
    proper_factors(number).inject(&:+)
end

def perfect_number?(number)
    number == aliquot_sum(number)
end

def ideal_numbers(number)
    ideals = []
    i = 0
    until ideals.length == number
        ideals << i if perfect_number?(i)
        i += 1
    end
    ideals
end