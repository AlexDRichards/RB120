# module Describable
#   def describe_shape
#     "I am a #{self.class} and have #{self.class::SIDES} sides."
#   end
# end

# class Shape
#   include Describable

#   def self.sides
# #   SIDES
# # revise
#     self::SIDES
#   end
# end

# class Quadrilateral < Shape
#   SIDES = 4
#   #add
#   def sides
#       SIDES
#   end
# end

# class Square < Quadrilateral; end

# p Square.sides # => 4
# p Square.new.sides # => 4
# p Square.new.describe_shape # => "I am a Square and have 4 sides."


# You need to namespace SIDES on line 3 beacuse when line 29 calls
# describe_shape, it will use lexical scope of the module Describable
# UNLESS you namespace and tell it where to search for SIDES
    # here it will search the class of the object's self
        # which first goes to square, then to Quadrilateral
        # where it finds SIDES = 4
        
# The principle at work here is that you can circumvent LEXICAL SCOPE with the 
# NAMESPACE :: INTERFACE/VARIABLE syntax



module FourWheeler
  WHEELS = 4
end

class Vehicle
  def maintenance
    "Changing #{FourWheeler::WHEELS} tires."
  end
end

class Car < Vehicle
  include FourWheeler

  def wheels
    WHEELS
  end
end

car = Car.new
puts car.wheels        # => 4
puts car.maintenance   # => NameError: uninitialized constant Vehicle::WHEELS