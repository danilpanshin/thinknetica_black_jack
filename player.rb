# require_relative 'deck'

class Player
  attr_accessor :cards, :score

  def initialize
    @stack = 100
    @cards = []
    @score = 0
  end

  def score
    cards.each do |card|
      if card.include? 'A'
        if @score > 10
          @score += 1
        else
          @score += 11
        end
      elsif card.to_i.zero?
        @score += 10
      else
        @score += card.to_i
      end
    end
    @score
  end

  def new_round
    @stack -= 10
  end
end
