class Player
  attr_accessor :cards, :score, :stack

  def initialize
    @stack = 100
    @cards = []
    @score = 0
  end

  def count_score
    self.score = 0

    cards.each do |card|
      if card.include? 'A'
        if score > 10
          self.score += 1
        else
          self.score += 11
        end
      elsif card.to_i.zero?
        self.score += 10
      else
        self.score += card.to_i
      end
    end
  end

  def bet
    self.stack -= 10
  end
end
