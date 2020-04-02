def is_prime?(number)
    return false if number < 2
    (2...number).none?{|factor| number % factor == 0 }
end

def nth_prime(n)
    primes = []
    num = 2
    until primes.length == n
        primes << num if is_prime?(num)
        num += 1
    end
    primes[-1]
end

def prime_range(min, max)
    (min..max).select{|num| is_prime?(num)}
end


