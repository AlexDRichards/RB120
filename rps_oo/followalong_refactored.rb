class Move
  VALUES = ['rock', 'paper','scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
    (rock? && other_move.lizard?) ||
    (paper? && other_move.rock?) ||
    (paper? && other_move.spock?) ||
    (scissors? && other_move.paper?) ||
    (scissors? && other_move.lizard?) ||
    (lizard? && other_move.spock?) ||
    (lizard? && other_move.paper?) ||
    (spock? && other_move.rock?) ||
    (spock? && other_move.scissors?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
    (rock? && other_move.spock?) ||
    (paper? && other_move.scissors?) ||
    (paper? && other_move.lizard?) ||
    (scissors? && other_move.rock?) ||
    (scissors? && other_move.spock?) ||
    (lizard? && other_move.scissors) ||
    (lizard? && other_move.rock?) ||
    (spock? && other_move.paper?) ||
    (spock? && other_move.lizard?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :score_history

  MOVES = []

  def initialize
    set_name
    @score = 0
    @score_history = []
  end

end

class Human < Player
  def set_name
    n = ''
    loop do
    puts "What's your name?"
    n = gets.chomp
    break unless n.empty?
    puts "Please input something"
    end 
    self.name = n
  end

  def choose
    choice = nil 
    loop do
      puts "Please choose rock, paper, lizard, spock, or scissors"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry! Invalid input, try again!"
    end
    self.move = Move.new(choice)
    self.score_history << choice
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2','Alfred', 'Deep Blue'].sample
  end

  def choose
    choice = Move::VALUES.sample
    self.move = choice
    self.score_history << choice
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to RPS!"
  end

  def display_goodbye_message
    puts "Goodbye!"
    puts "*" * 20
  end

  def display_moves
    puts '*' * 20
    puts "#{human.name} chose #{human.move}"
    puts "#{human.name}'s moves: #{human.score_history}"
    puts "#{computer.name} chose #{computer.move}"
    puts "#{computer.name}'s moves: #{computer.score_history}"
  end

  def tally_score
    if human.move > computer.move
      human.score += 1
      puts "#{human.name} won!"
    elsif human.move < computer.move
      computer.score += 1
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#" * 20
    puts "#{human.name} score is #{human.score}"
    puts "#{computer.name} score is #{computer.score}"
    puts "#" * 20
  end
  
  def winner?
    return true if human.score > 4 || computer.score > 4
    false
  end

  def play_again?
    puts '#' * 15
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      case answer
        when 'y'
          human.score = 0
          computer.score = 0
      end
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n"
    end
    return true if answer == 'y'
    return false
  end


  def play 
    display_welcome_message
    loop do  
      loop do
        human.choose
        computer.choose
        display_moves
        tally_score
        display_score 
        break if winner?
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play



# class Rock < Move
# end

# class Paper < Move
# end

# class Scissors < Move
# end

# class Lizard < Move
# end

# class Spock < Move
# end