require 'pry'

def max_rotation(number)
  # digits = number.to_s.chars
  # (0...digits.size).each do |index|
  #   digits[index..-1] = digits[(index + 1)..-1] << digits[index]
  # end
  # digits.join.to_i

  num_arr = number.to_s.chars
  result_arr = []

  until num_arr.empty? do
    num_arr.push(num_arr.shift)
    result_arr.push(num_arr.shift)
  end

  result_arr.join.to_i
end
