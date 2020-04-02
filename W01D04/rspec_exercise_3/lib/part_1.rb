def is_prime?(number)
    return false if number < 2
    (2...number).each do |num|
        return false if number % num == 0
    end
    true
end

def nth_prime(n)   
    primes = []

    i = 0
    while primes.length < n
        primes << i if is_prime?(i)

        i += 1
    end

    primes.last
end

def prime_range(min, max)
    (min..max).select {|num| is_prime?(num)}
end

def element_count()
    
end