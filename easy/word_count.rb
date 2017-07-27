class Phrase
  def initialize(string)
    @words = string.downcase.scan(/\w+'\w+|\w+/)
  end

  def word_count
    @words.each_with_object(Hash.new(0)) do |word, hash|
      hash[word] += 1
    end
  end
end
