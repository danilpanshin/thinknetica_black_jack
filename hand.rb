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
    cards.each { |card| score += card.score }
    score
  end

  def muck
    cards.clear
  end
end

# d = Deck.new
# h = Hand.new
# 2.times { h.add_card(d) }
# p h.show_hand
# p h.count_score
