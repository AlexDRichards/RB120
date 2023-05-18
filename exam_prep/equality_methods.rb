str1 = "I'm a string"
str2 = str1

# How can you test that these are the same object?
# == will not work: it only checks that they are the same object
# .eql? is the same as ==
# .equal? will check if they are the same object && if same state
# str1.object_id? == str2.object_id? will do the same as ln 7

p str1 == str2
p str1.equal?(str2)
p str1.object_id
p str2.object_id

# here is another example:

class Cat
    attr_accessor :name
    def initialize(name)
        @name = name
    end
end

class Dog
    attr_accessor :name
    def initialize(name)
        @name = name
    end
end


sparky_the_dog = Dog.new('sparky')
sparky_the_cat = Cat.new('sparky')
p sparky_the_dog
p sparky_the_cat

p sparky_the_dog.name.object_id
p sparky_the_cat.name.object_id

p sparky_the_dog.name == sparky_the_cat.name
p sparky_the_cat.name.object_id
p sparky_the_dog.name.object_id
p sparky_the_dog.name.equal?(sparky_the_cat.name)