def max_rotation(number)
  digits = number.to_s.chars
  # for 0..last digit, rotate that digit to end
  digits.each_with_index do |char, index|
    digits[index..-1] = digits[(index + 1)..-2] + char
  end
  digits
end
