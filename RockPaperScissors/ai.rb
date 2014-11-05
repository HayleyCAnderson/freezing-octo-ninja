class Ai
  def get_ai_move
    answer_choices = ["r", "p", "s"]
    return answer_choices.sample
  end

  def get_cheater_move(user_move)
    return "r" if user_move == "s"
    return "p" if user_move == "r"
    return "s" if user_move == "p"
  end

  def get_loser_move(user_move)
    return "p" if user_move == "s"
    return "s" if user_move == "r"
    return "r" if user_move == "p"
  end
end
