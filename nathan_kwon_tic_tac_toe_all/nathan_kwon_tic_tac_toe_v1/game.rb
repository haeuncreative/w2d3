require_relative 'board.rb'
require_relative 'human_player.rb'

#i edited the error messages from the board and player parts
#so i could make the UI a little cleaner, at the expense of a bulky
#code at the end, but i hope that's okay


class Game
    attr_reader :current_player, :board

    def initialize(p1_mark, p2_mark)
        @p_one = HumanPlayer.new(p1_mark)
        @p_two = HumanPlayer.new(p2_mark)
        @board = Board.new
        @current_player = @p_one
    end

    def switch_turn
        if @current_player == @p_one
            @current_player = @p_two
        elsif @current_player == @p_two
            @current_player = @p_one
        end
    end

    def play
        system('clear')
        while @board.empty_positions?
            1.times do 
                @board.print
                input = @current_player.get_position
                valid_input = input.map {|ele| ele.to_i}
                valid_2 = @board.empty_valid_check?(valid_input)

                mark = @current_player.mark
                if input_valid?(input) && valid_2 != false

                    @board.place_mark(valid_input, mark)

                    if @board.win?(mark)
                        system('clear')
                        @board.print
                        p "congrats #{mark}! you won :) go treat yoself 2022"
                        return

                    elsif !@board.win?(mark)
                        self.switch_turn
                        system('clear')
                    end

                else
                    p "yo, that's not cool homie. try again :("
                    sleep(1.5)
                    system('clear')
                    redo   
                end
            end        

        end
        system('clear')
        @board.print
        p "booooo you both are losers >:( shame on you"
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
        elsif input.any? {|ele| ele.to_i.is_a?(Integer) == false}
            return false
        elsif input.any? {|ele| ele.to_i >= @board.length}
            return false
        end
        return true
    end
end