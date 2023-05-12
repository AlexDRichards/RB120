class School
    
    def initialize(name)
        @name = name
    end

    def set_name=(name)
        @name = name
    end

    def name 
        @name
    end
end

bromfield = School.new('Bromfield')
p bromfield.name
bromfield.set_name = 'boooooomfield'
p bromfield.name



class Sports
    attr_accessor :name
    def initialize(name)
        @name = name
    end

end

tennis = Sports.new('tennis')
p tennis
tennis = 'ball'
p tennis