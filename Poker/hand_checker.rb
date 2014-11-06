require "./card_converter.rb"

class HandChecker
  def initialize
    @card_converter = CardConverter.new
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
    @ranks = @card_converter.replace(@ranks)
    @ranks.sort!
  end

  def gather_suits
    @hand.each { |card| @suits << card[1] }
  end

  private

  def same_suit?
    @suits.uniq.length == 1
  end

  def unique_ranks?
    @ranks.uniq.length == 5
  end

  def ranks_sequential?
    (@ranks.first..@ranks.last) == @ranks
  end

  def multiple_multiples_of_ranks?
    sets_of_multiples = @ranks.select { |rank| @ranks.count(rank) > 1 }
    sets_of_multiples.uniq.length > 1
  end

  def ranks_count
    @ranks.uniq.length
  end

  def highest_card
    @ranks = @card_converter.return(@ranks)
    highest_card_placement = @hand.index { |card| card[0] == @ranks.last }
    @hand[highest_card_placement]
  end
end
