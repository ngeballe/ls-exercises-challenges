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
  def initialize(digit_string)
    # my way
    # @digits = digit_string.chars.map(&:to_i)

    # for first person's way
    @digits = digit_string
  end

  def slices(length)
    # my way
    # raise ArgumentError, 'length is longer than the string of numbers' if length > @digits.length
    # @digits.each_cons(length).to_a

    # my 2nd way
    # raise ArgumentError if length > @digits.length
    # result = []
    # start_index = 0
    # end_index = length - 1
    # while end_index <= @digits.length - 1
    #   result << @digits[start_index..end_index]
    #   start_index += 1
    #   end_index += 1
    # end
    # result

    # first person's way (modified)
    raise ArgumentError if length > @digits.length

    # with map
    # with reduce
    #

    # slices = []
    last_usable_index = @digits.length - length
    # @digits.map do |_, index|

    # end

    nums_to_use = @digits.each_char.with_index.select { |_, idx| idx <= last_usable_index }
    nums_to_use.map do |_, idx| 
      @digits.slice(idx, length).split('').map(&:to_i)
    end
    #.split('').map(&:to_i)



    # @digits.chars.each_with_index do |_, index|
    #   # if i <= last_usable_index
    #   #   # slices << @digits[i..(i + length - 1)].split('').map{|n| n.to_i}
    #   #   slices << @digits.slice(i, length).split('').map(&:to_i)
    #   # else
    #   #   break
    #   # end
    #   break if index > last_usable_index
    #   slices << @digits.slice(index, length).split('').map(&:to_i)
    # end
    # # return slices # don't need explicit return
    # slices
  end
end
