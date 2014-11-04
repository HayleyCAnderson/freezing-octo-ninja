class HandChecker
  def check(hand)
    @hand = hand
    order_ranks
    gather_suits
    return compare
  end

  def compare
    if ranks_count == 4
      return "\nOne Pair\n\n"
    elsif unique_ranks? and same_suit?
      return "\nStraight Flush\n\n"
    elsif unique_ranks? and ranks_sequential?
      return "\nStraight\n\n"
    elsif same_suit?
      return "\nFlush\n\n"
    elsif multiple_multiples_of_ranks? and ranks_count == 3
      return "\nTwo Pair\n\n"
    elsif multiple_multiples_of_ranks? and ranks_count == 2
      return "\nFull House\n\n"
    elsif ranks_count == 3
      return "\nThree of a Kind\n\n"
    elsif ranks_count == 2
      return "\nFour of a Kind\n\n"
    else
      return "\nHigh Card\n\n"
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
      if rank == "J" then 11
      elsif rank == "Q" then 12
      elsif rank == "K" then 13
      elsif rank == "A" then 14
      else rank.to_i
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
