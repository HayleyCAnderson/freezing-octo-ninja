class Player
  attr_reader :name
  attr_accessor :hand

  def initialize(number)
    @name = "Player " + number.to_s
    @hand = []
  end

  def get_hand(deck)
    5.times do
      @hand << deck.pop
    end
  end
end
