# - alphabet: 'ABCD...'
# - input: E



# - how many rows?
#   - size: distance from E to A
#   - number of rows: size * 2 - 1
# - for each row
#   - what letter?
#   - where to start? how much left padding?
#     - distance from current letter to input letter
#   - number of spaces between the two letters
#     - distance to 'A'
#   - special case - "A" for first & last row

# letters('C') #=> ['A', 'B', 'C', 'B', 'A']
# left_padding(row_number) = " " * 

# distance_between_letters(letter1, letter2)

class Diamond
  def self.make_diamond(input_letter)
    letters = generate_letters(input_letter)
    letters.map do |current_letter|
      if current_letter == 'A'
        padding(current_letter, input_letter) + current_letter + padding(current_letter, input_letter) + "\n"
      else
        padding(current_letter, input_letter) + current_letter + spacing(current_letter) + current_letter + padding(current_letter, input_letter) + "\n"
      end
    end
  end

  def self.padding(letter, input_letter)
    ' ' * distance_between_letters(letter, input_letter)
  end

  def self.spacing(letter)
    ' ' * distance_between_letters('A', letter)
  end

  def self.distance_between_letters(letter1, letter2)
    
  end

  def self.generate_letters(letter)
    # ...
  end
end
