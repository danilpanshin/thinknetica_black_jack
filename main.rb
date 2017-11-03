require_relative 'game'

class Main
  attr_reader :game

  def initialize
    # name
    @game = Game.new
  end

  def interface
    loop do
      game.new_game
      puts show_player_hand
      puts show_player_score
      player_move
      puts game.winner
      puts game.bank
      break if new_game_or_exit?
    end
  end

  def name
    print "Enter your name: "
    name = gets.chomp.capitalize
    "Hello, #{name}!"
  end

  def show_player_hand
    "Your hand: #{game.player.hand.cards}, dealer's hand: * *"
  end

  def show_player_score
   "Your score: #{game.player.hand.count_score}"
  end

  def show_dealer_hand
    "Dealer's hand: #{game.dealer.hand.cards}"
  end

  def show_dealer_score
    "Dealer's score: #{game.dealer.hand.count_score}"
  end

  def player_move
    loop do
      case user_move_menu
      when 1
        puts dealer_move_result
      when 2
        if game.player_take_card
          puts "You have 3 cards already"
          open_cards
          break
        else
          puts show_player_hand
          puts show_player_score
          game.dealer.move
          puts dealer_move_result
        end
      when 3
        open_cards
        break
      end
    end
  end

  def dealer_move_result
    return "Dealer took card, your move:" if game.dealer.move
    "Dealer missed move, your move:"
  end

  def user_move_menu
    puts "Choose action:"
    puts "miss - 1"
    puts "take card - 2"
    puts "open cards - 3"
    gets.chomp.to_i
  end

  def open_cards
    puts show_dealer_hand
    puts show_dealer_score
    puts show_player_score
  end

  def new_game_or_exit?
    puts "Continue game: y/n?"
    return false if gets.chomp == "y"
    true
  end
end

game = Main.new
game.interface
