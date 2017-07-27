# require 'pry'

class Diamond
  def self.make_diamond(end_letter)
    num_letters = ('A'..end_letter).to_a.size
    lines = lines(end_letter, num_letters)
    (lines + lines[0..-2].reverse).join
  end

  def self.lines(end_letter, num_letters)
    result = [' ' * (num_letters - 1) + 'A' + ' ' * (num_letters - 1) + "\n"]
    ('B'..end_letter).each_with_index do |letter, index|
      # result << line(letter, index, num_letters)
    end
    result
  end

  def self.line(letter, index, num_letters)
    outer_spacing = ' ' * (num_letters - index - 2)
    inner_spacing = ' ' * (index * 2 + 1)
    outer_spacing + letter + inner_spacing + letter + outer_spacing + "\n"
  end
end
