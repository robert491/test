class Deck
  def initialize
    @deck = Card::CARDS.product(Card::SUITS).shuffle
    @deck.map! { |card| Card.new(card) }
  end

  def deal
    @deck.pop(2)
  end
end
