require_relative 'user'
require_relative 'dealer'
require_relative 'deck'

class Main

  def game
    name
    start_game
    give_out_hands
    user_cards

  end

  private

  def name
    print "Enter your name: "
    @name = gets.chomp
  end

  def start_game
    puts "Hi, #{@name}! Let's start a game!"
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def give_out_hands
    @deck.give_out_card(@dealer)
    @deck.give_out_card(@dealer)
    @deck.give_out_card(@user)
    @deck.give_out_card(@user)
  end

  def user_cards
    p @user.cards
    p @deck.deck.length
  end
end

game = Main.new
game.game
