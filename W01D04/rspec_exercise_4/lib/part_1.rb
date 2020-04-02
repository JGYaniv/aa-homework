require 'byebug'
def my_reject(arr, &prc)
    arr.select{|el| !prc.call(el) }
end

def my_one?(arr, &prc)
    truthy = arr.select do |ele|
        prc.call(ele)
    end

    truthy.length == 1
end

def hash_select(hash, &prc) # { |k, v| "aeiou".include?(k) }
    newHash = {}
    hash.each do |k, v|
        if prc.call(k, v)
            newHash[k] = v
        end
    end
    newHash
end

#   even = Proc.new { |n| n.even? }
#   positive = Proc.new { |n| n > 0 }
#   xor_select([2, 5, 3, 7, 6, -8, -1], even, positive)

def xor_select(arr, prc1, prc2)
    arr.select do |ele| 

        (prc1.call(ele) || prc2.call(ele)) && 
        !(prc1.call(ele) && prc2.call(ele))
    end
end

#    expected collection contained:  [-8, 3, 5, 7]
#    actual collection contained:    [-8, 2, 3, 5, 6, 7]
#    the extra elements were:        [2, 6]

def proc_count(value, procs)
    count = 0
    procs.each do |prc|
        count += 1 if prc.call(value)
    end
    count
end


