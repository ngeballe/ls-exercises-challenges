require 'pry'

# individual card--has a value and a suit
class Card
  attr_reader :value, :suit

  def initialize(string)
    @value, @suit = string.split('')
  end

  def rank
    case value
    when 'A' then 14
    when 'K' then 13
    when 'Q' then 12
    when 'J' then 11
    when 'T' then 10
    else          value.to_i
    end
  end

  def to_s
    "#{value}#{suit}"
  end
end

# 5 cards
class Hand
  STRAIGHT_VALUES = [%w(2 3 4 5 A), %w(2 3 4 5 6), %w(3 4 5 6 7),
                     %w(4 5 6 7 8), %w(5 6 7 8 9), %w(6 7 8 9 T),
                     %w(7 8 9 T J), %w(8 9 T J Q), %w(9 T J Q K),
                     %w(T J Q K A)].freeze
  CATEGORY_METHODS = [:straight_flush, :square, :full, :flush,
                      :straight, :three, :two_pair, :one_pair].freeze

  include Comparable

  attr_reader :cards

  def initialize(cards)
    @cards = cards.map { |card| Card.new(card) }
  end

  def groups
    groups_preliminary_hash.flat_map do |_, groups|
      high_to_low = groups.sort_by { |grp| grp[0].rank }.reverse

      if card_values_sorted == %w(2 3 4 5 A)
        high_to_low.rotate
      else
        high_to_low
      end
    end
  end

  def groups_preliminary_hash
    cards.group_by(&:rank)
         .values
         .group_by(&:size)
         .sort
         .reverse
         .to_h
  end

  def group_ranks
    groups.map { |grp| grp[0].rank }
  end

  def category
    result = CATEGORY_METHODS.detect do |category_method|
      send(category_method)
    end
    result ||= :high_card
    result
  end

  def category_rank
    category_index = CATEGORY_METHODS.index(category)
    if category_index.nil?
      0 # high card
    else
      8 - category_index
    end
  end

  def <=>(other)
    if category == other.category
      group_ranks <=> other.group_ranks
    else
      category_rank <=> other.category_rank
    end
  end

  def straight_flush
    straight && flush
  end

  def square
    groups[0].size == 4
  end

  def full
    groups[0].size == 3 && groups[1].size == 2
  end

  def flush
    cards.map(&:suit).uniq.size == 1
  end

  def straight
    STRAIGHT_VALUES.include?(card_values_sorted)
  end

  def card_values_sorted
    cards.sort_by(&:value).map(&:value)
  end

  def max_value_of_straight
    if card_values_sorted.last == 'A'
      card_values_sorted[-2]
    else
      card_values_sorted.last
    end
  end

  def three
    groups.first.size == 3
  end

  def two_pair
    groups.first.size == 2 && groups[1].size == 2
  end

  def one_pair
    groups.first.size == 2
  end

  def to_string_array
    cards.map(&:to_s)
  end
end

# hand evaluator
class Poker
  attr_reader :hands

  def initialize(hands)
    @hands = hands.map { |cards| Hand.new(cards) }
  end

  def best_hand
    best = hands.select do |hand|
      hand == hands.max
    end
    best.map(&:to_string_array)
  end
end
