
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    name = n
    height = h 
    weight = w
  end
  
  def info
    "#{name} weights #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new("Sparky", "15", "30")

p sparky.speak
p sparky.info

sparky.change_info('Sparticus', '24 inches', '45 pounds')
p sparky.info



