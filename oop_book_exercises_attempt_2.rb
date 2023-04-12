# create a class called MyCar

# Instance methods are tied to objects and it would appear they depend on them
# Class methods are methods we can call directly on the class itself, without having to instantiate any objects

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? p("You can tow it!") : p("It's too heavy!")
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color
  attr_accessor :year
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(num)
    @current_speed += num
    p "You accelerated #{num} mph. Your current speed is #{@current_speed} mph"
  end

  def break(num)
    @current_speed -= num
    p "You decelerated #{num} mph. Your current speed is #{@current_speed} mph"
  end

  def shut_off
    @current_speed = 0
    p "You turned the car off. Your speed is #{@current_speed} mph"
  end

  def get_color
    p "Your car's color is #{@color}"
  end

  def spray_paint(color)
    self.color = color
    p "Your car has be spray painted a new color: #{color}"
  end

  def self.gas_mileage(tank_size, distance)
    mileage = distance / tank_size
    p "Your car gets #{mileage} miles to the gallon"
  end

  def to_s
    "My car is a #{color}, #{year}, #{@model}"
  end

  def self.how_many_cars
    p @@number_of_vehicles
  end

  def age
    p "The vehicle is #{vehicle_age} years old"
  end

  private

  def vehicle_age
    Time.now.year - year
  end
end

# The .new method will interact with the 'initialize' method
class MyCar < Vehicle
  
end

class MyTruck < Vehicle
  include Towable
  
end

elantra = MyCar.new(2018, 'Elantra', 'white')
ranger = MyTruck.new(2005, 'Ranger', 'blue')

elantra.speed_up(15)
elantra.break(10)
elantra.shut_off
elantra.get_color
elantra.spray_paint('black')
elantra.get_color
p elantra.year
p elantra.year = 2020
MyCar.gas_mileage(14, 400)
puts elantra
Vehicle.how_many_cars
ranger.can_tow?(1999)
p MyCar.ancestors
p Vehicle.ancestors
p MyTruck.ancestors
ranger.age
