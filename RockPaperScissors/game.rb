require "./ai.rb"
require "./score_determiner.rb"

class Game
  def initialize
  end

  def play
    welcome_user
    get_user_move
    call_ai
    determine_score
  end

  def welcome_user
    puts
    puts "Welcome to Rock, Paper, Scissors vs. the AI"
    puts "Let's play!"
  end

  def get_user_move
    print "Your move? (r/p/s, q to quit) > "
    @user_move = gets.chomp
    try_again_user until valid_user_move || @user_move == "q"
  end

  def call_ai
    ai = Ai.new
    @ai_move = ai.get_ai_move
  end

  def determine_score
    ScoreDeterminer.new(@user_move, @ai_move)
  end

  def valid_user_move
    @user_move == "r" || @user_move == "p" || @user_move == "s"
  end

  def try_again_user
    puts "You must put 'r' for rock, 'p' for paper, 's' for scissors, or 'q' to quit."
    print "Try again > "
    @user_move = gets.chomp
  end
end

new_game = Game.new
new_game.play
