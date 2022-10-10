# Board
# The Board class is responsible for adding a player's marks, 
# checking for winners, and printing the game board. A board 
# instance must have an attribute to represent the grid. For 
# simplicity, give the grid the dimensions of classic tic-tac-toe, 3x3.

class Board
    
    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
        @length = 3
    end

    def grid
        @grid
    end

    def length
        @length
    end

    def valid?(pos)
        row = pos[0]
        col = pos[1]

        if row >= @length || col >= @length
            return false
        else
            return true
        end
    end

    def empty?(pos)
        row = pos[0]
        col = pos[1]

        if @grid[row][col] != '_'
            return false
        else
            return true
        end
    end

    def place_mark(pos, mark)
        1.times do        
            if empty_valid_check?(pos)
                @grid[pos[0]][pos[1]] = mark
            # elsif !empty?(pos) || !valid?(pos)
                # return false
                # p "yo, that's not cool homie. try again :("
                # sleep(2)
                # system('clear')
                # redo   
            end
        end
    end

    def empty_valid_check?(pos)
        if valid?(pos) && empty?(pos)
            return true
        else
            return false
        end
    end

    def print
        puts '-------------'
        puts "| #{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]} |"
        puts '-------------'
        puts "| #{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]} |"
        puts '-------------'
        puts "| #{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]} |"
        puts '-------------'
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all? {|ele| ele == mark}
                return true
            end
        end
        return false
    end

    def win_col?(mark)
        count = 0
        (0...@length).each do |col|
            count = 0
            (0...@length).each do |row|
                if @grid[row][col] == mark
                    count += 1
                end
            end
            if count == @length
                return true
            end
        end
    return false
    end

    def win_diagonal?(mark)
        if up_down?(mark) || down_up?(mark)
            return true
        else
            return false
        end
    end

    def up_down?(mark)
        count = 0
        i = 0
        while i < @length
            if @grid[i][i] == mark
                count += 1
                i += 1
            else
                i += 1
            end
        end
        
        if count == @length
            return true
        end

    return false

    end

    def down_up?(mark)
        count = 0
        i = 0
        j = @length - 1
        while i < @length
            if @grid[i][j] == mark
                count += 1
                i += 1
                j -= 1
            else
                i += 1
                j -= 1
            end
        end
        
        if count == @length
            return true
        end

    return false

    end

    def win?(mark)
        if win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
            return true
        else
            return false
        end
    end

    def empty_positions?
        so_is_there = @grid.flatten
        so_is_there.any? {|ele| ele == '_'}
    end
end