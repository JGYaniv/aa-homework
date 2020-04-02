require 'prime'

class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def occupants
        @occupants
    end

    def capacity
        @capacity
    end

    def full?
        occupants.length >= capacity
    end

    def available_space
        capacity - occupants.length
    end

    def add_occupant(string)
        if full?
            false
        else
            @occupants << string
            true
        end
    end
end
