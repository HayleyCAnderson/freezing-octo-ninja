require "./round.rb"
require "./score_keeper.rb"

class Game
  def initialize
    @score_keeper = ScoreKeeper.new
  end

  def play
    welcome_user
    begin
      play_rounds
    end until @round.quit?
  end

  def welcome_user
    puts
    puts "Welcome to Rock, Paper, Scissors vs. the AI"
    puts "Let's play!"
  end

  def play_rounds
    @round = Round.new(@score_keeper)
    @round.play_round
  end
end

game = Game.new
game.play
