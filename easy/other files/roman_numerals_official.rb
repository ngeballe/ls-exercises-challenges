require 'pry'

class Fixnum
  ROMAN_NUMERAL_RULES = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }

  def to_roman
    remainder = self
    result = ''
    ROMAN_NUMERAL_RULES.each do |roman, arabic|
      # see how many arabics fit in the remainder?
      # while remainder >= arabic
      #   result << roman
      #   remainder -= arabic
      # end

      number_of_letters_to_add = remainder / arabic
      result << roman * number_of_letters_to_add
      remainder -= arabic * number_of_letters_to_add
    end
    result
  end
end
