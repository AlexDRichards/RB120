class Circle
  attr_reader :radius

  def initialize(r)
    @radius = r
  end

  def >(other)
    radius > other.radius
  end

  def ==(other)
    radius == other.radius
  end
end

circle1 = Circle.new(5)
circle2 = Circle.new(3)
circle3 = Circle.new(5)


# The code below fails because circle2 and circle3 are objects of Circle class,
# and < is an method...
# p circle2 < circle3

circle4 = 5
circle5 = 4

p circle4 > circle5

p circle1 > circle2