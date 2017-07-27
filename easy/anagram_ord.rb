class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(word, @word) }
  end

  private

  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase
    chars1 = word1.downcase.chars
    chars2 = word2.downcase.chars
    # same letters
    return false unless chars1 - chars2 == [] && chars2 - chars1 == []
    # sum of letter values must be same
    chars1.map(&:ord).reduce(:+) == chars2.map(&:ord).reduce(:+)
  end
end
