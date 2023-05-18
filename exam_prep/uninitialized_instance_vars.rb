class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
#   def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name                       # => bark! bark!  bark! bark!

# Note what happens when you comment out line 8:
# because there is no initialize method in #Dog, ruby looks for one in the 
# superclass. It finds one and assigns @name hte state 'Teddy'
# However, if you override by uncommenting line 8, you don't assign the argument
# and @name has the state of nil

