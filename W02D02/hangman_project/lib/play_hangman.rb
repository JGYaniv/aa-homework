# No need to change or write any code in this file.
#
# After you complete all specs, you can simulate your hotel by
# running this file with `ruby lib/play_hangman.rb` in your terminal!

require_relative "hangman"
require_relative "hangman_ai"

round = 1
player1_score = 0
player2_score = 0

until round == 3
  puts "\n\n      ----ROUND: #{round}-----\n\n"
  hangman1 = Hangman.new()
  hangman2 = Hangman.new()
  hangman2.guess_word = Array.new(hangman1.secret_word.length){"_"}
  hangman2.secret_word = hangman1.secret_word
  ai1 = AiPlayer.new(hangman1)

  until hangman1.game_over? || hangman2.game_over?
    #ai-1 guesses
    puts "AI - 1"
    puts "Incorrect Guesses Remaining: #{hangman1.remaining_incorrect_guesses}"
    print "\n" until hangman1.try_guess(ai1.makes_a_guess(hangman1))
    puts "Word: #{hangman1.guess_word}"
    puts "Attempted Chars: #{hangman1.attempted_chars}"
    print "\n\n"

    #ai-2 guesses
    puts "AI - 2"
    puts "Incorrect Guesses Remaining: #{hangman2.computer_guesses}"
    print "\n" until hangman2.computer_guess
    puts "Word: #{hangman2.guess_word}"
    puts "Attempted Chars: #{hangman2.attempted_chars}"
    print "\n\n"
  end

  round +=1

  if hangman1.win? && hangman2.win?
    puts "win-win"
  elsif hangman1.win?
    puts "player 1 wins"
    player1_score +=1
  elsif hangman2.win?
    puts "player 2 wins"
    player2_score +=1
  else
    puts "tie"
  end
end

puts "\n\nPlayer1: #{player1_score}\nPlayer2: #{player2_score}\n\n"

