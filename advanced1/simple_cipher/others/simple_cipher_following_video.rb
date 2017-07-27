
# - specify a key for the shift distance (substitution cipher)

# - substitution
  # - encoding
  #   - for each character in the plain text, (shift to the right encoding)
        #- if we reach the end of the alphabet, wrap back to 'a'
#     - ensuring that the key is composed of numbers and capital letters.
#       - If it has them, throw an ArgumentError
#     - If someone doesn't submit a key at all, generate a truly random key of at least 100 characters in length
      # - what happens if key is shorter than the plaintext?

  #     # - find the index of the character in the text
  #     # - find the character of that same index in the key
  #     # - calculate how many letters that character is after the letter 'a' (e.g., b is 1, c is 2, ...)
  #     # - shift the character in the text that number of characters to the right
  # - decoding
  #   - for each character in the plain text, (shift to the left decoding)

# - shift right encode a character
#   - shift to right, based on the key character (n)
#     - shift right (char - 'a') positions
#     - with wrap

# - shift left encode a character
#   - shift to left, based on the key character (n)
#     - shift left (char - 'a') positions
#     - with wrap

class Cipher
  def initialize(key)
    validate_key(key)
    @key = key || generate_key
  end

  def validate_key(key)
    raise ArgumentError, "The key can't have capital letters or numbers" if key.match(/[A-Z0-9]/)
  end

  def generate_key
    result = ''
    (1..100).map { |_| [*'a'..'z'].sample }.join
  end

  def encode(plaintext)
    result = ''
    plaintext.chars.each_with_index do |char, index|
      distance = @key[index].ord - 'a'.ord
      result << shift(char, distance)
    end
    result.join
  end

  def decode(ciphertext)
    result = ''
    plaintext.chars.each_with_index do |char, index|
      distance = @key[index].ord - 'a'.ord
      result << shift(char, -(distance))
    end
    result.join    
  end

  def shift(char, distance)
    num = char.ord + distance
    if num < 'a'.ord
      (num + 26).chr
    elsif num > 'z'.ord
      (num - 26).chr
    else
      num.chr
    end
  end
end
