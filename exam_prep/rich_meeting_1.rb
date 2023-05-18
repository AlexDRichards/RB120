# # 
# # instance variable reference an obejct from another class, and gives access to its interfaces
# class PetOwner
#   attr_reader :pet
#   def initialize(animal)
#     @pet = animal
#   end

# end

# class Dog
#   def fetch
#     'i will fetch the ball'
#   end
# end 

# fluffy = Dog.new
# pat = PetOwner.new(fluffy)

# p pat.pet.fetch


# namespaces:
  # collecting similar/related classes into a Module
  # collecting behaviors into a module
  # circumvent the one-class inheritance
#

# "there are #{NAMESPACE::WHAT_I_WANT}"

# module Courtesy
#   def greet
#     "Hello"
#   end 
# end

# class Chef
#   include Courtesy
#   def be_courteous
#     "#{Courtesy::greet}"
#   end

# end 

# class Server
# end 

# ed = Chef.new
# p ed.greet


#### LEXICAL SCOPING RULES #####

# When you call an instance method, 

# class Vehicle
#   WHEELS = 4

#   def how_many_wheels?
#     WHEELS
#   end

# end

# class Motorcycle < Vehicle
#   WHEELS = 2

# end 

# harley = Motorcycle.new
# p harley.how_many_wheels?


### When To Use Self ###

# class Singer

#   def initialize(inspiration)
#     @inspiration = inspiration
#   end

#   def change_inspiration(new_inspiration)
#     @inspiration = new_inspiration
#   end

#   def reveal_insp
#     self.inspiration
#   end

#   private

#   attr_writer :inspiration
#   attr_reader :inspiration

# end

# laney = Singer.new('bob marley')

# laney.change_inspiration('bob dylan')
# p laney.reveal_insp

# julia = Singer.new

# Protected methods are very similar to private methods. The main difference between them is *protected methods allow access between class instances*, while *private methods don't*. If a method is protected, it can't be invoked from outside the class.