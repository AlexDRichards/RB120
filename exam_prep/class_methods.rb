class Piano
    attr_accessor :name
    def initialize(name)
        @name = name
    end

    def self.what_am_i
        "I'm a piano class"
    end
end

kawai = Piano.new('kawai')

p Piano.what_am_i