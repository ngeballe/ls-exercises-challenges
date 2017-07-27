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
    # @verse_lookup = Hash.new(:verse_default).merge({ 0 => :verse_0, 1 => :verse_1, 2 => :verse_2 })

    # @verse_lookup = Hash.new(lambda { |number| "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    # "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n" })
    # .merge({ 0 => lambda { |_number| "No more bottles of beer on the wall, no more bottles of beer.\n" \
    # "Go to the store and buy some more, 99 bottles of beer on the wall.\n" }, 
    # 1 => lambda { |_number| "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    # "Take it down and pass it around, no more bottles of beer on the wall.\n" },
    # 2 => lambda { |_number| "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    # "Take one down and pass it around, 1 bottle of beer on the wall.\n" } }) ## this stretches hash, not very idiomatic

    @verse_lookup = Hash.new(DefaultVerse).merge({ 0 => ZeroVerse, 1 => OneVerse, 2 => TwoVerse })
  end

  def verse(number)
    # method = @verse_lookup[number]

    # send(method, number)
    # method.call(number)

    @verse_lookup[number].new.verse(number)
  end

  def verse_default(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end

  def verse_2(_number)
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def verse_1(_number)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def verse_0(_number)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
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

# hide inconsistency behind:
# - methods
# - lambdas
# - classes -- you see this the most of the 3, probably
