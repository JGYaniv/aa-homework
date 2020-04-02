class AiPlayer
    attr_reader :name
    attr_accessor :score
    def initialize(name)
        @name = name
        @score = 0
        @game_state = nil
    end

    def get_letter(game_state)
        #returns letter
        @game_state = game_state
        puts "what a dumb choice #{@game_state.fragment}.. let me think a second..."
        sleep(1)
        best_words.sample[game_state.fragment.length] || possible_words.sample[game_state.fragment.length]
    end

    def possible_words
        current_fragment = @game_state.fragment
        possible_words = @game_state.dictionary.select do |word|
            word[0...current_fragment.length] == current_fragment
        end
    end

    def best_words
        current_fragment = @game_state.fragment

        possible_words = @game_state.dictionary.select do |word|
            word[0...current_fragment.length] == current_fragment
        end

        possible_words.select do |word|
            (word.length - current_fragment.length) % @game_state.players.length != 1
        end
    end

end