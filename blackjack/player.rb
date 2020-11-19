class Player
  attr_reader :name, :money, :hand

  INITIAL_MONEY = 100

  def initialize(name = 'Dealer')
    @name = name
    @money = INITIAL_MONEY
  end

  def hand=(cards)
    @hand = Hand.new(cards)
  end
end
