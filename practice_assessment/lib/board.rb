require 'byebug'
class Board

    def self.build_stacks(num)
        Array.new(num) {Array.new}
    end

    attr_reader :max_height

    def initialize(num, max_height)
        if num < 4 || max_height < 4
            raise 'rows and cols must be >= 4'
        end
        @max_height = max_height
        @stacks = Board.build_stacks(num)

    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def add(token, index)
        if @stacks[index].length < @max_height
            @stacks[index] << token
            return true
        else
            return false
        end
    end

    def horizontal_winner?(token)
        (0...max_height).each do |i|
            count = 0
            @stacks.each do |stack|
                if stack[i] == token
                    count += 1
                end
                if count == @stacks.length
                    return true
                end
            end
        end
        return false
    end

    def vertical_winner?(token)
        @stacks.any? {|stack| is_it_gucci(stack, token)}
    end

    def winner?(token)
        if horizontal_winner?(token) || vertical_winner?(token)
            return true
        else
            return false
        end
    end

    def is_it_gucci(array, token)
        array.all? {|ele| ele == token}
    end
end
