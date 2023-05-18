# class FarmAnimal
#   def speak
#     "#{self.class} says "
#   end
# end

# class Sheep < FarmAnimal
#   def speak
#     super + "baa!"
#   end
# end

# class Lamb < Sheep
#   def speak
#     "baaaaaaa!"
#   end
# end

# class Cow < FarmAnimal
#   def speak
#     super + "mooooooo!"
#   end
# end

# p Sheep.new.speak # => "Sheep says baa!"
# p Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
# p Cow.new.speak # => "Cow says mooooooo!"


# Note how you can use self.class on line 3 to get the desired output
# as apposed to the technial name of the object

class RestaurantStaff
  def greet
    "Good evening, I'll be your"
  end
  
end 

class Chef < RestaurantStaff
  def greet
    "How did you like the food?"
  end
end 

class MasterChef < Chef
  def greet
    "Excuse me, I'm headed to the kitchen"
  end 
end

class Server < RestaurantStaff
  def greet
    super + " #{self.class.to_s.downcase} this evening."
  end 
end 

ron = Server.new
jeff = MasterChef.new
laney = Chef.new

p ron.greet
p jeff.greet
p laney.greet