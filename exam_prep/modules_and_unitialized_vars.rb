module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim                                  # => nil

# note that because the interface .enable_swimming was never run, the variable
# was never assigned. So it's nil.

# however:

teddy.enable_swimming

p teddy.swim  # => "swimming!"