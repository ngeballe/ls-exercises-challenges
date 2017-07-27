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
    number_type_object = NumberType.new(number)

    bottles_pluralized = number_type_object.bottles_pluralized
    last_sentence = number_type_object.last_sentence

    "#{bottles_pluralized.capitalize} of beer on the wall, " \
      "#{bottles_pluralized} of beer.\n#{last_sentence}\n"
  end

  def bottles_pluralized(number)
    zero_and_one_pluralized = { 0 => 'no more bottles', 1 => '1 bottle' }
    zero_and_one_pluralized[number] || "#{number} bottles"
  end
end

class NumberType
  NUMBER_TO_WORD = { 0 => 'zero', 1 => 'one' }.freeze

  def initialize(number)
    @number = number
    number_in_words = NUMBER_TO_WORD[number] || 'other'
    @number_type = Object.const_get(number_in_words.capitalize).new
  end

  def bottles_pluralized
    @number_type.bottles_pluralized(@number)
  end

  def last_sentence
    next_number = NumberType.new(@number - 1)
    bottles_pluralized_for_next_number = next_number.bottles_pluralized
    @number_type.last_sentence(bottles_pluralized_for_next_number)
  end
end

class Zero
  def bottles_pluralized(_number)
    'no more bottles'
  end

  def last_sentence(_bottles_pluralized_for_next_number)
    'Go to the store and buy some more, 99 bottles of beer on the wall.'
  end
end

class One
  def bottles_pluralized(number)
    "#{number} bottle"
  end

  def last_sentence(_bottles_pluralized_for_next_number)
    'Take it down and pass it around, no more bottles of beer on the wall.'
  end
end

class Other
  def bottles_pluralized(number)
    "#{number} bottles"
  end

  def last_sentence(bottles_pluralized_for_next_number)
    'Take one down and pass it around, ' \
      "#{bottles_pluralized_for_next_number} of beer on the wall."
  end
end

# verse method
# given verse #
# generate

# "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
#       "Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n"
