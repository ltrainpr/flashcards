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

