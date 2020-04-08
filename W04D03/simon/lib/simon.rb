class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    unless @game_over
      show_sequence
      require_sequence
      round_success_message
      @sequence_length += 1
      
    end
  end

  def show_sequence
    add_random_color
    p @seq
  end

  def require_sequence
    print "\nWhat's the sequence?"
    guess = gets.chomp.split
    guess == @seq ? true : false
  end

  def add_random_color
    colors = %w(red blue yellow green)
    @sequence_length.times do
      @seq << colors.sample
    end
  end

  def round_success_message
    puts "Good job!"
  end

  def game_over_message
    puts "You're down for today bud."
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end
