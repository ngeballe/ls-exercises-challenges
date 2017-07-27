class Integer
  def to_roman
    case
    when self < 4
      'I' * self
    when self == 4
      'IV'
    when self < 9
      'V' + (self % 5).to_roman
    when self == 9
      'IX'
    when self < 40
      'X' * (self / 10) + (self % 10).to_roman
    when self < 50
      'XL' + (self % 40).to_roman
    when self < 90
      'L' + (self % 50).to_roman
    when self < 100
      'XC' + (self % 90).to_roman
    when self < 400
      'C' * (self / 100) + (self % 100).to_roman
    when self < 500
      'CD' + (self % 400).to_roman
    when self < 900
      'D' + (self % 500).to_roman
    when self < 1_000
      'CM' + (self % 900).to_roman
    else
      'M' * (self / 1_000) + (self % 1_000).to_roman
    end
  end
end
