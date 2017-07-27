# rubocop:disable Metrics/MethodLength
class House
  def self.recite
    new.verses
  end

  def verses
    verse_array = (1..pieces.size).map do |verse_num|
      'This is ' + verse(verse_num)
    end
    verse_array.join("\n")
  end

  def verse(num)
    if num == 1
      pieces[-1][0] + ".\n"
    else
      new_pieces(num) + verse(num - 1)
    end
  end

  private

  def new_pieces(num)
    pieces[-num][0] + "\n" + pieces[-num][1] + ' '
  end

  def pieces
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
