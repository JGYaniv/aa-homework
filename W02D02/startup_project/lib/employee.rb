class Employee
    attr_reader :name, :title
    def self.investors
        ["Bob", "Joe", "Wendy"]
    end

    def initialize(name, title)
        @name = name
        @title = title
        @earnings = 0
    end

    def pay(amount)
        @earnings += amount
    end
end
