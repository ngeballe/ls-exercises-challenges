require 'pry'

class SecretHandshake
  # convert the number to decimal if need be -- or convert to binary?
  # read number left to right

  CONVERSIONS = { 1 => 'wink', 2 => 'double blink',
                  4 => 'close your eyes', 8 => 'jump' }.freeze

  def initialize(number)
    if number =~ /^[10]+$/ # binary
      @binary_string = number
    elsif number.is_a?(Integer)
      @binary_string = to_binary_string(number)
    end
  end

  def commands
    return [] if @binary_string.nil?
    result = []
    # loop through binary, in reverse order
    @binary_string.reverse.each_char.with_index do |char, index|
      next unless char == '1'
      # append to result
      index == 4 ? result.reverse! : result << CONVERSIONS[2**index]
    end
    result
  end

  private

  def to_binary_string(number)
    result = ''
    divisor = 2
    while number > 0
      number, remainder = number.divmod(divisor)
      result.prepend(remainder.to_s)
    end
    result
  end
end
