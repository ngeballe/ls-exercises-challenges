class WordProblem
  OPERATORS = { 'plus' => :+,
                'minus' => :-,
                'multiplied' => :*,
                'divided' => :/ }.freeze

  def initialize(string)
    @words = string.scan(/[\w-]+/)
    @words.map! do |word|
      if word =~ /\A-?\d+\z/
        word.to_i
      else
        OPERATORS[word]
      end
    end
    @words.compact!
  end

  def answer
    raise ArgumentError if @words.size < 3
    while @words.size > 1
      num1, operator, num2 = @words[0..2]
      @words[0..2] = num1.send(operator, num2)
    end
    @words.first
  end
end
