class DNA
  def initialize(original_strand)
    @original_strand = original_strand
  end

  def hamming_distance(test_strand)
    effective_distance = [@original_strand.size, test_strand.size].min

    (0..(effective_distance - 1)).count do |index|
      @original_strand[index] != test_strand[index]
    end
  end
end
