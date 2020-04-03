class Array
    def my_inject(accumulator = nil, &prc)
        accumulator ||= self.shift
        self.each do |ele|
            accumulator = prc.call(accumulator, ele)
        end
        accumulator
    end
end

p [1,2,3].my_inject{|acc, el| acc += el }
p [1,2,3].my_inject(100){|acc, el| acc += el }