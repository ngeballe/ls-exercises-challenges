# card
class Card
  VALUES = { 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }.freeze

  include Comparable

  attr_reader :rank, :suit

  def initialize(card)
    @rank = card[0]
    @suit = card[1]
  end

  def to_s
    "#{rank}#{suit}"
  end

  def value
    return rank.to_i if rank =~ /\d/
    VALUES[rank]
  end

  def <=>(other)
    value <=> other.value
  end
end

# player's hand
class Hand
  include Comparable

  CATEGORY_METHODS = %i[straight_flush? square? full? flush?
                        regular_straight? ace_low_straight? three?
                        two_pair? pair?].freeze
  CATEGORY_VALUES = {
    high_card: 0,
    pair?: 1,
    two_pair?: 2,
    three?: 3,
    ace_low_straight?: 4,
    regular_straight?: 5,
    flush?: 6,
    full?: 7,
    square?: 8,
    straight_flush?: 9
  }.freeze

  attr_reader :cards

  def initialize(cards)
    @cards = cards.map { |card| Card.new(card) }
  end

  def to_a
    cards.map(&:to_s)
  end

  def highest_card
    @cards.max
  end

  def <=>(other)
    if category_value == other.category_value
      value_of_first_card_group <=> other.value_of_first_card_group
    else
      category_value <=> other.category_value
    end
  end

  def category_value
    CATEGORY_VALUES[category]
  end

  def category
    CATEGORY_METHODS.detect { |method| send(method) } || :high_card
  end

  def straight_flush?
    straight? && flush?
  end

  def square?
    card_groups.first.size == 4
  end

  def full?
    card_groups.map(&:size).sort == [2, 3]
  end

  def flush?
    cards.map(&:suit).uniq.size == 1
  end

  def straight?
    ace_low_straight? || regular_straight?
  end

  def ace_low_straight?
    cards.sort.map(&:rank) == %w[2 3 4 5 A]
  end

  def regular_straight?
    cards.max.value == cards.min.value + 4 &&
      card_groups.size == 5
  end

  def three?
    card_groups.first.size == 3
  end

  def two_pair?
    card_groups.map(&:size).count(2) == 2
  end

  def pair?
    card_groups.map(&:size).count(2) == 1
  end

  def cards_grouped_by_value
    cards.group_by(&:value).values
  end

  def card_groups
    cards_grouped_by_value.sort do |group1, group2|
      if group1.size == group2.size
        group2.first.value <=> group1.first.value
      else
        group2.size <=> group1.size
      end
    end
  end

  def values
    cards.map(&:value)
  end

  def value_of_first_card_group
    card_groups.first.first.value
  end
end

# comapre poker hands
class Poker
  attr_reader :hands

  def initialize(hands)
    @hands = hands.map { |hand| Hand.new(hand) }
  end

  def best_hand
    hands.select { |hand| hand == hands.max }
         .map(&:to_a)
  end
end
