class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Player #{@mark}: Enter two numbers with a space in between (EX: 0 1): "
        positions = gets.chomp
        positions = positions.split(" ").map {|ele| ele.to_i }

        if positions.length != 2
            raise "Only 2 numbers should be input"
            return false
        end
        # if !positions.all? {|ele| ele < 3 && ele > 0 } 
        #     raise "Numbers should be less than 3 and greater than 0"
        #     return false
        # end 
        return positions
    end

end

#hellyo