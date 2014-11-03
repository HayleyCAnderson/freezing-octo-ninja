require "./deck.rb"
require "./player.rb"
require "./hand.rb"

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
    puts @deck
    puts "#{ @deck.count } cards"
  end

  def get_players
    @players = []
    puts "How many players are there?"
    @players_num = gets.chomp
    @players_count = @players_num.to_i
    get_players_again until @players_count > 1 and @players_count < 10
  end

  def get_players_again
    puts "Please choose a number between 1 and 10."
    @players_num = gets.chomp
    @players_count = @players_num.to_i
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
      puts player.hand
    end
  end
end

game = Poker.new
game.play
