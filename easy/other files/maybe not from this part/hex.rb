class Hexadecimal
  LETTER_CONVERSIONS = {'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15 }

  def initialize(digit_string)
    @digit_string = digit_string.downcase
  end

  def to_decimal
    return 0 if @digit_string =~ /[^0-9a-f]/

    digits = @digit_string.chars.map { |char| hex_to_i(char) }

    digit_values = digits.reverse.map.with_index do |char, index|
      char * 16**index
    end.reduce(:+)
  end

  def hex_to_i(char)
    LETTER_CONVERSIONS[char] || char.to_i
  end
end

# convert to 


p Hexadecimal.new('1e42').to_decimal == 7746
p Hexadecimal.new('42').to_decimal
