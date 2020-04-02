require_relative "board"
require_relative "player"

class Battleship
    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size / 2
    end

    def board
        @board
    end

    def player
        @player
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0 
            p "You lose" 
            true
        else
            false
        end
    end
    

    def win?
        if @board.num_ships <= 0
            p "You win" 
            true
        else
            false
        end
    end
    
    def game_over?
        win? || lose?
    end

    def turn 
        if @board.attack(@player.get_move)
        else
            @remaining_misses -= 1
        end
        @board.print
        p @remaining_misses
    end
end
