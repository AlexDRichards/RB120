# Herbivore and Carnivore can be thought of as a 'type of' animal, and then 
# specific animals are either a herbivore or a carnivore. 
# Can you think how to better represent this?

# ALTERATIONS:
    # refactored Herbivor and Carnivor into classes


### FAKE ZOO APP ###
### MODULES ###

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
   
   def self.incr_pop
       @@total_animals += 1
   end 
   
   private
   
   def self.calc_weight(lower, upper)
    (lower..upper).to_a.sample
   end 
end 

class Animal
  BODY_TEMP = 'warm-blooded'
  def initialize(id, weight, diet, temp)
    @id = id
    @weight = weight
    @diet = diet
    @temp = temp
    Zoo.incr_pop
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

class Herbivor < Animal
  DIET = 'VEGITATION'
end 

class Carnivor < Animal
  DIET = 'MEAT'
end 

class Zebra < Herbivor
  include Sociable
  def initialize()
    id = Zoo.population
    weight = Zoo.calc_weight(770, 990)
    diet = DIET
    temp = BODY_TEMP
    super(id, weight, diet, temp)
  end
end 

class Hawk < Carnivor
  include Airborne
  def initialize()
    id = Zoo.population
    weight = Zoo.calc_weight(10, 13)
    diet = DIET
    temp = BODY_TEMP
    super(id, weight, diet, temp)
  end
end 

class Tiger < Carnivor
  def initialize()
    id = Zoo.population
    weight = Zoo.calc_weight(200, 680)
    diet = DIET
    temp = BODY_TEMP
    super(id, weight, diet, temp)
  end
end 

class Koala < Herbivor
  def initialize()
    id = Zoo.population
    weight = Zoo.calc_weight(10, 30)
    diet = DIET
    temp = BODY_TEMP
    super(id, weight, diet, temp)
  end
end 

class Parrot < Herbivor
  include Airborne
  include Sociable
  def initialize()
    id = Zoo.population
    weight = Zoo.calc_weight(1,3)
    diet = DIET
    temp = BODY_TEMP
    super(id, weight, diet, temp)
  end
end 

p zebra = Zebra.new
p tiger = Tiger.new
p koala = Koala.new
p hawk = Hawk.new
p parrot = Parrot.new

puts zebra
# #p Zoo.population