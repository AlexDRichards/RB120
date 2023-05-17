# Create a class called MyCar. When you initialize a new instance or object of the class, 
# allow the user to define some instance variables that tell us the year, color, and model of the car. 
# Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. 
# Create instance methods that allow the car to speed up, brake, and shut the car off.


# Line 11 appears to allow the .new method on line 47 to be called and initialize a new object with the qualities within the initialize method
  # note that the variables in the initialize method are instance variables, which appears to maek them available across methods (not just scoped to method)
    # technically the instance variable exists so long as the object it is tied to exists
  # the rest are methods. These methods can be called on the object that was initialized
    # whatever is in the methods will be done
      # instance variables are used here (@variable) becuase it allows traits outside the method to be modified


module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle

  @@number_of_vehicles

  attr_accessor :color
  attr_reader :year
  @@number_of_vehicles = 0
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(gallons, miles)
    p "This car gets #{miles / gallons} miles per gallon"
  end

  def speed_up(number)
    @current_speed += number
    puts "you push the gas #{number} mph"
  end

  def current_speed
    p "#{@current_speed}"
  end

  def brake(number)
    @current_speed -= number
    p "you push the break and decelerate #{number} mph"
  end

  def shut_down
    @current_speed = 0
  end

  def spray_paint(color)
    self.color = color
    p "Your new #{color} car looks great!"
  end

  def how_many_vehicles
    p @@number_of_vehicles
  end
  
  def age
    p "Your vehicle is #{years_old} years old."
  end

  private

  def years_old
    Time.now - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  def to_s
    p "My car is a #{@year}, #{@model}, #{@color}"
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2
  def to_s
    p "My truck is a #{@year}, #{@model}, #{@color}"
  end

end

my_truck = MyTruck.new('2018', 'Hyundai', "Elantra")
my_car = MyCar.new('2000', 'Chevy', 'S10')

puts my_truck
puts my_car

my_truck.how_many_vehicles

p my_truck.can_tow?(1999)
p MyTruck.ancestors
Vehicle.gas_mileage(40, 350)
Vehicle.info

# elantra = MyCar.new(2018, 'Elantra', 'white')
# p elantra.current_speed
# elantra.speed_up(50)
# p elantra.current_speed
# p elantra.brake(30)
# p elantra.color = 'black'
# p elantra.info
# p elantra.year
# p elantra.spray_paint('blonde')
# puts elantra


# class Person
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# p bob.name
# p bob.name = "Bob"