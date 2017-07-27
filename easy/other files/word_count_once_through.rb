require 'pry'

class Phrase
  def initialize(string)
    # @words = string.downcase.scan(/\w+'\w+|\w+/)
    @string = string
  end

  def word_count
    # @words.each_with_object(Hash.new(0)) do |word, hash|
    #   hash[word] += 1
    # end
    counts = Hash.new(0)
    word = ''
    @string.each_char do |char|
      char.downcase!
      if char =~ /\w/ || (char == "'" && !word.empty?)
        word << char
      else
        word.chop! if word.end_with?("'")
        counts[word] += 1 unless word.empty?
        word = ''
      end
    end
    counts[word] += 1 unless word.empty?
    counts
  end
end
