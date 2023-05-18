## Class vs. Object
    # a class is a mould
    # an object is an instance of that mould
    # if you don't initialize certain variables, they won't have state
        # upon object instantiation
    
    # class Car
    # end
    
    # elantra = Car.new
    # sonata = Car.new
    
    # each of the below is a unique object
    # p elantra.object_id
    # p sonata.object_id
    # p Car.object_id 
    
## Whatever is made in a class belongs to the instantied object:

    # class Car
    #     attr_accessor :model, :manufacturer
    #     def initialize(model, manufacturer)
    #         @model = model
    #         @manufacturer = manufacturer
    #     end
    # end
    
    # elantra = Car.new('elantra', 'Hyundai')
    # escape = Car.new('escape', 'Ford')
    
    # # if the instance methods were shared, you would get the same output:
    # puts elantra.model # => 'elantra'
    # puts escape.model  # => 'escape'
 
## setters and getters & attr_*

    # class Piano
    #     def initialize(type, brand)
    #         @type = type
    #         @brand = brand
    #     end
    #     # getter:
    #     def type
    #         @type
    #     end
    #     # setter:
    #     def type=(type)
    #         @type = type
    #     end
        
    #     def brand
    #         @brand
    #     end
        
    #     def brand=(brand)
    #         @brand = brand
    #     end
    # end
    
    # john_piano = Piano.new('Baby Grand', 'Kawai')
    
    # p john_piano.type
    # john_piano.type = 'Upright'
    # p john_piano.type
    
    # p john_piano.brand
    # john_piano.brand = 'Steinway'
    # p john_piano.brand
    
    # Simplyfy with attr_*

    #   class Piano
    #         attr_accessor :type, :brand
    #         def initialize(type, brand)
    #             @type = type
    #             @brand = brand
    #         end
    #     end
        
    #     john_piano = Piano.new('Baby Grand', 'Kawai')
        
    #     p john_piano.type
    #     john_piano.type = 'Upright'
    #     p john_piano.type
        
    #     p john_piano.brand
    #     john_piano.brand = 'Steinway'
    #     p john_piano.brand

## Classes, Instances, Constants
    # constants have lexical scope: they are available to the where the code is
    # called: so if you reference them with a method, the method needs to be in
    # the same class as the constant
    
    # instances variables are available to the objects they belong to:
    
    # class Cook
    #     attr_accessor :name
    #     def initialize(name)
    #         @name = name
    #     end
    # end 
    
    # class Tool
    #     attr_accessor :brand
    #     def initialize(brand)
    #         @brand = brand
    #     end 
    # end
    
    # lead_chef = Cook.new('John')
    # whisk = Tool.new('cuisinart')
    
    # p lead_chef.name
    # p whisk.brand
    # p lead_chef.brand # error
    
    # the same applies to methods
    
    # Constants have lexical scope:
     
    # class Piano
    #     NUM_OF_KEYS = 88
    #     attr_accessor :brand
    #     def initialize(brand)
    #         @brand = brand
    #     end
        
    #     def how_many_keys
    #         NUM_OF_KEYS
    #     end
    # end 
    
    # class PianoForte < Piano
    #     NUM_OF_KEYS = 61
    #     def initialize(brand)
    #         super
    #     end
    # end
    
    # p jason_piano = PianoForte.new('Shimmel')
    # p jason_piano.how_many_keys #88 --> becuase lexical scope: 88
    #     # however, if you were to put method in PianoForte, it would go up the
    #     # tree if it didn't find the referenced constant in the Class

## Instance vs. Class Method

    # An instance method is available to an instantiated object of the class
    # A class method is available to the class, not the object
    
    # class Computer
    #     def initialize(type)
    #         @type = type
    #     end
        
    #     def self.what_am_i?
    #         "I'm a computer class!"
    #     end
    # end
    
    # mac_mini = Computer.new('apple')
    # p Computer.what_am_i?
    # p mac_mini.what_am_i? # throws an error: no method

## Method Access Control

    # You can put object state behind privacy walls and make it accessible
    # only to methods:
    
    # class Mover
    #     attr_accessor :name
    #     attr_writer :age
    #     def initialize(name, age)
    #         @name = name
    #         @age = age
    #     end
        
    #     def reveal_age
    #         age
    #     end
        
    #     private
        
    #     attr_reader :age
    # end
    
    # john = Mover.new('john', 43)
    
    # p john.name
    # p john.reveal_age # accesses the private method
    # p john.age # throw's error: private method
    
    # You may find a middle way between private and public with the protected
    # status for variables
    
    # class Student
    #     attr_writer :year
    #     def initialize(year)
    #         @year = year
    #     end 
        
    #     def older(other_student)
    #         @year > other_student.year
    #     end
        
    #     protected
        
    #     attr_reader :year
        
    # end
    
    # john = Student.new(3)
    # sally = Student.new(2)
    
    # p john.older(sally)
    # p john.year
    
    # if you were to change protected to private, then when the sally object
    # attempts to call the year method, it will be inaccessable, even though
    # a method 
    
## Class inheretance, encapsulation, polymorphism

    # encapsulation is hiding functionality from the rest of the code-base
        # why? can't change data/state without obvious intention
        # how? making classes, instantiating objects, and controling access
            # via interfaces (methods)
    # polymorphism: allowing different types of data to respond to the same
        # interface (method) : with different results
        # example: object.speak (speak is a method)
            # if the object is a Cat, result could be 'meow!'
            # if the object is a Dog, result could be 'woof!'
            # if the object is a Duck, result could be 'quack!'
    # 
    
## Modules

    # modules allow you to share behavior across classes (via mixins)
    # you have to watch your names here, becuase a class name like String won't 
    # work, but stringable will!
    
    # module String
    #     def vibrate(force, note)
    #       hertz = force * note 
    #     end
    # end
    
    # class Piano
    #     include String
    # end 
    
    # class Guitar
    #     include String
    # end 
    
    # stienway = Piano.new
    # martin = Guitar.new
    
    # p martin.vibrate(3, 440)
    # p stienway.vibrate(5, 440)
    
## Method Lookup Path

    # The order is class, modules bottom to top (if any), superclass, superclass...
    
## calling .self

    # when you call self within a method you refer to an instance variable
    # when you call self outside a method you refer to a class variable
    # if you don't use .self or @ you'll end up declaring a local variable
    
## Fake Operators and Equality

    # some things that appear to be operators are actually methods
        # if you attempt to use one of these methods like an operator
            # you'll likely run into a no method error
    #
    
    # For example
    
    # class Piano
    #     attr_accessor :type, :keys
    #     def initialize(type, keys)
    #         @type = type
    #         @keys = keys
    #     end
        
    #     def >(other_piano)
    #         @keys > other_piano.keys
    #     end
        
        
    # end
    
    # baldwin = Piano.new('baby grand', 88)
    # shimmel = Piano.new('piano forte', 61)
    
    # p baldwin
    # p shimmel
    # p baldwin.keys > shimmel.keys #words because integer is calling keys
    # p baldwin > shimmel # no method, must make one for >
    
## Collaborator Objects

    # a collaborator object is an object that has a relationship to another
    # object, and it is through that relationship that interfaces become available
    # to each object
    
    class PetOwner
        attr_accessor :owner, :pet
        def initialize(owner, pet)
            @owner = owner
            @pet = pet
        end
    end
    
    class Dog
        def speak
            'woof!'
        end
    end 
    
    pooky = Dog.new
    pete = PetOwner.new('Pete', pooky)
    
    p pete.pet.speak