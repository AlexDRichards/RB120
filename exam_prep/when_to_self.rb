# EXAMPLE 1
# p self #=> main
# class Bird
#     p self #=> Bird
#     def initialize(name)
#         p self #=> <Parrot:0x0000000013ef648> (hex code will vary)
#         self.name = name
#     end 
    
# end 

# class Parrot < Bird
    
#   attr_accessor :name 
   
# end

# polly = Parrot.new('polly')

# p polly.name

# EXAMPLE 2

# p self #=> main
# class Bird
#     p self #=> Bird
#     def initialize(name)
#         p self #=> <Parrot:0x0000000013ef648> (hex code will vary)
#         self.name = name
#     end
    
#     def self.what_am_i?
#         "I'm a bird"
#     end
    
# end 

# class Parrot < Bird
    
#   attr_accessor :name 
   
# end

# polly = Parrot.new('polly')
# # p polly.what_am_i?
# p polly.class.what_am_i?
# p Parrot.what_am_i?

# # p polly.name

module Administration
    def open_restaurant
    end
    
    def dismiss_employee
    end
    
    def answer_complaint
        "What is wrong?"
    end 
end 

module Courtesy
    def greet
       "Hello, how can I help you?" 
    end
end

class Restaurant
    attr_accessor :manager, :masterchef, :underchef, :server
    attr_reader :all_staff
    def initialize(manager, masterchef, underchef, server)
       self.manager = manager
       self.masterchef = masterchef
       self.underchef = underchef
       self.server = server
       @all_staff = [manager, masterchef, underchef, server]
    end
end

class Manager
    include Administration
    include Courtesy
end 

class Cook
    def prepare_food
        "cooking"
    end
end 

class MasterChef < Cook
    include Administration
    include Courtesy
end 


class UnderChef < Cook
    include Courtesy
    
end 
    

class Server
    include Courtesy
end 


manager = Manager.new
masterchef = MasterChef.new
underchef = UnderChef.new
server = Server.new

rubios = Restaurant.new(manager, masterchef, underchef, server)

p rubios.manager.answer_complaint
p rubios.server.greet
p rubios.underchef.prepare_food
# p rubios.server.prepare_food #=> error no method
rubios.all_staff.each {|staff| puts staff.greet} # Note the polymorphic behavior