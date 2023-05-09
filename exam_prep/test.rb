class Piano
    def initialize(type)
        @type = type
    end

    def same?(other_piano)
        type == other_piano.type
    end

    private

    attr_reader :type
end

stienway = Piano.new('steinway')
baldwin = Piano.new('baldwin')

p stienway.same?(baldwin)