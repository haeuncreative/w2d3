class Player
    def get_move
        p 'enter a position with coordinates separated with a space like `4 7`'
        input = gets.chomp
        raw = input.split(" ")
        position = raw.map {|ele| ele.to_i}

    end
end
