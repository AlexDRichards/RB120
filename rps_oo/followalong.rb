class Player
  attr_accessor :move, :name
  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name 
  end

  def set_name
    if human?
      n = ''
      loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Please input something"
      end 
      self.name = n
    else
      self.name = ['R2D2','Alfred', 'Deep Blue'].sample
    end
  end

  def choose
    if human?
      choice = nil 
      loop do
        puts "Please choose rock, paper, or scissors"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "Sorry! Invalid input, try again!"
      end
      self.move = choice
    else
      self.move = ['rock','paper','scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to RPS!"
  end

  def display_goodbye_message
    puts "Goodbye!"
    puts "*" * 20
  end

  def display_winner
    puts '*' * 20
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "You lost!" if computer.move == 'paper'
      puts "You won!" if computer.move == 'scissors'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "You lost!" if computer.move == 'scissors'
      puts "You won!" if computer.move == 'rock'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "You lost!" if computer.move == 'rock'
      puts "You won!" if computer.move == 'paper'
    end

    puts "Thanks for playing"
  end

  def play_again?
    puts '#' * 15
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n"
    end
    return true if answer == 'y'
    return false
  end


  def play 
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play