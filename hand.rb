require_relative 'deck'

class Hand
  attr_accessor :cards, :deck

  def initialize
    @cards = []
    @deck = Deck.new
  end

  def add_card
    cards << deck.card
  end

  def count_score
    score = 0
    cards.each do |card|
      if card.include? 'A'
        if score > 10
          score += 1
        else
          score += 11
        end
      elsif card.to_i.zero?
        score += 10
      else
        score += card.to_i
      end
    end
    score
  end

  def muck
    self.cards.clear
  end
end

# d = Deck.new
# h = Hand.new
# 2.times { h.add_card(d) }
# p h.show_hand
# p h.count_score
