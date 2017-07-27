'''
design decisions:
- how do we represent a poker hand?
  - 5 cards
  - suits
  - group cards by their ranks; groups should be sorted by number of cards they contain
  - straight
  - top card
  
- how do we determine which one of the 9 categories a poker hand falls into?
  - start from the highest-ranked category and go down the category list, stop when we find a match
    - straight flush: both a straight and a flush
      - compare hands: top card
    - four of a kind: two groups, one of them contains 4 cards
      - compare hands: the cards in first group
    - full house: two groups, one contains 3 cards, other contains 2
      - compare hands: the cards in first group
    - flush: all cards same suit
      - all the groups (sorted)
        - compare hands: first by the rank of its highest-ranking card, then by the rank of its second highest-ranking card, then by the rank of its third highest-ranking card, then by the rank of its fourth highest-ranking card, and finally by the rank of its lowest-ranking card.
    - straight:
      - sort the ranks
      - 5 rank groups, highest rank - lowest rank = 4; consider Ace low special case
      - enumerate all possible (13) straights:
        - [A, 2, 3, 4, 5]
        - [2, 3, 4, 5, 6]
        - [3, 4, 5, 6, 7]
        ...
        - compare cards: cards in the first group
    - three of a kind: 3 groups, one is of 3 cards
      - rank in first group
    - two pair: 3 groups, two of them have 2 cards
      - rank in first group
    - one pair: 4 groups, one of them has 2 cards (do we need to say # of groups like this?)
      - card in first group; then card in second group; then third group
    - high card
      - all the rest
      - rank in first group


- how do we compare two hands?
  - Hands in a higher-ranking category always rank higher than hands in a lower-ranking category. 
  - Hands in the same category are ranked relative to each other by comparing the ranks of their respective cards

rules we have to represent
- the categories and how they rank
'''

class Hand
  def suit
    
  end

  def groups
    [[3, 3, 3], [2, 2]]
  - group cards by their ranks; groups should be sorted by number of cards they contain
  - straight
  - top card
    
  end

  def straight
    #  5 rank groups, highest rank - lowest rank = 4; consider Ace low special case
  end

  def top_card
    # groups[0] - value
  end
end

class HandRules
  {
    straight_flush: 9,
    flush: 7,
    ...
  }


  def self.classify(hand)
    if hand.straight_flush?
      StraightFlush.new(...)
    elsif hand.flush?
      Flush.new(...)
  end

  def self.higher(hand1, hand2)
    
  end
end
  
class StraightFlush
  def value
    9
  end

  def compare_with_another(straight_flush)
    ...
  end
end

class Flush
  def value
    7
  end
end
