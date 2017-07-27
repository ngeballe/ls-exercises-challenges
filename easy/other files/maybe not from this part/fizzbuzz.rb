(1..100).each do |num|
  if num % 5 == 0 && num % 3 == 0
    print "FizzBuzz"
  elsif num % 3 == 0
    print "Fizz"
  elsif num % 5 == 0
    print "Buzz"
  else
    print num
  end
  print ", " unless num == 100
end
