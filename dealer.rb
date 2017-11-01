class Dealer < Player


  def move
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
end
