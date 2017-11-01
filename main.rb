require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'deck'

class Main
  def game
    name
    start_game
    loop do
      give_out_hands
      puts user_cards
      puts user_score
      bet
      user_move
      puts winner
      bank
      cards_to_trash
      puts "continue game: y/n?"
      action = gets.chomp
      break if action == 'n'
    end
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
    @deck.shuffle
    @deck.give_out_card(@dealer)
    @deck.give_out_card(@dealer)
    @deck.give_out_card(@user)
    @deck.give_out_card(@user)
  end

  def cards_to_trash
    @user.cards = []
    @dealer.cards = []
  end

  def user_cards
    "Your cards: #{@user.cards}, dealer's cards: * *"
  end

  def user_score
    @user.count_score
   "Your score: #{@user.score}"
  end

  def dealer_cards
    "Dealer's cards: #{@dealer.cards}"
  end

  def dealer_score
    @dealer.count_score
    "Dealer's score: #{@dealer.score}"
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
      raise if @user.cards.size > 2
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
      puts "Dealer took card"
      @deck.give_out_card(@dealer)
      if @user.cards.size > 2
        open_cards
      else
        user_move
      end
    else
      puts "Dealer missed move, your move"
      user_move
    end
  end

  def user_take_card
    @deck.give_out_card(@user)
    puts user_cards
    puts user_score
  end

  def open_cards
    puts dealer_cards
    puts dealer_score
    puts user_score
  end

  def winner
    if @user.score > @dealer.score && @user.score < 22
      "You win!"
    elsif @user.score < @dealer.score && @dealer.score > 21
      "You win!"
    elsif @user.score > @dealer.score && @user.score > 21
      "You loose."
    elsif @user.score < @dealer.score && @dealer.score < 22
      "You loose."
    elsif @user.score > 21 && @dealer.score > 21
      "draw!"
    else
      "draw!"
    end
  end

  def bank
    if winner == "You win!"
      @user.stack += 20
    elsif winner == "You loose."
      @dealer.stack += 20
    else
      @user.stack += 10
      @dealer.stack += 10
    end
    puts "Your stack = #{@user.stack}"
  end
end

game = Main.new
game.game
