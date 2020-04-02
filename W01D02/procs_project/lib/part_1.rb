def my_map(arr, &prc)
    newArr = []
    arr.each {|el| newArr << prc.call(el)}
    newArr
end

def my_select(arr, &prc)
    newArr = []
    arr.each {|el| newArr << el if prc.call(el)}
    newArr
end

def my_count(arr, &prc)
    count = 0
    arr.each {|el| count += 1 if prc.call(el)}
    count
end

def my_any?(arr, &prc)
    arr.each{|el| return true if prc.call(el)}
    false
end

def my_all?(arr, &prc)
    alright = true
    arr.each{|el| alright = false unless prc.call(el)}
    alright
end

def my_none?(arr, &prc)
    arr.each{|el| return false if prc.call(el)}
    true
end