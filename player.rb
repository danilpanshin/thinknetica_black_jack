require_relative 'hand'
require_relative 'deck'

class Player
  attr_accessor :stack
  attr_reader :hand

  def initialize(deck)
    @stack = 100
    @hand = Hand.new(deck)
  end

  def bet
    self.stack -= 10
  end

  def win
    self.stack += 20
  end

  def draw
    self.stack += 10
  end
end
