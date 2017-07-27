# event sequence for a given number
class SecretHandshake
  EVENTS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(number)
    @binary_string = number.is_a?(Integer) ? number.to_s(2) : number
  end

  def commands
    results = []
    last_four_digits.each_with_index do |char, index|
      results << EVENTS[index] if char == '1'
    end
    results.reverse! if @binary_string.size == 5 && @binary_string[0] == '1'
    results
  end

  private

  def last_four_digits
    last_four_string = if @binary_string.size >= 4
                         @binary_string[-4..-1]
                       else
                         format('%04d', @binary_string)
                       end
    last_four_string.chars.reverse
  end
end
