class Deck
  attr_accessor :deck

  def initialize
    @deck = []
    make_deck
    @deck.shuffle!
  end

  def make_deck
    get_suits
    get_number_cards
    get_royal_cards
  end

  def get_suits
    @suits = ["C", "D", "H", "S"]
  end

  def get_number_cards
    numbers = (2..10)
    add_suit(numbers)
  end

  def get_royal_cards
    royals = ["J", "Q", "K", "A"]
    add_suit(royals)
  end

  def add_suit(cards)
    cards.each do |card|
      @suits.each do |suit|
        @deck << [card.to_s, suit]
      end
    end
  end
end
