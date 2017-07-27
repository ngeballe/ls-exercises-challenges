class DNA
  def initialize(string)
    @string = string
  end

  def hamming_distance(comparison_string)
    # get shorter length string
    # strings_sorted_by_size = [@string, comparison_string]
    if @string.size < comparison_string.size
      shorter_string = @string
      other_string = comparison_string
    else
      shorter_string = comparison_string
      other_string = @string
    end

    shorter_string.chars.each_with_index.count do |base, index|
      base != other_string[index]
    end
  end
end
