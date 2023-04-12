class Player
  attr_accessor :choice, :name
  def initialize
    set_name
    @choice = choice
  end
end

class Computer < Player
  POSSIBLE_OPPONENTS = ['R2D2', 'Deep Blue', 'Alfred']
  POSSIBLE_CHOICES = ['rock', 'paper', 'scissors']
  def set_name
    self.name = POSSIBLE_OPPONENTS.sample
  end

  def choice
    self.choice = POSSIBLE_CHOICES.sample
    self.choice
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Please input something!"
    end
    self.name = n
  end

  def choose
    options = ['rock','paper','scissors']
    choice = ''
    loop do
      puts "What's your choice? (rock, paper, or scissors)"
      choice = gets.chomp
      break if options.include?(choice)
      puts "I'm sorry, please check your spelling"
    end
    self.choice = choice
  end

end

class Game
  attr_accessor :human, :computer
  
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    puts "Welcome to the game"
    # loop do
      human.choose
      computer.choice
      # declare_winner
      # play_again?
      # break if play_again?
    # end
  end
end

Game.new.play