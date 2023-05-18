class Foo
    def self.method_a
      "Justice" + all
    end
  
    def self.method_b(other)
      "Justice" + other.exclamate
    end
  
    private
  
    def self.all
      " for all"
    end
  
    def self.exclamate
      all + "!!!"
    end
end
  
  foo = Foo.new
  puts Foo.method_a
  puts Foo.method_b(Foo)
  
  # Lots of looping here
  # 21 initializes new object from #Foo
  # 22 outputs return of class method call .method_a
  # 23 does several things
    # calls method_b, passing in class #Foo
    # method_b prints "Justice" then it calls #.exlamate on argument
    # method #.exclamate calls method #.all, which prints " for all"
    # method_b concatenates "!!!" to the return of metod #.all
  #
  
  