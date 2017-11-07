require_relative 'card'

class Deck

  RANGS = %w(2 3 4 5 6 7 8 9 10 J Q K A).product(%w(+ <3 <> ^))

  def initialize
    @cards = []
    add_cards
    @cards.shuffle!
  end

  def card
    @cards.pop
  end

  # def shuffle
  #   @cards.shuffle
  # end

  private

  def add_cards
    52.times do
      i = RANGS.pop
      card = Card.new(i.first, i.last)
      @cards << card
    end
  end
end

# d = Deck.new

# p (d.instance_eval("@cards")).first

# p d.deck.size


