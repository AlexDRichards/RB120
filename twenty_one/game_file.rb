=begin
Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 
as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
  - requires a 'bust' check
  - stay will break the loop
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then the highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.
=end

=begin
Nouns: card, player, dealer, participant, deck, game, total
Verbs: deal, hit, stay, busts
=end

=begin
Player
- hit
- stay
- busted?
- total
Dealer
- hit
- stay
- busted?
- total
- deal (should this be here, or in Deck?)
Participant
Deck
- deal (should this be here, or in Dealer?)
Card
Game
=end


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

module CardDecoder
  def translate(card)
    # card = [value, type]
    value = card[0]
    type = card[1]
    value_chart = {
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine',
        'j' => 'jack',
        'q' => 'queen',
        'k' => 'king',
        'a' => 'ace'
    }

    type_chart = {
      's' => 'spades',
      'd' => 'diamonds',
      'c' => 'clubs',
      'h' => 'hearts',
    }
    # YOU should be the player object in question
    "#{value_chart[value].upcase} of #{type_chart[type].upcase}"
  end

  def calculate_value(card)
    if card[0].is_a?(Integer)
      card[0]
    elsif card[0].is_a?(String)
      if card[0] == 'a'
        #check total... if 20, return value of 1
        #else 11
      else
        10
      end
    end
  end
end

class Deck
  include CardDecoder
  include DeckMaker
  attr_accessor :deck

  # deck structure:
    # DECK => []
    # CARD => [[value, type]]

  def initialize
    @deck = deck_maker
  end
  
  def deal
    card_1 = @deck.sample
    @deck.delete(card_1)
    card_2 = @deck.sample
    @deck.delete(card_2)
    [card_1, card_2]
  end

  def deal_one
    card = deck.sample
    deck.delete(card)
  end

  def size
    @deck.size
  end

end

# I'm trying to display the hand once another card has been added

class Player < Deck
  attr_accessor :hand
  def initialize
  end

  def hit
    p @deck.deck.deal_one
  end

  def stay
  end

  def busted?
  end

  def total

  end

  def display_hand
    p @hand
  end

end


class Game
  def initialize
    @deck = Deck.new
    @human = Player.new
    @computer = Player.new
  end

  def welcome_message
    puts "********************"
    puts "WELCOME TO TWENTY ONE"
    puts "********************"
  end

  def deal_cards
    @human.hand = @deck.deal
    @computer.hand = @deck.deal
  end

  def show_initial_cards
    puts "Human has #{@deck.translate(@human.hand[0])} and a #{@deck.translate(@human.hand[1])}"
    puts "Computer has a #{@deck.translate(@computer.hand[0])} and a MYSTERIOUS CARD!"
  end

  def player_turn
    puts "Your hand's value is ______________. Would you like to hit or stay? (h/s)"
    player_answer = gets.chomp
    case player_answer
    when 'h' then @human.hit
    when 's' then #<METHOD>
    end
    @human.display_hand
  end

  def start
    welcome_message
    deal_cards
    show_initial_cards
    player_turn
    # dealer_turn
    # show_result
  end
end

Game.new.start

#############

=begin
# UNUSED CLASSES #
class Dealer
  def initialize
    # seems like very similar to Player... do we even need this?
  end

  def deal
    # does the dealer or the deck deal?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end
=end
