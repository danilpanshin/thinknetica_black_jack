class Card
  attr_reader :rang, :suit

  def initialize(rang, suit)
    @rang = rang
    @suit = suit
  end

  def score
    score = 0
    if rang == 'A'
      if score > 10
        score += 1
      else
        score += 11
      end
    elsif rang.to_i.zero?
      score += 10
    else
      score += rang.to_i
    end
    score
  end
end
