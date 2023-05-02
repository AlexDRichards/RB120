
module DeckMaker
    def deck_maker
      deck = []
      types = %w(h s c d)
      high_cards = %w(j q k a)
      types.each do |type|
          (1..9).each do |num|
            deck << [num, type]
          end
          high_cards.each do |face|
            deck << [face, type]
          end
        end
      deck
    end
end

class Deck
    include DeckMaker
    attr_accessor :cards
    def initialize
        @cards = deck_maker
    end

    def deal
        card = @cards.sample
        @cards.delete(card)
        card
    end
end

class Player
end

class Human < Player
    attr_accessor :hand
    def initialize
        @hand = []
    end
end

class Computer < Player
    attr_accessor :hand
    def initialize
        @hand = []
    end
end


class TwentyOne
    def initialize
        @deck = Deck.new
        @human = Human.new
        @computer = Computer.new
    end

    def deal_cards
        @human.hand << @deck.deal
        @human.hand << @deck.deal
        @computer.hand << @deck.deal
        @computer.hand << @deck.deal
    end

    def play
        deal_cards
        # show_hand
        # player_turn
        # computer_turn
        # display_winner
        # play_again?
    end 
end

TwentyOne.new.play

TwentyOne.new