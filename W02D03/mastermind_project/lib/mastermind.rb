require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
        @attempts = 0
    end

    def print_matches(code)
        p @secret_code.num_exact_matches(code)
        p @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        p "Enter a code"
        guess_code = gets.chomp
        code = Code.from_string(guess_code)
        print_matches(code)
        @attempts += 1
        p "Num attempts: #{@attempts}" if @secret_code == code      
    end
end
