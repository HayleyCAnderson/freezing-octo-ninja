# three_of_a_kind = three of same rank, @ranks.uniq.count = 3
# four_of_a_kind = four of same rank, @ranks.uniq.count = 2

# one_pair = two of one rank, @ranks.uniq.count = 4
# two_pair = two of one rank plus two of another, @ranks.uniq.count = 3
# full_house = three of one rank plus two of another, @ranks.uniq.count = 2

class HandChecker
  def initialize
  end

  def check
    get_orders
    compare
  end

  def compare
    puts "Straight Flush" if unique_ranks? and same_suit?
    puts "Straight" if unique_ranks? and sequential? not same_suit?
    puts "Flush" if same_suit not unique_ranks?
    puts "High Card" if unique_ranks? not sequential?
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
    replace
    card_aspect.sort!
  end

  def replace
    @ranks.map! do |rank|
      rank = 11 if rank == "J"
      rank = 12 if rank == "Q"
      rank = 13 if rank == "K"
      rank = 14 if rank == "A"
    end
  end

  def unique_ranks?
    @ranks.uniq.length == 5
  end

  def same_suit?
    @suits.uniq.length == 1
  end

  def sequential?
    total_differences = 0
    @ranks.each do |rank|
      index = @ranks.index(rank)
      total_differences + @ranks[index + 1] - rank
    end
    total_differences == 5
  end
end
