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
  THREE =  <<-NUMBER.chomp
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
  include Digits
  CONVERSIONS = { SEVEN => '7', ZERO => '0', ONE => '1', TWO => '2', THREE => '3',
                  FOUR => '4', FIVE => '5', SIX => '6',
                  EIGHT => '8', NINE => '9' }
  DIGIT_LINES_TO_DIGTIS = {}
  CONVERSIONS.each do |digit_text, digit|
    # DIGIT_LINES_TO_DIGTIS[digit_text.split("\n")] = digit
    DIGIT_LINES_TO_DIGTIS[digit_text.lines] = digit
  end

  attr_reader :text, :text_lines

  def initialize(text)
    @text = text
    # @text_lines = text.split("\n")
    @text_lines = text.lines
  end

  def convert
    raise IOError unless right_size?
    convert_to_digits(text)
  end

  def convert_to_digits(string)
    if CONVERSIONS.key?(string)
      CONVERSIONS[string]
    else
      last_digit_pair = DIGIT_LINES_TO_DIGTIS.detect do |digit_lines, digit|
        digit_fits_at_end?(digit_lines, string.lines)
      end
      return '?' if last_digit_pair.nil?
      last_digit_lines, last_digit = last_digit_pair
      without_last_lines = lines_without_last_digit(last_digit_lines, string.lines)
      without_last_as_text = without_last_lines.map { |line| line + "\n" }.join
  #     binding.pry if string ==  <<-NUMBER.chomp
  #   _  _     _  _  _  _
  # | _| _||_||_ |_   ||_|
  # ||_  _|  | _||_|  ||_|

  #   NUMBER
      convert_to_digits(without_last_as_text) + last_digit
    end
  end

  def right_size?
    text.lines.count == 3
  end

  def digit_fits_at_end?(digit_lines, string_lines)
    string_lines.each_with_index do |line, idx|
      return false unless line.end_with?(digit_lines[idx])
    end
    true
  end

  def lines_without_last_digit(last_digit_lines, string_lines)
    # chop off the characters on the right of each line that are from the last digit
    substituted = string_lines.map.with_index do |line, index|
      size_of_last_digit_line = last_digit_lines[index].size
      line[0..-1 - size_of_last_digit_line]
    end
    substituted.map(&:rstrip)
  end
end


# If the input is the correct size, but not recognizable, your program should return '?'. 
# If the input is the incorrect size, your program should return an error.


