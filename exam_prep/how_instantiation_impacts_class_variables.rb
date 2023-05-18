class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end

# if you instiate a Quad. object after a Triangle Object, and then you call
# sides on the Triangle, you'll get 4, becuase the Quad object changed
# the class variable of Triangle to 4 from it's initial assignment of 3

triangle = Triangle.new
p triangle.sides
quad = Quadrilateral.new
p triangle.sides
