class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# Hello.hi => does this work? no... becuase hi is not a class method
# if you changed def hi... to def self.hi, it would work.