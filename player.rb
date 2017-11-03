require_relative 'hand'

class Player
  attr_accessor :stack
  attr_reader :hand

  def initialize
    @stack = 100
    @hand = Hand.new
  end

  def bet
    @stack -= 10
  end



  # def take_card(deck)
  #   hand.add_card(deck)
  # end
end

# pl =  Player.new
# pl.hand
# p pl.hand.show_hand
# 2.times {pl.take_card()}
