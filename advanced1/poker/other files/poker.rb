require 'pry'

# individual card
class Card
  include Comparable

  attr_reader :value, :suit

  def initialize(string)
    @value, @suit = string.split('')
  end

  def <=>(other)
    rank <=> other.rank
  end

  def rank
    case value
    when 'T' then 10
    when 'J' then 11
    when 'Q' then 12
    when 'K' then 13
    when 'A' then 14
    else          value.to_i
    end
  end

  def to_s
    "#{@value}#{@suit}"
  end
end

# Five cards
class Hand
  include Comparable

  attr_reader :cards

  def initialize(cards)
    @cards = cards.map do |card_string|
      Card.new(card_string)
    end
  end

  def <=>(other)
    # straight_flush_comparison(other) ||
    #   square_comparison(other) ||
    #   full_comparison(other) ||
    #   flush_comparison(other) ||
    #   straight_comparison(other) ||
    #   threes_comparison(other) ||
    #   pairs_comparison(other) ||
    #   highest_card_comparison(other)

    comparisons = [:straight_flush_comparison, :square_comparison,
                   :full_comparison, :flush_comparison,
                   :straight_comparison, :threes_comparison,
                   :two_pair_comparison, :one_pair_comparison,
                   :highest_card_comparison]
    comparisons.each do |comparison_method|
      result = send(comparison_method, other)
      return result if result
    end
  end

  # def compare_results(other, &methods)
  # def compare_results(other, *methods)
  #   binding.pry
  #   # yield(self) <=> yield(other)
  # end

  def compare_on_methods(other, method, &tiebreaker_if_both_true)
    case [self, other].select(&method)
    when [self] then 1
    when [other] then -1
    when [self, other] then yield(tiebreaker_if_both_true)
    end
  end

  def straight_flush_comparison(other)
    compare_on_methods(other, :straight_flush?) do
      cards.max <=> other.cards.max
    end
  end

  # def square_comparison(other)
  #   if square? && other.square?
  #     cards_in_squares.first.rank <=> other.cards_in_squares.first.rank
  #   elsif square? && !other.square?
  #     1
  #   elsif !square? && other.square?
  #     -1
  #   else
  #     0
  #   end
  # end

  # def square_comparison(other)
  #   case [self, other].select(&:square?)
  #   when [self] then 1
  #   when [other] then -1
  #   when [self, other]
  #     cards_in_squares.first.rank <=> other.cards_in_squares.first.rank
  #   end
  # end

  def square_comparison(other)
    compare_on_methods(other, :square?) do
      cards_in_squares.first.rank <=> other.cards_in_squares.first.rank
    end
  end

  def full_comparison(other)
    compare_on_methods(other, :full?) do
      cards_in_threes.first.rank <=> other.cards_in_threes.first.rank
    end
  end

  def flush_comparison(other)
    compare_on_methods(other, :flush?) { highest_card_comparison(other) }
  end

  def straight_comparison(other)
    compare_on_methods(other, :straight?) { highest_card_comparison(other) }
  end

  def threes_comparison(other)
    compare_on_methods(other, :three_of_a_kind?) do
      cards_in_threes.max <=> other.cards_in_threes.max
    end
  end

  def two_pair_comparison(other)
    compare_on_methods(other, :two_pair?) do
      cards_in_pairs.max <=> other.cards_in_pairs.max
    end
  end

  def one_pair_comparison(other)
    compare_on_methods(other, :one_pair?) do
      cards_in_pairs.max <=> other.cards_in_pairs.max
    end
  end

  def two_pair?
    cards_in_pairs.size == 4
  end

  def one_pair?
    cards_in_pairs.size == 2
  end

  def three_of_a_kind?
    cards_in_threes.any?
  end

  def square?
    cards_in_squares.any?
  end

  def cards_in_pairs
    multiple_of_same_value(2)
  end

  def cards_in_threes
    multiple_of_same_value(3)
  end

  def cards_in_squares
    multiple_of_same_value(4)
  end

  def straight_flush?
    straight? && flush?
  end

  protected

  def highest_card_comparison(other)
    cards.max <=> other.cards.max
  end

  def straight?
    return true if cards.sort.map(&:rank) == [2, 3, 4, 5, 14] # ace low straight
    cards.sort.map(&:rank) == card_ranks_sorted
  end

  def flush?
    cards.map(&:suit).uniq.size == 1
  end

  def full?
    one_pair? && three_of_a_kind?
  end

  private

  def card_ranks_sorted
    cards.min.rank.step(cards.max.rank, 1).to_a
  end

  def multiple_of_same_value(number_of_same)
    cards.select do |card|
      cards.map(&:value).count(card.value) == number_of_same
    end
  end
end

# whole game
class Poker
  attr_reader :hands

  def initialize(hands)
    @hands = hands.map do |hand|
      Hand.new(hand)
    end
  end

  def best_hand
    best_hands = hands.select do |hand|
      hand == hands.max
    end

    best_hands.map { |hand| hand.cards.map(&:to_s) }
  end
end

# figure out each card's rank
# figure out highest card in hand
# count pairs in hand
# hand with higher highest card wins

# higher high card beats lower high card
# one pair beats high card
# higher pair beats lower pair
# double pair beats one pair
# double pair w/ higher high card beats double w/ lower high card (I think)
# 3 of a kind beats double pair
# 3 of higher beats 3 of lower
# straight beats 3 of 4
