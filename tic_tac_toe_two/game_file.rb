class Board
    attr_accessor :state

    def establish_board
        state = []
        (0..8).map do |_|
            state << ' '
        end
        @state = state
    end
    
    def initialize
        @state = establish_board
    end

    def available_spots
        spots = []
        @state.each_with_index do |spot, pos|
            spots << (pos + 1) if spot == ' '
        end
        spots
    end

    def player_options
        puts "Please pick from the following available spots:"
        puts "#{available_spots}"
    end

    def check_answer(answer)
        return true if available_spots.include?(answer)
        false
    end

    def winning_lines?
        lines = [[1,2,3], [1,4,7],[1,5,9],[4,5,6],[2,5,8],[7,8,9],[7,5,3],[3,6,9]]
        lines.each do |line|
            values = []
            line.each do |position|
                values << @state[position - 1]
            end
            return 'X' if values.all?('X')
            return 'O' if values.all?('O')
        end
        false
    end

    def mark_spot(answer, marker)
        @state[answer - 1] = marker
    end

    def reset
        @state = establish_board
    end


end

class Human
    MARKER = 'X'
    attr_accessor :name

    def initialize
        @name = name
    end
    
    def marker
        MARKER
    end
end

class Computer
    MARKER = 'O'
    attr_accessor :name

    def initialize
        @name = name
    end

    def marker
        MARKER
    end 
end

class TTTgame
    def initialize
        @board = Board.new
        @human = Human.new
        @computer = Computer.new
    end

    def display_welcome
        puts "****************************"
        puts "   WELCOME TO TIC TAC TOE"
        puts "****************************"
    end

    def get_player_name
        name = ''
        loop do
            puts "What is your name, player?"
            name = gets.chomp
            puts "Your name is #{name}... is that correct? (y/n)"
            answer = ''
                loop do
                    answer = gets.chomp.downcase
                    break if %w(y n).include?(answer)
                    puts "Sorry! please input y or n"
                end
            break if answer == 'y'
        end
        puts "Splendid #{name}, welcome to the game!"
        @human.name = name
    end

    def display_board
        pad = " " * 3
        puts pad +"     |      |     "
        puts pad +"  #{@board.state[0]}  |   #{@board.state[1]}  |  #{@board.state[2]}  "
        puts pad +"_____|______|_____"
        puts pad +"     |      |     "
        puts pad +"  #{@board.state[3]}  |   #{@board.state[4]}  |  #{@board.state[5]}  "
        puts pad +"_____|______|_____"
        puts pad +"     |      |     "
        puts pad +"  #{@board.state[6]}  |   #{@board.state[7]}  |  #{@board.state[8]}  "
        puts pad +"     |      |     " 
    end

    def player_turn
        answer = nil
        loop do
            @board.player_options
            answer = gets.chomp.to_i
            break if @board.check_answer(answer) == true
            puts "I'm sorry, please check your input and try again!"
        end
        @board.mark_spot(answer, @human.marker)
    end

    def computer_turn
        options = @board.available_spots
        answer = options.sample
        @board.mark_spot(answer, @computer.marker)
    end

    def win_check
        @board.winning_lines?
    end

    def play_again?
        answer = ''
        loop do
            puts "Would you like to play again? (y/n)"
            answer = gets.chomp.downcase
            break if %w(y n).include?(answer)
            puts "I'm sorry, please try your input again."
        end
        answer == 'y' ? true : false
    end

    def display_winner
        case win_check
            when 'X'
                puts "Player wins!"
            when 'O'
                puts "Computer wins!"
        end
    end

    def reset_game
        @board.reset
    end
    
    def display_goodbye
        puts "Thanks for playing, enjoy the rest of your life!"
    end

    def play
        display_welcome
        get_player_name
        loop do
            loop do
                display_board
                player_turn
                display_board
                break if win_check
                computer_turn
                break if win_check
            end
            display_winner
            break if !play_again?
            reset_game
        end
        display_goodbye
    end
end

TTTgame.new.play