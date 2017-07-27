require 'pry'

class ZeroVerse
  def verse(_number)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class OneVerse
  def verse(_number)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class TwoVerse
  def verse(_number)
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class DefaultVerse
  def verse(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end
end

class BeerSong
  def initialize  
    @verse_lookup = { 0 => ZeroVerse, 1 => OneVerse, 2 => TwoVerse }
    @verse_lookup.default = DefaultVerse
  end

  # def verse(number)
  #   @verse_lookup[number].new.verse(number)
  # end

  def verse(a_verse, n)
    a_verse.verse(n)
  end

  def verses(start_num, end_num)
    verses = start_num.downto(end_num).map do |num|
      verse(num)
    end
    verses.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end


