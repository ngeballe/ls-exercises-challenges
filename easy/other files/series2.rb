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
  def initialize(num_string)
    # @nums = num_string.chars.map(&:to_i)

    @numbers = num_string.chars.map(&:to_i)
    @length = @numbers.length
  end

  def slices(num_to_slice)
    # why is variable called that?
    
    raise ArgumentError.new("You're asking too much") if num_to_slice > @length

    number_of_slices = @length - num_to_slice

    slices = []

    # for index in 0..number_of_slices
    (0..number_of_slices).each do |index|
      slices << @numbers.slice(index, num_to_slice)
    end

    slices
  end
end
