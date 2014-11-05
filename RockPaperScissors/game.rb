require "./round.rb"

class Game
  def initialize
  end

  def play
    welcome_user
    start_rounds
  end

  def welcome_user
    puts
    puts "Welcome to Rock, Paper, Scissors vs. the AI"
    puts "Let's play!"
  end

  def start_rounds
    round = Round.new
    round.play_round
    start_rounds until round.quit?
  end
end

new_game = Game.new
new_game.play
