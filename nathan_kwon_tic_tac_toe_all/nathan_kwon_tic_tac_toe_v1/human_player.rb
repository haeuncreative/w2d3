# HumanPlayer
# The HumanPlayer class is responsible for holding information 
# about the user and prompting them to enter a position for gameplay.

class HumanPlayer

# HumanPlayer#initialize(mark_value)
# We'll allow a player to use any mark they like, so an 
# instance of HumanPlayer should have a instance variable 
# to store their mark. The value of this mark should be 
# provided as an argument when creating a new player. 
# Consider adding a getter method for the player's mark, 
# this may be useful later!
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        1.times do
            p "Please enter two numbers with a space between them, like so: '1 1'"
            input = gets.chomp
                pos = input.split(" ")
                return pos
        end
    end
end