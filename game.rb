require_relative 'player'
require_relative 'dealer'
require_relative 'hand'
require_relative 'deck'
require_relative 'card'

class Game
  attr_reader :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new(@deck)
    @dealer = Dealer.new(@deck)
  end

  def new_game
    clear_hands
    2.times { player.hand.add_card }
    2.times { dealer.hand.add_card }
    bet
  end

  def show_cards(player)
    player.hand.cards.each { |card| print "#{card.rang}#{card.suit}, " }
  end

  def show_score(player)
    player.hand.count_score
  end

  def player_take_card
    return true if player.hand.cards.size > 2
    player.hand.add_card
    false
  end

  def who_win
    dealer_score = dealer.hand.count_score
    player_score = player.hand.count_score
    if player_score > dealer_score
      if player_score < 22
        player
      else
        dealer
      end
    elsif player_score < dealer_score
      if dealer_score > 21
        player
      else
        dealer
      end
    end
    # elsif player_score > 21 && dealer_score > 21
    #   "draw."
    # elsif player_score == dealer_score
    #   "draw."
    # end
  end

  def stack
    if who_win == player
      player.win
    elsif who_win == dealer
      dealer.win
    else
      player.draw
      dealer.draw
    end
    player.stack
  end

  private

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
# g.show_cards(g.player)
# puts g.show_score(g.player)
# g.show_cards(g.dealer)
# p g.who_win
# g.hand(g.player)
# g.player.stack += 10
# p g.player.stack
# p g.instance_eval('@deck')
# p g.count_score(g.player)
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
