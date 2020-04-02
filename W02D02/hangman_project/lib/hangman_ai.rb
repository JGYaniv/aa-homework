require_relative './dictionary.rb'

class AiPlayer
  def initialize(game_state)
    @game_state = game_state
    @possible_words = MY_DICTIONARY.dup
    @letter_weight = calculate_letter_weight
  end
    
  def calculate_letter_weight
    letter_weight = Hash.new(0)
    @possible_words.each do |word|
      word.each_char do |char|
        letter_weight[char] += 1
      end
    end

    letter_weight
  end

  def reduce_possible
    current_guess_word = @game_state.guess_word
    word_length = @game_state.guess_word.length
    
    @possible_words.select! do |word| 
      word.length == word_length &&
      matching_letters?(word)
    end
  end

  def matching_letters?(word)
    #returns true if the letters correctly guessed so far match the indices of word
    current_guess_word = @game_state.guess_word
    word.each_char.with_index do |char, idx|
      current_letter = current_guess_word[idx]
      if current_letter != char && current_letter != "_"
        return false
      end
    end
    true
  end

  def makes_a_guess(new_game_state)
    @game_state = new_game_state
    reduce_possible

    letters = @possible_words.sample.chars
    not_guessed_letters = filter_guessed_letters(letters)

    select_best_letter(not_guessed_letters)
  end

  def filter_guessed_letters(letters)
    filtered = letters.reject do |letter|
      @game_state.attempted_chars.include?(letter)
    end
    debugger if filtered.include?(nil)
    filtered
  end

  def sort_letters_by_weight(letters)
    calculate_letter_weight
    letters.sort{|letter| @letter_weight[letter]}
  end  

  def select_best_letter(letters)
    sort_letters_by_weight(letters).last
  end
end
