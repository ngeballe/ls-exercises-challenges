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
    if number.zero?
      result << 'Go to the store and buy some more, ' \
                "99 bottles of beer on the wall.\n"
    else
      result << "Take #{number == 1 ? 'it' : 'one'} down and pass it " \
                "around, #{bottles_pluralized(number - 1)} of beer " \
                "on the wall.\n"
    end
  end

  def bottles_pluralized(number)
    case number
    when 0 then 'no more bottles'
    when 1 then '1 bottle'
    else        "#{number} bottles"
    end
  end
end

# verse method
# given verse #
# generate

# "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
#       "Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n"
