# straight = ranks sequential, @ranks.uniq.count = 5
# flush = all same suit, @suits.uniq.count = 1
# straight_flush = all same suit plus ranks sequential, @suits.uniq.count = 1

# three_of_a_kind = three of same rank, @ranks.uniq.count = 3
# four_of_a_kind = four of same rank, @ranks.uniq.count = 2

# one_pair = two of one rank, @ranks.uniq.count = 4
# two_pair = two of one rank plus two of another, @ranks.uniq.count = 3
# full_house = three of one rank plus two of another, @ranks.uniq.count = 2

# high_card = none of the above, highest rank, @ranks.uniq.count = 5

class HandChecker
  def initialize
  end

  def compare
    puts "Straight Flush" if unique_ranks? and same_suit?
    puts "Straight" if unique_ranks? not same_suit?
    puts "Flush" if same_suit not unique_ranks?
  end

  def get_orders
    @ranks = []
    order(@ranks, 0)
    @suits = []
    order(@suits, 1)
  end

  def order(card_aspect, placement)
    @hand.each do |card|
      card_aspect << card[placement]
    end
    card_aspect.sort!
  end

  def unique_ranks?
    @ranks.uniq.length == 5
  end

  def same_suit?
    @suits.uniq.length == 1
  end
end
