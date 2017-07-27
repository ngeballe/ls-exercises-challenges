class Translation
  CODON_TO_AMINO_ACID = {
                          'AUG' => 'Methionine',
                          'UUU' => 'Phenylalanine',
                          'UUC' => 'Phenylalanine',
                          'UUA' => 'Leucine',
                          'UUG' => 'Leucine',
                          'UCU' => 'Serine',
                          'UCC' => 'Serine',
                          'UCA' => 'Serine',
                          'UCG' => 'Serine',
                          'UAU' => 'Tyrosine',
                          'UAC' => 'Tyrosine',
                          'UGU' => 'Cysteine',
                          'UGC' => 'Cysteine',
                          'UGG' => 'Tryptophan',
                          'UAA' => 'STOP',
                          'UAG' => 'STOP',
                          'UGA' => 'STOP' 
                        }.freeze

  def self.of_codon(codon)
    CODON_TO_AMINO_ACID.fetch(codon) { raise InvalidCodonError }
  end

  def self.of_rna(strand)
    # break strand into groups of 3
    codons = strand.scan(/.{3}/)

    codons.each_with_object([]) do |codon, results|
      amino_acid = of_codon(codon)
      return results if amino_acid == 'STOP'
      results << amino_acid      
    end
  end
end

class InvalidCodonError < TypeError
end
