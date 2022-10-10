require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'robo_player.rb'

#i added some of the system sleep function to the AI's so it was
# a bit more fun! hope that's okay :) also it's definitely more
# informal - if needed, i can edit it so it's more professional!


class Game
    attr_reader :current_player, :board

    def initialize(length, players)
        @players = Array.new
        players.each do |mark, bot_test|
            if bot_test == false
                @players << HumanPlayer.new(mark)
            else
                @players << RoboPlayer.new(mark)
            end
        end
        @board = Board.new(length)
        @current_player = @players[0]
    end

    def switch_turn
        @players << @players.shift
        @current_player = @players[0]
    end

    def play
        system('clear')
        while @board.empty_positions?
            @board.print
            p "It's #{@current_player.mark}'s turn."
            p '-----------------------------------------'
            input = @current_player.get_position(@board.legal_positions)
            mark = @current_player.mark
            @board.place_mark(input, mark)
                if @board.win?(mark)
                    system('clear')
                    @board.print
                    p "congrats #{mark}! you won :) go treat yoself 2022"
                    return
                end
            self.switch_turn
            system('clear')
        end
        system('clear')
        @board.print
        p '-----------------------------------------------'
        p "booooo you are ALL losers >:( shame on you all."
        p '-----------------------------------------------'
    end
end