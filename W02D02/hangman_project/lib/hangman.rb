require_relative "./dictionary.rb"

class Hangman
  DICTIONARY = MY_DICTIONARY
  attr_reader :attempted_chars, :remaining_incorrect_guesses, :computer_guesses
  attr_accessor :secret_word, :guess_word
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize()
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.length){"_"}
    @computer_guesses = 20
    @attempted_chars = []
    @remaining_incorrect_guesses = 20
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    matching_indices = []
    @secret_word.each_char.with_index do |letter, idx|
      matching_indices << idx if char == letter
    end
    matching_indices
  end

  def fill_indices(char, indices)
    indices.each do |idx|
      @guess_word[idx] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      print "that has already been attempted"
      false
    else
      @attempted_chars << char
      indices = get_matching_indices(char)
      if indices.empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, indices)

      end
      true
    end
  end
  
  def ask_user_for_guess
      print "Enter a char:"
      guess = gets.chomp
      try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      # puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0 || @computer_guesses == 0
      # puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
    
  end

  def computer_guess
        alpha = ["e", "t", "a", "o", "i", "n", "s", "r", "h", "d", "l", "u", "c", "m", "f", "f", "w", "g", "p", "b", "v", "k", "x", "q", "j", "z"]
        alpha.each do |i|
            if !already_attempted?(i)
                return self.computer_turn(i)
            end
        end
    end

    def computer_turn(char)
        @computer_guesses -= 1 if get_matching_indices(char).empty?

        if already_attempted?(char)
            puts "that has already been attempted"
            return false
        else
            @attempted_chars.push(char)
            indices = get_matching_indices(char) 
            fill_indices(char, indices)
            return true
        end
    end

end

