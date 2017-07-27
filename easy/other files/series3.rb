require 'pry'

# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234

# And the following 4-digit series:

# - 0123
# - 1234

# series class
class Series
  def initialize(string)
    # @arr = string.split(//).map(&:to_i)
    @arr = string.chars.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError if @arr.length < num

    new_arr = []

    original_input_num = num
    # index = 0
    (0..@arr.length).each do |index|
      new_arr << @arr[index..num - 1]
      num += 1
    end

    # while index < @arr.length
    #   new_arr << @arr[index..num - 1]
    #   num += 1
    #   index += 1
    # end

    # binding.pry

    # while new_arr.last.length != original_input_num do
    #   new_arr.pop
    # end

    new_arr.select { |set| set.length == original_input_num }

    # new_arr.slice(0, num)
  end
end
