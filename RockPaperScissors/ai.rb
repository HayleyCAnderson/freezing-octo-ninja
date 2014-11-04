class Ai
  def call
    get_ai_move
  end

  def get_ai_move
    answer_choices = ["r", "p", "s"]
    @ai_move = answer_choices.shuffle.last
  end
end