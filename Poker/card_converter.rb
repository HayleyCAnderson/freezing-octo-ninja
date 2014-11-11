class CardConverter
  CARD_NUMBERS = {
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14
  }

  def replace(ranks)
    ranks.map { |rank| CARD_NUMBERS[rank] || rank.to_i }
  end

  def return(ranks)
    ranks.map { |rank| CARD_NUMBERS.key(rank) || rank.to_s }
  end
end
