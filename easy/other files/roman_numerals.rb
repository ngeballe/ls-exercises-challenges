require 'pry'

class Fixnum
  ROMAN_CONVERSIONS = { 1000 => 'M', 500 => 'D', 100 => 'C', 50 => 'L', 10 => 'X', 5 => 'V', 1 => 'I' }

  def to_roman
    # create a result string
    result = ''
    # remainder = self

    number = self

    # see how many thousands
    thousand_count, number = number.divmod(1000)

    # if any, add the thousand count to the result and subtract count * 1000 from number
    result << 'M' * thousand_count
    # how many 500's
    [100, 10, 1].each do |n|
      # see how many times n goes into the number
      n_count, number = number.divmod(n)
      n_numeral = ROMAN_CONVERSIONS[n]
      five_n_numeral = ROMAN_CONVERSIONS[5 * n]
      ten_n_numeral = ROMAN_CONVERSIONS[10 * n]
      result << case n_count
              # if it goes in 0-3 times, add n's numeral * the count
               when 0..3 then n_numeral * n_count
      # if it goes in 4 times, add n's numeral, then 5*n's numeral
               when 4 then n_numeral + five_n_numeral
      # if it goes in 6-8 times, add 5*n's numeral, then n's numeral * (the count - 5)
               when 5..8 then five_n_numeral + n_numeral * (n_count - 5)
      # if n goes in 9 times, times, add to the result string n's numeral, then 10*n's numeral
               when 9 then n_numeral + ten_n_numeral
               end  
    end

    result
  end
end
