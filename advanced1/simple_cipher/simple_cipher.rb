class Cipher
  LETTERS = [*'a'..'z']

  attr_reader :key

  def initialize(key = nil)
    if key
      raise ArgumentError unless key =~ /\A[a-z]+\z/
      @key = key
    else
      @key = (1..100).map { LETTERS.sample }.join
    end
  end

  def encode(text)
    shift_letters(text, :encode)
  end

  def decode(text)
    shift_letters(text, :decode)
  end

  def shift_letters(text, encryption_direction)
    letters_shifted = text.chars.map.with_index do |char, index|
      new_letter_index = case encryption_direction
                         when :encode then LETTERS.index(char) + offset(index)
                         when :decode then LETTERS.index(char) - offset(index)
                         end
      new_letter_index = new_letter_index % LETTERS.size
      LETTERS[new_letter_index]
    end

    letters_shifted.join
  end

  def offset(index)
    offset_letter = key[index]
    LETTERS.index(offset_letter)
  end
end
