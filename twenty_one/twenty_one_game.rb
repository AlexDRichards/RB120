module DeckTools
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
            10 => 'ten',
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
end

class Deck
    include DeckTools
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

class Player < Deck
    attr_accessor :hand, :stay
    include DeckTools
    def total
        sum = 0
        @hand.each do |card|
            if card[0].is_a?(Integer)
                sum += card[0]
            elsif card[0] == 'a'
                sum += 11
            else
                sum += 10
            end
        end
        case sum > 21 && @hand.flatten.include?('a')
        when true then sum -= 10
        when false then sum
        end
    end
end

class Human < Player
    attr_accessor :name
    def initialize
        @hand = []
        puts "What's your name, player?"
        @name = gets.chomp
    end

    def display_hand
        @hand.each_with_index do |card, loc|
            puts "  Card #{loc + 1}:" + " #{translate(card)}"
        end
        puts "  Hand Total: #{total}"
    end
end

class Computer < Player
    attr_accessor :name
    def initialize
        @hand = []
        @name = ['Deep Blue', 'Watson','Siri'].sample
    end

    def choice
        choice = ''
        case
        when self.total >= 17
            choice = 'stay'
        when self.total <= 16
            choice = 'hit'
        end
    end 

    def display_hand
        concealed_cards = []
        @hand.each_with_index do |card, _|
            concealed_cards << card
        end
        puts "  Card 1: MYSTERY CARD."
        concealed_cards[1..-1].each_with_index do |card, loc|
            puts "  Card #{loc + 2}:" + " #{translate(card)}"
        end
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

    def show_initial_hand
        puts "#{@human.name}'s hand:"
        @human.display_hand
        puts "#{@computer.name}'s hand:"
        @computer.display_hand
    end

    def player_turn
        answer = ''
        loop do
            puts "Would you like to hit or stay?(h/s)"
            answer = gets.chomp.downcase
            break if %w(h s).include?(answer)
            puts "I'm sorry, please check your typing and try again."
        end
        case answer
        when 'h' then @human.hand << @deck.deal
        when 's' then @human.stay = true
        end
    end

    def computer_turn
        decision = @computer.choice
        case decision
        when 'hit' then @computer.hand << @deck.deal
        when 'stay' then @computer.stay = true
        end
    end

    def bust_check
        @human.total > 21 || @computer.total > 21
    end

    def stay_check
        @human.stay && @computer.stay 
    end

    def display_results
        puts "#{@human.name} has #{@human.total} points!"
        puts "#{@computer.name} has #{@computer.total} points!"
    end

    def declare_winner
        player_score = @human.total
        computer_score = @computer.total

        case
        when player_score > 21 then puts "Player busts! Computer won!"
        when computer_score > 21 then puts "Computer busts! Player won!"
        when player_score > computer_score then puts "Player won!"
        when player_score < computer_score then puts "Computer won!"
        else
            puts "Tie!"
        end
    end

    def play_again?
        answer = nil
        loop do
            puts "Would you like to play again?"
            answer = gets.chomp
            break if %w(y n).include?(answer.downcase)
            puts "Please try your input again."
        end
        answer == 'y'
    end

    def reset_game
        @deck = Deck.new
        @human = Human.new
        @computer = Computer.new
    end

    def goodbye_message
        puts "Thanks for playing Twenty-One!"
        puts "GOODBYE!"
    end

    def play
        loop do
            deal_cards
            loop do
                show_initial_hand
                player_turn
                break if bust_check
                computer_turn
                break if bust_check
                break if stay_check
            end
            display_results
            declare_winner
            break if !play_again?
            reset_game
        end
        goodbye_message
    end 
end

TwentyOne.new.play