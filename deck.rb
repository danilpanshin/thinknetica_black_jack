class Deck
  attr_accessor :deck

  def initialize
    @deck = %w(
    2+ 2<3 2<> 2^
    3+ 3<3 3<> 3^
    4+ 4<3 4<> 4^
    5+ 5<3 5<> 5^
    6+ 6<3 6<> 6^
    7+ 7<3 7<> 7^
    8+ 8<3 8<> 8^
    9+ 9<3 9<> 9^
    10+ 10<3 10<> 10^
    J+ J<3 J<> J^
    Q+ Q<3 Q<> Q^
    K+ K<3 K<> K^
    A+ A<3 A<> A^
    )
  end

  def give_out_card(gamer)
    card = deck.delete(deck.sample)
    gamer.cards << card
  end
end

# p Deck.new.deck.last.to_i
