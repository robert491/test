class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def value
    @cards.
  end

  def to_s
    @cards.map { |card| "#{card.value}#{card.suit} " }.join
  end
end
