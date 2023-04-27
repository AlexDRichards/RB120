require 'pry'
class Board
    WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [7,5,3]]

    def initialize
        @squares = {}
        reset
    end

    def get_square_at(key)
        @squares[key]
    end

    def set_square_at(key, marker)
        @squares[key].marker = marker
    end

    def unmarked_keys
        @squares.keys.select {|key| @squares[key].unmarked?}
    end

    def full?
        unmarked_keys.empty?
    end

    def someone_won?
        !!winning_mark
    end

    def count_human_marker(squares)
        # binding.pry
        squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
    end

    def count_computer_marker(squares)
        squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
    end

    def winning_mark
        WINNING_LINES.each do |line|
            # binding.prys
            if count_human_marker(@squares.select{|k,_| line.include?(k)}.values) == 3
                return TTTGame::HUMAN_MARKER
            elsif count_computer_marker(@squares.select{|k,_| line.include?(k)}.values) == 3
                return TTTGame::COMPUTER_MARKER
            end
        end

        # WINNING_LINES.each do |line|
        #     if @squares[line[0]].marker == TTTGame::HUMAN_MARKER && @squares[line[1]].marker == TTTGame::HUMAN_MARKER && @squares[line[2]].marker == TTTGame::HUMAN_MARKER
        #         return TTTGame::HUMAN_MARKER
        #     elsif @squares[line[0]].marker == TTTGame::COMPUTER_MARKER && @squares[line[1]].marker == TTTGame::COMPUTER_MARKER && @squares[line[2]].marker == TTTGame::COMPUTER_MARKER
        #         return TTTGame::COMPUTER_MARKER
        #     end
        # end
        nil
    end

    def reset
        (1..9).each {|key| @squares[key] = Square.new}
    end

    def draw 
        puts ""
        puts "     |     |"
        puts "  #{get_square_at(1)}  |  #{get_square_at(2)}  |  #{get_square_at(3)}"
        puts "     |     |"
        puts "-----+-----+-----"
        puts "     |     |"
        puts "  #{get_square_at(4)}  |  #{get_square_at(5)}  |  #{get_square_at(6)}"
        puts "     |     |"
        puts "-----+-----+-----"
        puts "     |     |"
        puts "  #{get_square_at(7)}  |  #{get_square_at(8)}  |  #{get_square_at(9)}"
        puts "     |     |"
        puts ""
    end
end
  
class Square
    INITIAL_MARKER = ' '

    attr_accessor :marker

    def initialize(marker=INITIAL_MARKER)
        @marker = marker
    end

    def to_s
        @marker
    end

    def unmarked?
        marker == INITIAL_MARKER
    end

end

class Player
    attr_reader :marker

    def initialize(marker)
        @marker = marker
    end
end

class TTTGame
    HUMAN_MARKER = "X"
    COMPUTER_MARKER = "O"
    attr_reader :board, :human, :computer

    def screen_clear
        system 'clear'
    end

    def initialize
        @board = Board.new
        @human = Player.new(HUMAN_MARKER)
        @computer = Player.new(COMPUTER_MARKER)
    end

    def display_welcome_message
        puts "Hello!"
        puts "You're a #{human.marker}. Computer is a #{computer.marker}"
    end 

    def display_goodbye_message
        puts "Goodbye!"
    end

    def clear_screen_and_display_board
        screen_clear
        board.draw
    end

    def human_moves
        puts "Please choose a square (#{board.unmarked_keys.join(', ')})"
        square = nil
        loop do
            square = gets.chomp.to_i
            break if board.unmarked_keys.include?(square)
            puts "I'm sorry, please try your input again"
        end
        # binding.pry
        board.set_square_at(square, human.marker)
    end
    def computer_moves
        board.set_square_at(board.unmarked_keys.sample, computer.marker)
    end

    def display_result
        clear_screen_and_display_board
        case board.winning_mark
        when human.marker
            puts "You won!"
        when computer.marker
            puts "Computer won!"
        else
            puts "It's a tie!"
        end
    end

    def play_again?
        answer = nil
        loop do
            puts "Would you like to play again? (y/n)"
            answer = gets.chomp
            break if %(y n).include?(answer)
            puts "Sorry, please try your input again."
        end

        answer == 'y' ? true : false
    end

    def game_reset
        screen_clear
        board.reset
    end

    def display_play_again_message
        puts "Let's play again!"
    end

    def play
        display_welcome_message
        loop do 
            board.draw
            loop do
                human_moves
                break if board.someone_won? || board.full?
                computer_moves
                break if board.someone_won? || board.full?
                board.draw
            end
            display_result
            break if !play_again?
            game_reset
            display_play_again_message
        end
        display_goodbye_message
    end
end

  # we'll kick off the game like this
  game = TTTGame.new
  game.play