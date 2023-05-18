class Student
  
  attr_accessor :grade

def initialize(name, grade=nil)
  @name = name
  # @grade = grade
end
  # class body
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @name="Adewale", @grade=nil>



# Note how this doesn't get the desired output on line 6. If you don't initialize
# it, it doesn't become attrinbuted to the object's state
    # here grade=nil doesn't trigger even though attr_accessor is present
    
# CLARIFICATION
# You might add an accessor method for :grade, but unless you assign some state
# to that instance variable (which exists in the getter/setter methods created
# by :grade), it will not be attributed to the object's state on instantiation.

# nil can be a viable state to attribute to an instance variable

# you would need:
# def initialize(name, grade=nil)
#   @name = name
#   @grade = grade
# end