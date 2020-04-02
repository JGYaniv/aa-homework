def my_reject(array, &prc)
    array.select do |el|
        !prc.call(el)
    end
end

def my_one?(array, &prc)
    passed_elements = array.select{|el| prc.call(el)}
    passed_elements.length == 1
end

def hash_select(hash, &prc)
    filtered_hash = {}
    hash.each do |k, v|
        if prc.call(k, v)
            filtered_hash[k] = v
        end
    end
    filtered_hash
end

def xor_select(array, prc1, prc2)
    array.select do |el|
        prc1_result = prc1.call(el)
        prc2_result = prc2.call(el)
        prc1_result != prc2_result
    end
end

def proc_count(value, procs)
    procs.count do |proc|
        proc.call(value)
    end
end