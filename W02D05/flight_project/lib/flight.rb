class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(pass_instance)
        if pass_instance.has_flight?(@flight_number) && !full?
            @passengers << pass_instance
        end
    end

    def list_passengers
        @passengers.map {|pass_instance| pass_instance.name}
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(pass_instance)
        board_passenger(pass_instance)
    end
end