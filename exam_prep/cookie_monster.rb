class Person
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  
    def greet
       "Hello! they call me #{name}"
    end
end
  
  class Puppet < Person
    def initialize(name)
      super(name)
    end
  
    def greet(message)
      puts super() + message
    end
  end
  
  puppet = Puppet.new("Cookie Monster")
  puppet.greet(" and I love cookies!")
  
  
  # NOTE! on line 19, you MUST include () after super. Otherwise ruby expects 
  # the argument passed in on line 18 to be sent up to line 8. And that 
  # will throw an error becuase the greet on line 8 doesn't take an argument
  