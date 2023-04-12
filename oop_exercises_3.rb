# To create an object in Ruby, we need to define a class
  # you do not need an initialize method
# Next, we create a variable and assign it to an instance of the class by calling .new on the class name

# class MyClass
# end

# biology = MyClass.new

# A module is a collection of behaviors that can become available to a class via a mix-in
# You require a module in a class to make use of it
  # Class MyCar
    # require 'module_name'
  #
# Module definitions are the same as class definitions, just replace 'class' with 'module'


# PART I EXERCISES

# Define a class called MyCar
# Upon initialization of a new instance, make sure the following attributes are included:
  # year, color, model
    # the def initialize method is technically a CONSTRUCTOR
      # it gets triggered by .new and builds qualities into the new instantiation of the object created by .new
# Create an instance variable that tracks the speed of the car and set it to 0
  # An instance variable exists as long as the object it is tied to exists
# Create instance methods that allow the car to speed up, break, and shut down

# Add an accessor method to allow the user to modify the year, color, and model
  # the sugary accessor method is really doing two methods under the hood:
    # getter and setter
      # getter
        # def color
        #   @color
        # end
      # setter
        # def color=(c)
          # @color = c
        # end 
      #
# Create a method called spray paint that allows you to change the color of your car

# Create a new class called Vehicle that will be inhereted by the MyCar class
  # you can trigger inheretence by using '<'
# A class variable is notated with @@
  # it is available to every instance of the class (?)
#

# module Towable
#   def can_tow?(pounds)
#     pounds < 2000
#   end
# end

# class Vehicle
#   attr_accessor :year
#   attr_reader :model
#   attr_writer :color

#   @@number_of_vehicles = 0

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#     @@number_of_vehicles += 1
#   end

#   def accel(num)
#     @current_speed += num
#     p "Your car accelerated #{num} mph, you are now going #{@current_speed}"
#   end

#   def decelerate(num)
#     @current_speed -= num
#     p "Your car decelerated #{num} mph, you are now going #{@current_speed}"
#   end

#   def stop
#     @current_speed = 0
#     p "You bring the car to a stop. Your current speed is #{@current_speed}"
#   end

#   def spray_paint(color)
#     self.color = color
#     p "Your new paint color, #{color}, looks great!"
#   end

#   def mileage(tank_size, total_miles)
#     puts total_miles / tank_size
#   end

#   def to_s
#     "you drive a #{@color} #{@model}"
#   end

#   def self.how_many_cars
#     p @@number_of_vehicles
#   end

#   def get_age
#     \age
#   end

#   private

#   def age
#     Time.now.year - @year
#   end
# end

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4  
# end

# class MyTruck < Vehicle
#   NUMBER_OF_DOORS = 2
# end

# hyundai = MyCar.new(2017, 'white', 'elantra')
# ford = MyTruck.new(2000, 'red', 'ranger')
# hyundai.accel(20)
# hyundai.decelerate(10)
# hyundai.stop
# hyundai.spray_paint('black')
# hyundai.mileage(14, 430)
# puts hyundai
# Vehicle.how_many_cars
# puts ford
# p MyCar.ancestors
# p MyTruck.ancestors
# p Vehicle.ancestors
# p hyundai.get_age
# p ford.get_age


# class Student

#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def better_grade_than?(other_student)
#     grade > other_student.grade
#   end

#   protected

#   def grade
#     @grade
#   end
# end

# joe = Student.new('joe', 90)
# bob = Student.new('bob', 88)

# puts "Well done!" if joe.better_grade_than?(bob)

class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end
  def change_grade(new_grade)
    grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade # => "A"