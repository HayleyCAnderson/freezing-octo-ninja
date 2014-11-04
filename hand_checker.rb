# three_of_a_kind = three of same rank, @ranks.uniq.count = 3
# four_of_a_kind = four of same rank, @ranks.uniq.count = 2

# one_pair = two of one rank, @ranks.uniq.count = 4
# two_pair = two of one rank plus two of another, @ranks.uniq.count = 3
# full_house = three of one rank plus two of another, @ranks.uniq.count = 2

class HandChecker
  def initialize
  end

  def check(hand)
    @hand = hand
    order_ranks
    gather_suits
    return compare
  end

  def compare
    return "Straight Flush" if unique_ranks? and same_suit?
    return "Straight" if unique_ranks? and sequential? unless same_suit?
    return "Flush" if same_suit? unless unique_ranks?
    return "High Card" if unique_ranks? unless sequential?
  end

  def order_ranks
    @ranks = []
    @hand.each { |card| @ranks << card[0] }
    replace
    @ranks.sort!
  end

  def gather_suits
    @suits = []
    @hand.each { |card| @suits << card[1] }
  end

  def replace
    @ranks.map! do |rank|
      if rank == "J"
        11
      elsif rank == "Q"
        12
      elsif rank == "K"
        13
      elsif rank == "A"
        14
      else
        rank.to_i
      end
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
      difference = @ranks[index + 1].to_i - rank.to_i
      total_differences += difference unless index == @ranks.length - 1
    end
    total_differences == 5
  end
end
