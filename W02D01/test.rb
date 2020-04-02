class Car
    def initialize()
        @color = nil
    end

    def awesomeness
        @awesomeness = 100
        p @awesomeness
    end
end

car1 = Car.new
car1.awesomeness

class Car
    def awesomeness
        @awesomeness *= 2
        p "more #{@awesomeness}"
    end
end

# car2 = Car.new
# car2.awesomeness