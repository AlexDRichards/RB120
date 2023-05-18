### FAKE ZOO CATEGORIZATION APP ###

=begin
All animals in the zoo will have a body temperature of 'warm-blooded'.
=end

### MODULES ###
module Herbivor
  DIET = 'VEGITATION'
end 

module Carnivor
  DIET = 'MEAT'
end 

module Airborne
  def fly
    "like an eagle"
  end 
end

module Sociable
  def social
    "heyyyy"
  end 
end

module HuntingSkills
  def hunt(prey)
    "yum, #{prey} are tasty!"
  end 
end


### CLASSES ###
class Zoo
   @@total_animals = 1
   
   def self.population
    @@total_animals
   end
   
   private
   
   def calc_weight(lower, upper)
     (lower..upper).to_a.sample
   end 
end 

class Animal < Zoo
  BODY_TEMP = 'warm-blooded'
  def initialize(id, weight, diet, temp)
    @id = id
    @weight = weight
    @diet = diet
    @temp = temp
    @@total_animals += 1
  end
  
  def to_s
    puts "====================="
    puts "species: #{self.class}"
    puts "animal id: #{@id}"
    puts "weight: #{@weight} "
    puts "diet: #{@diet} "
    puts "body temp: #{@temp} "
    puts "====================="
  end
 
  private
  attr_reader :id, :weight, :diet, :temp
end 

class Zebra < Animal
  include Herbivor
  include Sociable
  def initialize()
    @id = @@total_animals
    @weight = calc_weight(770, 990)
    @diet = DIET
    @temp = BODY_TEMP
    super(@id, @weight, @diet, @temp)
  end
end 

class Hawk < Animal
  include Carnivor
  include Airborne
  def initialize()
    @id = @@total_animals
    @weight = calc_weight(10, 13)
    @diet = DIET
    @temp = BODY_TEMP
    super(@id, @weight, @diet, @temp)
  end
end 

class Tiger < Animal
  include Carnivor
  def initialize()
    @id = @@total_animals
    @weight = calc_weight(200, 680)
    @diet = DIET
    @temp = BODY_TEMP
    super(@id, @weight, @diet, @temp)
  end
end 

class Koala < Animal
  include Herbivor
  def initialize()
    @id = @@total_animals
    @weight = calc_weight(10, 30)
    @diet = DIET
    @temp = BODY_TEMP
    super(@id, @weight, @diet, @temp)
  end
end 

class Parrot < Animal
  include Herbivor
  include Airborne
  include Sociable
  def initialize()
    @id = @@total_animals
    @weight = calc_weight(1,3)
    @diet = DIET
    @temp = BODY_TEMP
    super(@id, @weight, @diet, @temp)
  end
end 

p zebra = Zebra.new
p tiger = Tiger.new
p koala = Koala.new
p hawk = Hawk.new
p parrot = Parrot.new

puts zebra
p Zoo.population