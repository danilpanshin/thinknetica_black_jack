class Dealer
  attr_accessor :cards

  def initialize
    @stack = 100
    @cards = []
  end

  def new_round
    @stack -= 10
  end

  def hand
  end
end
