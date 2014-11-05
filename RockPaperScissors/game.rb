require "./round.rb"
require "./score_keeper.rb"

class Game
  def initialize
    @score_keeper = ScoreKeeper.new
  end

  def play
    welcome_user
    choose_ai
    begin
      play_rounds
    end until @round.quit?
  end

  def welcome_user
    puts "\nWelcome to Rock, Paper, Scissors vs. the AI"
    puts "Let's play!"
  end

  def choose_ai
    puts "\nWhich AI would you like to play against?"
    print "cheater, loser, or default? > "
    @ai_type = gets.chomp.downcase
    choose_again until valid_ai_choice?
  end

  def choose_again
    print "Please choose 'cheater', 'loser', or 'default' > "
    @ai_type = gets.chomp.downcase
  end

  def valid_ai_choice?
    @ai_type == "cheater" || @ai_type == "loser" || @ai_type == "default"
  end

  def play_rounds
    @round = Round.new(@score_keeper)
    @round.play_round(@ai_type)
  end
end

game = Game.new
game.play
