class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} is speaking."
  end
end

class Thief < Character 
    def speak
        "#{@name} is whispering"
    end
end

sneak = Thief.new("Sneak")
sneak.name # => "Sneak"
p sneak.speak # => "Sneak is whispering..."


# You can get the desired output by using method overriding (it will select
# from the Thief class first in the lookup process
