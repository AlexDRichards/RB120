class Player
  attr_accessor :choice, :name
  def initialize
    set_name
    @choice = choice
  end

end

class Computer < Player
  POSSIBLE_OPPONENTS = ['R2D2', 'Deep Blue', 'Alfred']
  def set_name
    self.name = POSSIBLE_OPPONENTS.sample
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
end

class Game
  attr_accessor :human, :computer
  
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    # loop do
      human.choice
      computer.choice
      # declare_winner
      # play_again?
      # break if play_again?
    # end
  end
end

Game.new