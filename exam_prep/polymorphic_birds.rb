# class Bird
#     def fly
#       p "#{self.class} is flying!"
#     end
#   end
  
#   class Pigeon < Bird; end
#   class Duck < Bird; end
  
#   birds = [Bird.new, Pigeon.new, Duck.new].each(&:fly)

=begin
  Polymorphism: We are sending the same "fly" message on different object types 
  that can respond to that message. Although each object in the birds array is 
  a different type, the client code treats them all as a generic bird object -- 
  a bird that can fly.

through inheritance: The Pigeon and Duck class don't have a fly method of their 
own. Instead, they are both inheriting that behavior from Bird.

Output:
"Bird is flying!"
"Pigeon is flying!"
"Duck is flying!"
=end


### POLYMORPHIC BIRDS ###

# class Bird
#   def fly
#   p "#{self.class} is flying!"
#   end 
# end

# class Pigeon < Bird; end
# class Hawk < Bird; end
# class Chicken < Bird; end 
# class Dove < Bird; end

# [Pigeon.new, Hawk.new, Dove.new, Chicken.new].each do |object|
#   object.fly
# end

### DUCK-TYPED BIRDS ###

class Pigeon 
  def fly
    "clumsy"
  end
end

class Hawk
  def fly
    "Precise"
  end
end 

class Chicken
  def fly
    "attempt at flight"
  end 
end 

class Dove
  def fly
    "oblivious"
  end 
end 

[Pigeon.new, Hawk.new, Dove.new, Chicken.new].each do |object|
  p object.fly
end 


