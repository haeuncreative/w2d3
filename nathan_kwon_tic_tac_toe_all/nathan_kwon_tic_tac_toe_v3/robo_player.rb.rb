class RoboPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        p "#{@mark} is thinking... be patient"
        sleep(2)
        input = legal_positions.sample
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