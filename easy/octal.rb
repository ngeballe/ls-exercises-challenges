class Octal
  def initialize(digit_string)
    @digit_string = digit_string
    @digits = digit_string.chars.map(&:to_i)
  end

  def to_decimal
    return 0 unless @digit_string =~ /^[0-7]+$/

    values = @digits.reverse.map.with_index do |digit, index|
      digit * (8 ** index)
    end
    values.reduce(:+)
  end
end
