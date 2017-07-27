module House
  def self.recite
    paragraphs = (1..pieces.size).map do |number|
      combine_pieces(pieces.last(number))
    end
    paragraphs.join("\n\n") + "\n"
  end

  def self.combine_pieces(pieces)
    paragraph = pieces.map { |piece| piece.join("\n") }.join(' ')
    "This is #{paragraph}."
  end

  def self.pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end



# a method to generate a paragraph from multiple lines
# walk backwards from pieces, and generate last (1..n) lines
# class House
#   def self.recite
#     new.recite
#   end

#   def recite
#     paragraphs = (1..pieces.size).map do |number|
#       combine_pieces(pieces.last(number))
#     end
#     paragraphs.join("\n\n") + "\n"
#   end

#   def combine_pieces(pieces)
#     paragraph = pieces.map { |piece| piece.join("\n") }.join(' ')
#     "This is #{paragraph}."
#   end

#   private

#   def pieces
#     [
#       ['the horse and the hound and the horn', 'that belonged to'],
#       ['the farmer sowing his corn', 'that kept'],
#       ['the rooster that crowed in the morn', 'that woke'],
#       ['the priest all shaven and shorn', 'that married'],
#       ['the man all tattered and torn', 'that kissed'],
#       ['the maiden all forlorn', 'that milked'],
#       ['the cow with the crumpled horn', 'that tossed'],
#       ['the dog', 'that worried'],
#       ['the cat', 'that killed'],
#       ['the rat', 'that ate'],
#       ['the malt', 'that lay in'],
#       ['the house that Jack built']
#     ]
#   end
# end
