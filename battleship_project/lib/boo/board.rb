require 'byebug'
class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
        @length = n
    end
  
    def[](pos)
        @grid[pos[0]][pos[1]]
    end

    def[]=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        side = (@grid.length - 1)
        count = 0
        (0..side).each do |row|
            (0..side).each do |col|
                if @grid[row][col] == :S
                    count += 1
                end
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        fourth = (@size / 4) 
        
        while @grid.flatten.count(:S) < fourth
            row = rand(0...@length)
            col = rand(0...@length)
            if @grid[row][col] != :S
                @grid[row][col] = :S 
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row| 
            row.map do |ele|
                if ele == :S || ele == :N
                    ele = :N 
                elsif ele == :X
                    ele = ele
                end
            end
        end
    end

end
