require 'pry'

class BeerSong
  def lyrics
    verses(99, 0)
  end

  def verses(start_num, end_num)
    verses = start_num.downto(end_num).map { |number| verse(number) }
    verses.join("\n")
  end

  def verse(number)
    result = "#{bottles_pluralized(number).capitalize} of beer on the " \
             "wall, #{bottles_pluralized(number)} of beer.\n"
    num_to_phrase = { 0 => 'Go to the store and buy some more, ' \
                           "99 bottles of beer on the wall.\n",
                      1 => 'Take it down and pass it around, no ' \
                           "more bottles of beer on the wall.\n" }
    result << (num_to_phrase[number] ||
              'Take one down and pass it around, ' \
              "#{bottles_pluralized(number - 1)} of beer on the wall.\n")
  end

  def bottles_pluralized(number)
    zero_and_one_pluralized = { 0 => 'no more bottles', 1 => '1 bottle' }
    zero_and_one_pluralized[number] || "#{number} bottles"
  end
end

# verse method
# given verse #
# generate

# "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
#       "Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n"
