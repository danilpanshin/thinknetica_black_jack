require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'deck'

class Main

  def game
    name
    start_game
    give_out_hands
    puts user_cards
    puts user_score
    bet
    user_move
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
    "Your cards: #{@user.cards}, dealer's cards: * *"
  end

   def user_score
    @user.score = 0
    @user.count_score
     "Your score: #{@user.score}"
  end

  def bet
    @user.bet
    @dealer.bet
  end

  def user_move
    case user_move_menu
    when 1
      dealer_move
    when 2
      user_take_card
      dealer_move
    when 3
      open_cards
    end
  end

  def user_move_menu
    puts "Choose action:"
    puts "miss - 1"
    puts "take card - 2"
    puts "open cards - 3"
    gets.chomp.to_i
  end

  def dealer_move
    @dealer.count_score
    if @dealer.score < 15
      @deck.give_out_card(@dealer)
      user_move
    else
      puts "Dealer missed move"
      user_move
    end
  end

  def user_take_card
    @deck.give_out_card(@user)
      puts user_cards
      puts user_score
  end

  def dealer_cards
    "Dealer's cards: #{@dealer.cards}"
  end

  def dealer_score
    @dealer_score = 0
    @dealer.count_score
    "Dealer's score: #{@dealer.score}"
  end

  def open_cards
    puts dealer_cards
    puts dealer_score
  end
end

game = Main.new
game.game
