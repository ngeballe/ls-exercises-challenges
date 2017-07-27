n = '17'

answer = n.reverse.chars.each_with_index.reduce(0) { |value, digit_and_index|
  digit, index = digit_and_index
  value + digit.to_i * 8**index
}

p answer

