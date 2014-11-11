class ScoreKeeper
  def initialize
    @user_wins = 0
    @ai_wins = 0
    @ties = 0
  end

  def track(winner)
    count(winner)
    return score
  end

  def count(winner)
    if winner == :user
      @user_wins += 1
    elsif winner == :ai
      @ai_wins += 1
    else
      @ties += 1
    end
  end

  def score
    ( @user_wins.to_f / total ) * 100
  end

  private

  def total
    @user_wins + @ai_wins + @ties
  end
end
