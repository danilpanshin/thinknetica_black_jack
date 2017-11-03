require_relative 'player'
require_relative 'dealer'
require_relative 'hand'
require_relative 'deck'

class Game
  attr_reader :player, :dealer

  def initialize
   @player = Player.new
   @dealer = Dealer.new
  end

  def new_game
    clear_hands
    2.times { player.hand.add_card }
    2.times { dealer.hand.add_card }
    bet
  end

  def player_take_card
    return true if player.hand.cards.size > 2
    player.hand.add_card
    false
  end

  def winner
    dealer_score = dealer.hand.count_score
    player_score = player.hand.count_score
    if player_score > dealer_score
      if player_score < 22
        "You win!"
      else
        "You loose."
      end
    elsif player_score < dealer_score
      if dealer_score > 21
        "You win!"
      else
        "You loose."
      end
    elsif player_score > 21 && dealer_score > 21
      "draw."
    elsif player_score == dealer_score
      "draw."
    end
  end

  def bank
    if winner == "You win!"
      player.stack += 20
    elsif winner == "You loose."
      dealer.stack += 20
    else
      player.stack += 10
      dealer.stack += 10
    end
    "Your stack = #{player.stack}"
  end

  private
  # надо ли здесь скрывыть методы, если к классу не будет прямого доступа?

  # def first_hand
  #   2.times { player.hand.add_card }
  #   2.times { dealer.hand.add_card }
  # end

  def bet
    player.bet
    dealer.bet
  end

  def clear_hands
    player.hand.muck
    dealer.hand.muck
  end
end

# g = Game.new
# g.new_game
# p g.player.stack
# g.player.stack += 10
# p g.player.stack
# p g.show_hand(g.player)
# p g.show_hand(g.dealer)
# p g.show_score(g.player)
# p g.show_score(g.dealer)
# p g.winner
# p g.bank
# g.bet
# p g.player.stack
# p g.dealer.stack
# g.muck_cards

# p g.show_hand(g.player)
# p g.show_hand(g.dealer)
# p g.deck
