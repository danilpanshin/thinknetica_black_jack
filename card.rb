class Card
  attr_reader :rang, :suit

  def initialize(rang, suit)
    @rang = rang
    @suit = suit
  end

  def score_ace
    score > 10 ? 1 : 11
  end

  def score
    rang.to_i.zero? ? 10 : rang.to_i
  end
end
