require_relative 'hand'

class Player
  attr_reader  :hand, :stack

  def initialize
    @stack = 100
    @hand = Hand.new
  end

  # def take_card(deck)
  #   hand.add_card(deck)
  # end

  def bet
    @stack -= 10
  end

  # def cards
  #   hand.cards
  # end
end

# pl =  Player.new
# pl.hand
# p pl.hand.show_hand
# 2.times {pl.take_card()}
