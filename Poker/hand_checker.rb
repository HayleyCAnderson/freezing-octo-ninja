class HandChecker
  def initialize
    @ranks = []
    @suits = []
  end

  def check(hand)
    @hand = hand
    order_ranks
    gather_suits
    return "\n#{ highest_hand }\n\n"
  end

  def highest_hand
    if unique_ranks? and ranks_sequential? and same_suit?
      return "Straight Flush"
    elsif unique_ranks? and ranks_sequential?
      return "Straight"
    elsif same_suit?
      return "Flush"
    elsif ranks_count == 4
      return "One Pair"
    elsif multiple_multiples_of_ranks? and ranks_count == 3
      return "Two Pair"
    elsif multiple_multiples_of_ranks? and ranks_count == 2
      return "Full House"
    elsif ranks_count == 3
      return "Three of a Kind"
    elsif ranks_count == 2
      return "Four of a Kind"
    else
      return "High Card: #{ highest_card.join }"
    end
  end

  def order_ranks
    @hand.each { |card| @ranks << card[0] }
    replace_royals
    @ranks.sort!
  end

  def gather_suits
    @hand.each { |card| @suits << card[1] }
  end

  def replace_royals
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
      current_index = @ranks.index(rank)
      difference = @ranks[current_index + 1] - rank
      total_differences += difference unless ( current_index == @ranks.length - 1 )
    end
    total_differences == 5
  end

  def multiple_multiples_of_ranks?
    sets_of_multiples = @ranks.select { |rank| @ranks.count(rank) > 1 }
    sets_of_multiples.uniq.length > 1
  end

  def ranks_count
    return @ranks.uniq.length
  end

  def highest_card
    @highest_rank = @ranks.last
    return_to_royals
    high_card_index = @hand.index { |card| card[0] == @highest_rank }
    return @hand[high_card_index]
  end

  def return_to_royals
    if @highest_rank == 11 then @highest_rank = "J"
    elsif @highest_rank == 12 then @highest_rank = "Q"
    elsif @highest_rank == 13 then @highest_rank = "K"
    elsif @highest_rank == 14 then @highest_rank = "A"
    else @highest_rank = @highest_rank.to_s
    end
  end
end
