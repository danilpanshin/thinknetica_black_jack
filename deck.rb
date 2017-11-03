class Deck
  def initialize
    @deck = %w(2 3 4 5 6 7 8 9 10 J Q K A).product(%w(+ <3 <> ^))
    @deck.shuffle!
  end

  def card
    @deck.pop.join
  end
end
