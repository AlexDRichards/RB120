number = 42

case number
when 1          then 'first'
when 10, 20, 30 then 'second'
when 40..49     then 'third'
end

# on line 5, the integer.=== method is invoked
# on line 6, the range.=== method is invoked
# Why is this important? => Because if you are using case in a class of your 
# making you may need to change the beavhior of === and you need to know that
# case is invoking different class methods of ===
