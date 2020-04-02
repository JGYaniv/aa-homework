require_relative 'card.rb'
require_relative 'board.rb'
require_relative 'player.rb'
# require_relative 'ai-player.rb'

class Game
    def initialize(size=4)
        @player = Player.new()
        @board = Board.new(size) #make sure it is a legit number
        @board.randomize
        @previous_guess = nil
    end

    def play
        while @board.won? == false
            @board.render

            #picks first card
            guess1 = @player.get_guess
            until valid_guess?(guess1)
                puts "try again, pick a better number fool =ß ! It needs to be 0-#{@board.grid.length - 1}..."
                print "\nChoose a card (ie 0 1): "
                guess1 = gets.chomp #"0 1"
            end
            pos1 = guess1.split.map(&:to_i)
            @board.reveal(pos1)
            @board.render   
       
            #picks second card
            print "\nChoose a matching card (ie 2 1): "
            guess2 = @player.get_guess  
            until valid_guess?(guess1)
                puts "try again, pick a better number fool =ß ! It needs to be 0-#{@board.grid.length - 1}..."
                print "\nChoose a card (ie 0 1): "
                guess2 = gets.chomp #"0 1"
            end
            pos2 = guess2.split.map(&:to_i)  
            @board.reveal(pos2)
            @board.render

            row1, col1 = pos1
            row2, col2 = pos2
            card1 = @board.grid[row1][col1]
            card2 = @board.grid[row2][col2]
            unless card1 == card2
                sleep(1)
                card1.hide
                card2.hide
            end
        end
    end

    def valid_guess?(guess_string) #guess => "0 1" # guess => "birthday cake"
        pos = guess_string.split
        # debugger 

        return false unless pos.is_a?(Array) && pos.length == 2
        nums = (0..9).to_a.map(&:to_s) # nums => ["0","1", "2", "3"...]

        return false unless pos.all?{|ele| nums.include?(ele)}

        # debugger
        pos.each do |idx|
            fixed_idx = idx.to_i
            unless fixed_idx >= 0 && fixed_idx < @board.grid.length
                return false
            end
        end
        true
    end
end

if __FILE__ == $PROGRAM_NAME
    g = Game.new(2)
    g.play

end
