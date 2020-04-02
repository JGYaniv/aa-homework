class Test
    attr_accessor :parent_test, :sub_tests
    def initialize(name)
        @name = name
        @parent_test = nil
        @sub_tests = {}
    end

    def add_sub_test(name)
        sub_test = Test.new(name)
        sub_test.parent_test = self
        @sub_tests[name] = sub_test
        sub_test
    end
end

def quick_sort(arr)
    return arr if arr.length <= 1
    mid_idx = arr.length / 2
    mid_val = arr[arr.length / 2]
    left = []
    right = []
    arr.each_with_index do |el, idx|
        unless idx == mid_idx
            if el < mid_val
                left << el
            else
                right << el
            end
        end
    end
    quick_sort(left) + [mid_val] + quick_sort(right)
end

arr1 = [1,8,9,6,3,4,7,1,2,3]
p quick_sort(arr1) == arr1.sort

arr2 = [18,2,7,89,17,23,729,8,1,3]
p quick_sort(arr2) == arr2.sort