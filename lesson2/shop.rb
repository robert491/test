busket = {}

loop do
  print "Введите название товара (или \"stop\"): "
  user_item = gets.chomp

  break if user_item == "stop"

  print "Цена товара: "
  user_price = gets.to_f

  print "Количество товара: "
  user_quantity = gets.to_f
  
  busket[user_item] = {user_price => user_quantity}
end

busket_total = 0
busket.each do |item, info|
  item_total = info.keys.join.to_f * info.values.join.to_f
  busket_total += item_total

  puts "\nТовар: #{item}\nЦена: #{info.keys.join}$\nКоличество: #{info.values.join}\nИтого: #{item_total}$\n"
end

puts "================="
puts "Сумма: #{busket_total}$"
