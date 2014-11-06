class HandChecker
  CARD_NUMBERS = {
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14
  }
  def initialize
    @ranks = []
    @suits = []
  end

  def check(hand)
    @hand = hand
    order_ranks
    gather_suits
    "\n#{ highest_hand }\n\n"
  end

  def highest_hand
    if unique_ranks? and ranks_sequential? and same_suit?
      "Straight Flush"
    elsif unique_ranks? and ranks_sequential?
      "Straight"
    elsif same_suit?
      "Flush"
    elsif ranks_count == 4
      "One Pair"
    elsif multiple_multiples_of_ranks? and ranks_count == 3
      "Two Pair"
    elsif multiple_multiples_of_ranks? and ranks_count == 2
      "Full House"
    elsif ranks_count == 3
      "Three of a Kind"
    elsif ranks_count == 2
      "Four of a Kind"
    else
      "High Card: #{ highest_card.join }"
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
    @ranks = @ranks.map { |rank| CARD_NUMBERS[rank] || rank.to_i }
  end

  def same_suit?
    @suits.uniq.length == 1
  end

  def unique_ranks?
    @ranks.uniq.length == 5
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
    @ranks.uniq.length
  end

  def highest_card
    return_to_royals
    highest_rank = @ranks.last
    high_card_index = @hand.index { |card| card[0] == highest_rank }
    @hand[high_card_index]
  end

  def return_to_royals
    @ranks = @ranks.map { |rank| CARD_NUMBERS.key(rank) || rank.to_s }
  end
end
