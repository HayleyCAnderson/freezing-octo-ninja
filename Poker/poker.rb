require "./deck.rb"
require "./player.rb"
require "./hand_checker.rb"

class Poker
  def initialize
    new_deck = Deck.new
    @deck = new_deck.deck
  end

  def play
    show_deck
    get_players
    deal
    show_hands
  end

  def show_deck
    @deck.each { |card| puts card.join }
    puts "#{ @deck.count } cards"
  end

  def get_players
    @players = []
    puts "How many players are there?"
    @players_count = gets.chomp
    @players_count = @players_count.to_i
    get_players_again until @players_count > 1 and @players_count < 10
  end

  def get_players_again
    puts "Please choose a number between 1 and 10."
    @players_count = gets.chomp
    @players_count = @players_count.to_i
  end

  def deal
    (1..@players_count).each do |player|
      new_player = Player.new(player)
      @players << new_player
      new_player.get_hand(@deck)
    end
  end

  def show_hands
    @players.each do |player|
      puts player.name
      puts "-" * player.name.length
      @hand = player.hand
      @hand.each { |card| puts card.join }
      check_hand
    end
  end

  def check_hand
    hand_checker = HandChecker.new
    puts hand_checker.check(@hand)
  end
end

game = Poker.new
game.play
