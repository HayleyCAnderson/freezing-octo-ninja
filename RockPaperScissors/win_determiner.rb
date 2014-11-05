class WinDeterminer
  def initialize(user_move, ai_move)
    @moves = { user: user_move, ai: ai_move }
  end

  def find_winner
    if rock_wins?
      return @moves.key("r")
    elsif paper_wins?
      return @moves.key("p")
    elsif scissors_wins?
      return @moves.key("s")
    else
      return "tie"
    end
  end

  def rock_wins?
    @moves.has_value?("r") and @moves.has_value?("s")
  end

  def paper_wins?
    @moves.has_value?("p") and @moves.has_value?("r")
  end

  def scissors_wins?
    @moves.has_value?("s") and @moves.has_value?("p")
  end
end
