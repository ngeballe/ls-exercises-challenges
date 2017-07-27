class Diamond
  def self.make_diamond(input_letter)
    width = ('A'..input_letter).to_a.size * 2 - 1
    top_lines = lines_through_middle(input_letter, width)
    (top_lines + top_lines[0..-2].reverse).join
  end

  def self.lines_through_middle(input_letter, width)
    result = ['A'.center(width) + "\n"]
    ('B'..input_letter).each_with_index do |current_letter, index|
      spacing = ' ' * (index * 2 + 1)
      result << (current_letter + spacing + current_letter).center(width) + "\n"
    end
    result
  end
end

# puts Diamond.make_diamond('E')
