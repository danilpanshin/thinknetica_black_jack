require_relative 'deck'

class Hand
  attr_accessor :cards, :deck

  def initialize(deck)
    @cards = []
    @deck = deck
  end

  def add_card
    cards << deck.card
  end

  def count_score
    score = 0
    cards.each do |card|
      score += card.rang == 'A' ? card.score_ace : card.score
    end
    score
  end

  def muck
    cards.clear
  end
end
