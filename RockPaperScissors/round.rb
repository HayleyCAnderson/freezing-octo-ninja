require "./ai.rb"
require "./score_determiner.rb"

class Round
  def initialize
  end

  def play_round
    get_user_move
    call_ai
    winner
    show_score
  end

  def get_user_move
    print "Your move? (r/p/s, q to quit) > "
    @user_move = gets.chomp
    try_again_user until valid_user_move? || quit?
    exit if quit?
  end

  def quit?
    @user_move == "q"
  end

  def call_ai
    ai = Ai.new
    @ai_move = ai.get_ai_move
  end

  def winner
    score_determiner = ScoreDeterminer.new(@user_move, @ai_move)
    return score_determiner.find_winner
  end

  def show_score
    puts "AI's move: #{ @ai_move }"
    puts "* Winner: #{ winner } *"
  end

  def valid_user_move?
    @user_move == "r" || @user_move == "p" || @user_move == "s"
  end

  def try_again_user
    puts "You must put 'r' for rock, 'p' for paper, 's' for scissors, or 'q' to quit."
    print "Try again > "
    @user_move = gets.chomp
  end
end
