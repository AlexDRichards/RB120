# element assignment
my_array[4] = "fifth"
puts my_array.inspect                            # => ["first", "second", "third", "fourth", "fifth"]

my_array.[]=(5, "sixth")
puts my_array.inspect                            # => ["first", "second", "third", "fourth", "fifth", "sixth"]