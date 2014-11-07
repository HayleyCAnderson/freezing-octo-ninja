require "./ai.rb"
require "./win_determiner.rb"

class Round
  def initialize(score_keeper)
    @score_keeper = score_keeper
  end

  def play(ai_type, user_move)
    @user_move = user_move
    call_ai(ai_type)
    winner
    show_score
  end

  def call_ai(ai_type)
    ai = Ai.new
    if ai_type == "cheater"
       @ai_move = ai.get_cheater_move(@user_move)
    elsif ai_type == "loser"
       @ai_move = ai.get_loser_move(@user_move)
    else
      @ai_move = ai.get_ai_move
    end
  end

  def winner
    win_determiner = WinDeterminer.new(@user_move, @ai_move)
    return win_determiner.find_winner
  end

  def show_score
    puts "AI's move: #{ @ai_move }"
    puts "* Winner: #{ winner } *"
    puts "You have won #{ @score_keeper.track(winner) }% of rounds."
  end
end
