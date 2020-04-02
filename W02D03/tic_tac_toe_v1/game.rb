require_relative './board.rb'
require_relative './human_player.rb'

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        elsif @current_player == @player_2
            @current_player = @player_1
        end
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

game = Game.new(:X, :O)
game.play