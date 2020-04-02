require 'byebug'
require_relative "player.rb"
require_relative "ai-player.rb"
class Game
    attr_reader :current_player, :fragment, :players, :dictionary
    
    def initialize(*players)
        if players.empty?
            @players = [Player.new("Player"),AiPlayer.new("Bot")]
        else
            @players = players.map{|player| Player.new(player)}
        end
        @fragment = ""
        @current_player = @players.first #stores Player instance
        @dictionary = generate_dictionary
    end

    def generate_dictionary
        file = File.open('./dictionary.txt','r')
        dictionary = [] 
        dictionary_array = file.readlines
        dictionary_array.each do |word| 
            dictionary << word.chomp 
        end
        dictionary
    end

    def next_player
        i = @players.index(@current_player) + 1
        @current_player = @players[i % @players.length]
    end

    def take_turn
        letter = @current_player.get_letter(self)
        
        until valid_letter?(letter)
            letter = @current_player.get_letter(self)
        end

        @fragment += letter

        if valid_play?
            next_player
            return true
        else
            @current_player.score = @current_player.score + 1
            if @current_player.score >= 5
                puts "Sorry #{@current_player.name}, you're GHOSTED ;)"
                @players.delete(@current_player)
            end
            return false
        end

    end

    def valid_letter?(letter)
        alpha = ("a".."z").to_a
        alpha.include?(letter) && letter.length == 1 && letter.is_a?(String)
    end

    def valid_play?

        word_count = 0
        @dictionary.each do |word|
            return false if word == @fragment
            if word[0...@fragment.length] == @fragment
                word_count += 1
            end
        end

        word_count > 0 ? true : false
    end

    def play_round
        puts @fragment

        while take_turn
            puts @fragment
        end

        puts @fragment
        puts "#{@current_player.name} YOU LOOSE"
    end
    
    def run
        #need to implement new runtime logic to account for multiplayer
        while @players.length > 1
            @players.each do |player|
                print "\n#{player.name}: #{"GHOST"[0...player.score]}"
            end
            play_round
            @fragment = ""
        end

        puts "Congratulations #{@players.first.name}, you are the WIINNNNERRR!!!\n"
    end
end

# ======> wtf????? pt. 2: 
if __FILE__ == $PROGRAM_NAME 
# <======
    game = Game.new
    game.run
end