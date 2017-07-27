class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(word, @word)}
  end

  private

  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase
    letter_frequencies(word1) == letter_frequencies(word2)
  end

  def letter_frequencies(word)
    # same letters, same # of each letter?
    result = Hash.new(0)
    word.downcase.each_char do |char|
      result[char] += 1
    end
    result
  end
end
