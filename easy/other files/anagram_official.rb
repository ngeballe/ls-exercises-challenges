require 'pry'

class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    # select words that, when letters are sorted, == the sorted letters of the target word
    words.select { |word| anagram?(@word, word)}
    # target_letters = @target_word.downcase.chars.sort
    # words.select do |word|
    #   word = word.downcase
    #   word.chars.sort == target_letters && word != @target_word
    # end
  end

  private

  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase
    word1.downcase.chars.sort == word2.downcase.chars.sort
  end
end
