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
    if ranks_count == 4
      return "One Pair"
    elsif unique_ranks? and same_suit?
      return "Straight Flush"
    elsif unique_ranks? and ranks_sequential?
      return "Straight"
    elsif same_suit?
      return "Flush"
    elsif multiple_multiples_of_ranks? and ranks_count == 3
      return "Two Pair"
    elsif multiple_multiples_of_ranks? and ranks_count == 2
      return "Full House"
    elsif ranks_count == 3
      return "Three of a Kind"
    elsif ranks_count == 2
      return "Four of a Kind"
    else
      return "High Card"
    end
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

  def same_suit?
    @suits.uniq.length == 1
  end

  def unique_ranks?
    @ranks.uniq == nil
  end

  def ranks_sequential?
    total_differences = 0
    @ranks.each do |rank|
      index = @ranks.index(rank)
      difference = @ranks[index + 1].to_i - rank.to_i
      total_differences += difference unless index == @ranks.length - 1
    end
    total_differences == 5
  end

  def ranks_count
    return @ranks.uniq.length
  end

  def multiple_multiples_of_ranks?
    multiples = @ranks.select { |rank| @ranks.count(rank) > 1 }
    if multiples.uniq.length > 1
      return true
    else
      return false
    end
  end
end
