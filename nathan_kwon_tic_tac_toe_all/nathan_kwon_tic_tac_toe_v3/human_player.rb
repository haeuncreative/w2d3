class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        1.times do
            p "Please enter two numbers with a space between them, like so: '1 1'"
            input = gets.chomp
            pos = input.split(" ")
            mapped = pos.map {|ele| ele.to_i}
            if legal_positions.include?(mapped) && input_valid?(pos)
                return mapped
            else
                p "it's illegal for you to ask me that. pick something else."
                redo
            end
        end
    end

    def input_valid?(input)
        alphabet = ('a'..'z').to_a
        special_chars = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')']
        pos = input
        if input.length != 2
            return false
        elsif input.any? {|ele| ele.to_s.length != 1}
            return false
        elsif input.any? {|ele| alphabet.include?(ele.downcase)}
            return false
        elsif input.any? {|ele| special_chars.include?(ele)}
            return false
        elsif input.any? {|ele| ele.to_i.is_a?(Integer) == false}
            return false
        end
        return true
    end
end