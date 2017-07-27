require 'pry'

def to_base2(num)
  result = ''

  rest_of_number = num

  (8.downto(0)).each do |power_of_two|
    if 2**power_of_two < rest_of_number
      result << '1'
      rest_of_number -= 2**power_of_two
    else
      result << '0' unless result.empty?
    end
  end

  result
end

def bitwise(num1, num2)
  
end

5.times do
  num1 = rand(1..100)
  num2 = rand(1..100)
  p [num1, num2, num1 | num2, to_base2(num1)]
end

puts to_base2(67)
puts to_base2(63)
