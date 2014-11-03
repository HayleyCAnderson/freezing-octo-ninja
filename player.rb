class Player
  attr_reader :name
  attr_accessor :hand

  def initialize(number)
    @name = "Player " + number.to_s
  end

  def get_hand(deck)
    my_hand = Hand.new
    my_hand.get_cards(deck)
    @hand = my_hand.hand
  end
end
