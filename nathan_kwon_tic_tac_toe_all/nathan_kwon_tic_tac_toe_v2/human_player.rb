class HumanPlayer
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