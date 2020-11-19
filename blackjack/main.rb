require_relative 'hand'
require_relative 'player'
require_relative 'card'
require_relative 'deck'

puts 'Добро пожаловать в игру. Как вас зовут?'
player = Player.new(gets.strip)
dealer = Player.new

deck = Deck.new
player.hand = deck.deal
dealer.hand = deck.deal

puts "#{player.name} - #{player.hand}"
puts "#{dealer.name} - * *"
