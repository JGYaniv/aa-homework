#get_letter => a single letter character
#score => return the score
class Player
    attr_reader :name
    attr_accessor :score
    def initialize(name)
        @name = name
        @score = 0

    end

    def get_letter(game_state)
        print "\nEnter a letter #{name}: " 
        gets.chomp
    end
    
end