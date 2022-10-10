require_relative "code"

class Mastermind

    def initialize(num)
        @secret_code = Code.random(num)
    end

    def print_matches(code)
        num_1 = @secret_code.num_exact_matches(code)
        num_2 = @secret_code.num_near_matches(code)
        p "The amount of exact matches is #{num_1}."
        p "The amount of near matches is #{num_2}."
    end

    def ask_user_for_guess
        p "Enter a code."
        input = gets.chomp
        guess = Code.from_string(input)
        print_matches(guess)
        return @secret_code == guess
    end
end
