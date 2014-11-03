class Deck
  def initialize
    @deck = []
    make_deck
  end

  def make_deck
    get_suites
    get_number_cards
    get_royal_cards
  end

  def get_suites
    @suites = ["C", "D", "H", "S"]
  end

  def get_number_cards
    numbers = (2..10)
    add_suite(numbers)
  end

  def get_royal_cards
    royals = ["A", "J", "Q", "K"]
    add_suite(royals)
  end

  def add_suite(cards)
    cards.each do |card|
      @suites.each do |suite|
        @deck << card.to_s + suite.to_s
      end
    end
  end

  def show_deck
    puts @deck
    puts @deck.length
  end
end

deck = Deck.new
deck.show_deck