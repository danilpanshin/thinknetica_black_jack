# require_relative 'deck'

class Player
  attr_accessor :cards, :score

  def initialize
    @stack = 100
    @cards = []
    @score = 0
  end

  def score
    @score = 0
  end

  def new_round
    @stack -= 10
  end
end
