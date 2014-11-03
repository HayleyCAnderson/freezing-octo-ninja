class Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def get_cards(deck)
    5.times do
      @hand << deck.pop
    end
  end
end
