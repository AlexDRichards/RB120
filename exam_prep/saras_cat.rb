class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)

# The collaborator object here is sara, because she becames a state of the 
# instance variable @owner, which belongs to the object fluffy from the Cat class
# the object sara is the "custom" colaborator object, whereas the string "sara" 
# while also a collaborator, is not technically "custom"
