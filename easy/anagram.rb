require 'pry'

class Anagram
  def initialize(word)
    @target_word = word
  end

  def match(words)
    # select words that, when letters are sorted, == the sorted letters of the target word
    target_letters = @target_word.downcase.chars.sort
    words.select do |word|
      word = word.downcase
      word.chars.sort == target_letters && word != @target_word
    end
  end
end
