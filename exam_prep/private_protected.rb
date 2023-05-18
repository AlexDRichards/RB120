class Piano
    def initialize(type)
        @type = type
    end

    def same?(other_piano)
        p type #== other_piano.type
    end

    private

    attr_reader :type
end

stienway = Piano.new('steinway')
baldwin = Piano.new('baldwin')

p stienway.same?(baldwin)

# So on ln. 18 the object is stienway,
# and the instance method (.same?) belongs to
# that object, and that method is passed
# another object with a different set
# of instance methods. steinway.same? is
# passed the object baldwin, which then tries to
# call steinway.type, but since it's private, it won't work
# if it were protected, it would work, also if public

# UPDATE

# The above answer isn't accurate.
# The steinway object could indeed access :type becuase it would be doing so 
# via an interface that is within the class #Piano
# The reason why the error is thrown is because the object, baldwin
# is trying to use :type from within the steinway object's class