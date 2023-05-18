=begin
a company that sells pianos can do modifications to make some pianos sound
like others. Steinways have a soft and dark sound, Kawais have a bright and
ebullient sound, Shimmels have a sharp and brassy sound. Some pianist are good
enough to get different sounds from the piano. 
=end 

# INCOMPLETE #

=begin
Create a namespace that groups employees of a restaurant. 
=end

module Courtesy
   def greet
       "Hello"
   end
end

module RestaurantStaff
    class Chef
        include Courtesy
        def cook
            "cooking"
        end
        
        def engage_customer
            "#{Courtesy::lsgreet}"
        end
    

    end
    
    class Server
        
    end 

end



al = RestaurantStaff::Chef.new
bob = RestaurantStaff::Server.new

p al.cook
p al.greet
p al.engage_customer