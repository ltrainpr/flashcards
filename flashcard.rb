
# class CardDeck
#   attr_reader :array, :definition
#   def initialize
#     @array = []
#     @definition
#   end
# end

# class View
#   def print_definition
#   end

#   def welcome!
#   end
# end


class CardDeck
  attr_reader :deck_of_cards, :deck
  def initialize
    @deck = load_data_file
    @deck_of_cards = generate_cards
  end
  def load_data_file
    array = []
    File.foreach("flashcard_samples.txt") do |row|  
      array << row
    end
    array - ["\n"]
  end
  def generate_cards
    array = []
    deck.each_with_index do |item, index|
      if index.odd?
        current_def = deck[index-1]
        array << Card.new(current_def,item)
      end
    end
    array
  end

end

class Card
  attr_reader :definition, :ans
  def initialize(definition, ans)
    @definition = definition 
    @ans = ans  
  end
end

class Controller
  def initialize
    @card_deck = CardDeck.new.deck_of_cards
    @view = View.new
    @user_input = nil
    @still_playing = true
  end

  def start
    @view.welcome!
    play
  end

  def play
    card = 0
    while @still_playing
      @view.print_definition(@card_deck[card].definition)
      @user_input = gets.chomp
      parse_input(card)
      card == (@card_deck.length - 1) ? card = 0 : card += 1
    end
  end

  def parse_input(card)
    case @user_input
    when "quit" then @still_playing = false
    when "skip" then @view.display_skip_message
    when @card_deck[card].ans then @view.display_correct_message
    else 
      @view.display_incorrect_message
    end   
  end
end

game = Controller.new
game.start

