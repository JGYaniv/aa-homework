class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        p "Player #{@mark}: Enter two numbers with a space in between (EX: 0 1): "
        positions = gets.chomp
        positions = positions.split(" ").map {|ele| ele.to_i }

        unless legal_positions.include?(positions)
            print "Only 2 numbers should be input"
            p "Player #{@mark}: Enter two numbers with a space in between (EX: 0 1): "
            positions = gets.chomp
            positions = positions.split(" ").map {|ele| ele.to_i }
        end
        
        return positions
    end

end

#hellyo