class Card
  attr_reader :rang, :suit

  def initialize(rang, suit)
    @rang = rang
    @suit = suit
  end

  def score
    score = 0
    score + if rang == 'A'
              if score > 10
                1
              else
                11
              end
            elsif rang.to_i.zero?
              10
            else
              rang.to_i
            end
  end
end
