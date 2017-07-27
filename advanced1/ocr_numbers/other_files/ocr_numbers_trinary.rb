require 'pry'

module Digits
  ZERO = <<-NUMBER.chomp
 _
| |
|_|

    NUMBER
  ONE = <<-NUMBER.chomp

  |
  |

    NUMBER
  TWO = <<-NUMBER.chomp
 _
 _|
|_

    NUMBER
  THREE = <<-NUMBER.chomp
 _
 _|
 _|

    NUMBER
  FOUR = <<-NUMBER.chomp

|_|
  |

    NUMBER
  FIVE = <<-NUMBER.chomp
 _
|_
 _|

    NUMBER
  SIX = <<-NUMBER.chomp
 _
|_
|_|

    NUMBER
  SEVEN = <<-NUMBER.chomp
 _
  |
  |

    NUMBER
  EIGHT = <<-NUMBER.chomp
 _
|_|
|_|

    NUMBER
  NINE = <<-NUMBER.chomp
 _
|_|
 _|

    NUMBER
end

class OCR
  attr_reader :text

  include Digits

  DIGITS = [ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE]
  TRINARY_CONVERSIONS = { ' ' => '0', '_' => '1', '|' => '2' }

  def initialize(text)
    @text = text
    # get text as trinary
  end

  def convert
    lines = text.split("\n")
    binding.pry
  end

  def convert_digit_chunk(chunk)
    trinary = to_trinary(text)
    text_to_digit[trinary]
  end

  def to_trinary(text)
    text.gsub("\n", '').chars.map { |char| TRINARY_CONVERSIONS[char] }.join
  end

  def text_to_digit
    digits_as_trinaries = DIGITS.map { |num_text| to_trinary(num_text) }
    result = Hash[digits_as_trinaries.zip('0'..'9')]
    result.default = '?'
    result
  end
end
