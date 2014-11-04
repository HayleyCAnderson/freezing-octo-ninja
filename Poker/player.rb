class Player
  attr_reader :name
  attr_accessor :hand

  CARDS_PER_HAND = 5

  def initialize(number)
    @name = "Player " + number.to_s
    @hand = []
  end

  def get_hand(deck)
    CARDS_PER_HAND.times do
      @hand << deck.pop
    end
  end
end
