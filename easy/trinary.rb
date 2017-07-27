class Trinary
  def initialize(digit_string)
    @digit_string = digit_string
  end

  def to_decimal
    return 0 if @digit_string =~ /[^0-2]/

    @digit_string.chars.reverse.each_with_index.reduce(0) do |sum, char_and_index|
      char, index = char_and_index
      sum + char.to_i * (3**index)
    end
  end
end
