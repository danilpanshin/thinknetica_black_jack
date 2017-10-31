require_relative 'deck'

class User
  attr_accessor :cards

  def initialize
    @stack = 100
    @cards = []
  end

  def new_round
    @stack -= 10
  end

  # def receive_hand
  #   receive_card
  #   receive_card
  # end

  # def receive_card(deck)

  # end
end

# u = User.new
# d = Deck.new
# d.give_out_card(u)
# d.give_out_card(u)
# p u.cards
# p d.deck.size

