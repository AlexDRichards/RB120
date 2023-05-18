class Car
  WHEELS = 4

  def wheels
    WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2
end

civic = Car.new
puts civic.wheels # => 4

bullet = Motorcycle.new
puts bullet.wheels # => 4, when you expect the out to be 2

# Lexical scope`, from my understanding, 
# means that the scope of the object remains 
# limited to where it's defined in the code.

# This is because when bullet calls .wheels, it doesn't find the method
# in class.Motorcycle, so it looks in class.Car and finds it,
# but when method wheels calls constant WHEELS it uses lexical scope
# which is limited to where it is defined in the code (it is defined in 
# the Car class), so it returns 4

