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

# OCR for each line of numbers in the full text
class OCRLine
  attr_reader :text, :text_lines

  include Digits
  DIGITS = [ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE].freeze

  def initialize(text)
    @text = text
    # @lines_of_digits = text.split("\n\n")
    @text_lines = text.split("\n")
  end

  def convert
    # take 3 characters from each line at a time
    converted_chars = []
    character_range = 0..2
    loop do
      text_chunk = get_text_chunk(character_range)
      converted_chars << digit_lines_to_digits.fetch(text_chunk) { '?' }

      character_range = (character_range.max + 1)..(character_range.max + 3)
      break if character_range.max >= text_width
    end
    converted_chars.join
  end

  def gettext_chunk(character_range)
    text_lines.map do |line|
      if line[character_range].nil?
        ''
      else
        line[character_range].rstrip
      end
    end
  end

  def text_width
    text_lines.map(&:size).max
  end

  def digit_lines
    DIGITS.map { |digit_text| digit_text.split("\n") }
  end

  def digit_lines_to_digits
    Hash[digit_lines.zip('0'..'9')]
  end
end

# OCR for full text given
class OCR
  attr_reader :lines_of_digits

  def initialize(text)
    @lines_of_digits = text.split("\n\n")
  end

  def convert
    lines_converted = lines_of_digits.map do |line_string|
      OCRLine.new(line_string).convert
    end
    lines_converted.join(',')
  end
end
