class Card
  CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = ["\u{2666}", "\u{2665}", "\u{2660}", "\u{2663}"]

  attr_reader :value, :suit

  def initialize(data)
    @value = data.first
    @suit = data.last
  end
end
