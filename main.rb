require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'deck'

class Main

  def game
    name
    start_game
    give_out_hands
    p user_cards
    p user_score
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
    @user.cards
  end

   def user_score
     @user.score
  end
end

game = Main.new
game.game
