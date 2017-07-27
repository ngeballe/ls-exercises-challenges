class PigLatin
  def self.translate(string)
    pig_latin_words = string.split.map do |word|
      rotate_consonants(word) + 'ay'
    end
    pig_latin_words.join(' ')
  end

  def self.rotate_consonants(word)
    while word =~ /\A[^aeiouxy] | \A[xy][aeiouxy] | \Au.*q\z/x
      word = word[1..-1] + word[0]
    end
    word
  end
end
