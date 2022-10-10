class Board
    
    def initialize(l)
        @grid = Array.new(l) {Array.new(l, '_')}
        @length = l
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
        if empty_valid_check?(pos)
            @grid[pos[0]][pos[1]] = mark
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
        border = '-'
        @length.times {border += '----'}
        puts border
        @grid.each do |row|
            print_row = "| "
            row.each do |ele|
                print_row += "#{ele} | "
            end
            puts print_row
            puts border
        end
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