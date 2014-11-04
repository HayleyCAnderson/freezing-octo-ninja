require "./ai.rb"
require "./score_determiner.rb"

class Game
  def initialize
    new_ai = Ai.new
  end

  def play
    welcome_user
    ask_for_move
  end

  def welcome_user
    puts
    puts "Welcome to Rock, Paper, Scissors vs. the AI"
    puts "Let's play!"
  end

  def ask_for_move
    print "Your move? (R/P/S, q to quit) > "
    @user_move = gets.chomp
  end
end

new_game = Game.new
new_game.play