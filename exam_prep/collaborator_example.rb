# you have two classes and two instantiated objects
# In one class, you have an instance variable that can be assigned an 
# instantiated object from the other class
# That instance variable now points at an object from another class, 
# even though it (the variable) belongs to a different class.

# class Owner
#     attr_accessor :pianos, :name
#     def initialize(name)
#         @name = name
#         @pianos = []
#     end 
# end

# class Kawai
#     def play_c_major_scale
#         puts "a beautiful series of sparkling notes is played"
#     end
# end

# class Steinway
#     def play_c_major_scale
#         puts "a beautiful series of dark notes is played"
#     end
# end

# jim = Owner.new('Jim')
# kawai = Kawai.new
# steinway = Steinway.new

# jim.pianos << kawai
# jim.pianos << steinway
# jim.pianos.each {|piano| piano.play_c_major_scale}

# The principle at work in collaborator objects is that an object's instance
# variable will point at another object. The instance variable then becomes
# a way to engage with interfaces accessible to the other object.

# An example of this would be 
