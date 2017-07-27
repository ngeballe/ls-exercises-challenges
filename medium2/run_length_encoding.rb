require 'pry'

class RunLengthEncoding
  def self.encode(input)
    # get letter sets - [["A", ["A", "A"]], ["B", ["B", "B", "B"]]...]
    letter_chunks = input.chars.chunk { |el| el }
    number_letter_pairs = letter_chunks.map do |letter, group|
      group.size == 1 ? letter : "#{group.size}#{letter}"
    end
    number_letter_pairs.join
  end

  def self.decode(input)
    # get number, letter sets
    number_letter_pairs = input.scan(/\d*[^\d]/i)
    letters = number_letter_pairs.map do |pair|
      if pair.size == 1 # just letter
        pair
      else
        pair[-1] * pair[0..-2].to_i # letter * number.to_i
      end
    end
    letters.join
  end
end

# 'AABBBCCCC' => '2A3B4C'

# count = 0
# char = s[0]
# while s[count] == char
#   count += 1
# end
# if char == 1
#   result << char
# else
#   result << "#{count}#{char}"
# end
