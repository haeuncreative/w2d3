class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
        @length = n
    end

    def []pos
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        count = 0
        @grid.flatten.each do |ele|
            if ele == :S 
                count += 1
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
        while self.num_ships < (@size / 4)
            row = rand(0...@length)
            col = rand(0...@length)
            if @grid[row][col] != :S 
                self[[row, col]] = :S 
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    ele = :N 
                elsif ele == :N || ele == :X 
                    ele = ele
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
    

end