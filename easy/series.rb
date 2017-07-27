class Series
  def initialize(number_string)
    @numbers = number_string.chars.map(&:to_i)
  end

  def slices(slice_length)
    if slice_length > @numbers.length
      raise ArgumentError, "Slices can't be longer than the series"
    end

    (0..@numbers.length - slice_length).map do |start_index|
      @numbers.slice(start_index, slice_length)
    end
  end
end

