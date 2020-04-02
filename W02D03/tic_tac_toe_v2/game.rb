require_relative './board.rb'
require_relative './human_player.rb'

class Game
    def initialize(n, *players)
        @players = players.map do |player_sym|
            HumanPlayer.new(player_sym) 
        end
        @current_player = @players.first
        @board = Board.new(n)
    end

    def switch_turn
        current_idx = @players.index(@current_player)
        new_idx = (current_idx + 1) % @players.length
        @current_player = @players[new_idx]
    end

    def play
        while @board.empty_positions?
            @board.print
            move = @current_player.get_position
            @board.place_mark(move, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                print "\nSweet job #{@current_player.mark}!\n"
                return true
            else
                switch_turn
            end
        end

        print "\ndraw\n"
    end
end

# game = Game.new(4, :X, :O, :Z, :N)
# game.play