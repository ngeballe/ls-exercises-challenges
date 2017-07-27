class PhoneNumber
  attr_reader :number

  DEFAULT_NUMBER = '0' * 10

  def initialize(number)
    number.gsub!(/[^0-9a-z]+/i, '')
    @number = if number =~ /[a-z]/i || number.size < 10
                DEFAULT_NUMBER
              elsif number.size == 11 && number.start_with?('1')
                number[1..-1]
              elsif number.size == 10
                number
              else
                DEFAULT_NUMBER
              end
  end

  def area_code
    @number[0..2]
  end

  def exchange_code
    @number[3..5]
  end

  def last_four_numbers
    @number[6..9]
  end

  def to_s
    "(#{area_code}) #{exchange_code}-#{last_four_numbers}"
  end
end
