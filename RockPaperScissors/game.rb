require "./round.rb"
require "./score_keeper.rb"

class Game
  def initialize
    @score_keeper = ScoreKeeper.new
  end

  def play
    welcome_user
    choose_ai
    play_rounds until quit?
  end

  def welcome_user
    puts "\nWelcome to Rock, Paper, Scissors vs. the AI"
    puts "Let's play!"
  end

  def choose_ai
    puts "\nWhich AI would you like to play against?"
    print "cheater, loser, or default? (q to quit)> "
    @ai_type = gets.chomp.downcase
    choose_again until valid_ai_choice? || quit?
    exit if quit?
  end

  def play_rounds
    @round = Round.new(@score_keeper)
    @round.play_round(@ai_type)
  end

  def quit?
    @ai_type == "q"
  end

  private

  def valid_ai_choice?
    @ai_type == "cheater" || @ai_type == "loser" || @ai_type == "default"
  end

  def choose_again
    print "Please choose 'cheater', 'loser', or 'default' (or 'q' to quit)> "
    @ai_type = gets.chomp.downcase
  end
end

game = Game.new
game.play
