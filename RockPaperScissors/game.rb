require "./round.rb"
require "./score_keeper.rb"

class Game
  def initialize
    @score_keeper = ScoreKeeper.new
  end

  def play
    welcome_user
    choose_ai
    get_user_move
    until quit?
      play_round
      get_user_move
    end
  end

  def welcome_user
    puts "\nWelcome to Rock, Paper, Scissors vs. the AI"
    puts "Let's play!"
  end

  def choose_ai
    puts "\nWhich AI would you like to play against?"
    print "cheater, loser, or default? > "
    @ai_type = gets.chomp.downcase
    @ai_type = "default" unless special_ai?
  end

  def play_round
    @round = Round.new(@score_keeper)
    @round.play(@ai_type, @user_move)
  end

  def get_user_move
    print "Your move? (r/p/s, q to quit) > "
    @user_move = gets.chomp
    try_again until valid_user_move? or quit?
  end

  private

  def quit?
    @user_move == "q"
  end

  def special_ai?
    @ai_type == "cheater" || @ai_type == "loser"
  end

  def valid_user_move?
    @user_move == "r" || @user_move == "p" || @user_move == "s"
  end

  def try_again
    puts "You must put 'r' for rock, 'p' for paper, 's' for scissors, or 'q' to quit."
    print "Try again > "
    @user_move = gets.chomp
  end
end

game = Game.new
game.play
