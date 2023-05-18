class Player
    attr_accessor :name
   @@total_players = 0
   
   def initialize(name)
       @name = name
       @@total_players += 1
   end
   
   def play
       "#{name} is playing"
   end
   
   def self.total_players
       @@total_players
   end
   def to_s
       @name
   end
end

john = Player.new('john')
p john.play
p "The players name is #{john}"