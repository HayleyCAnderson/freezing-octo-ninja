class Ai
  def get_ai_move
    answer_choices = ["r", "p", "s"]
    return answer_choices.shuffle.last
  end
end
