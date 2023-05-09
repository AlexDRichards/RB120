class Car
    def initialize(make, model)
      @make = make
      @model = model
    end
    
    def info
      puts "#@make #@model"
    end
    
    private
    attr_reader :make, :model
    attr_writer :make
end

civic = Car.new('honda', 'civic')
p civic.info
civic.make = 'acura'
p civic.info


class Truck
    def initialize(make, model)
        @make = make
        @model = model
    end
      
    def info
      puts "#@make #@model"
    end
      
    private
    attr_reader :make, :model
end

ranger = Truck.new("ford", "ranger")
p ranger
p ranger.info