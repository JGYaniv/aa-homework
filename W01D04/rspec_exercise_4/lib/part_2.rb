
def proper_factors(num)
    factors = []

    (1...num).each { |n| factors << n if num % n == 0 }

    return factors
end

def aliquot_sum(number)
    factors = proper_factors(number)
    factors.inject(&:+)
end

def perfect_number?(number)
    aliquot_sum(number) == number
end

def ideal_numbers(n)
    numbers = []
    i = 0
    while numbers.length < n
        numbers << i if perfect_number?(i)
        i+=1
    end

    numbers
end