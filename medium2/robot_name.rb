class Robot
  LETTERS = ('A'..'Z').to_a
  DIGITS = (0..9).to_a.map(&:to_s)

  @@names = []

  def initialize
    reset
  end

  def name
    @name ||= generate_name
  end

  def generate_name
    # 2 capital letters, then 3 numbers
    result = ''
    loop do
      2.times { result << LETTERS.sample }
      3.times { result << DIGITS.sample }
      break unless @@names.include?(result)
      result = ''
    end
    @@names << result
    result
  end

  def reset
    @name = nil
  end
end
