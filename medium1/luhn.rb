class Luhn
  def initialize(integer)
    @digits = integer.to_s.chars.map(&:to_i)
  end

  def addends
    result = @digits.reverse.each_with_index.map do |digit, index|
      addend = if index.even?  then digit
               elsif digit > 5 then digit * 2 - 9
               else                 digit * 2
               end
    end
    result.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(number)
    new_base_number = number * 10
    if new(new_base_number).valid?
      new_base_number
    else
      luhn_remainder = new(new_base_number).checksum % 10
      new_base_number + (10 - luhn_remainder)
    end
  end
end
