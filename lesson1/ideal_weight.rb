puts "Ваше имя:"
user_name = gets.chomp

puts "Ваш рост:"
user_height = gets.to_f

ideal_weight = ((user_height - 110) * 1.15).round

message =
  if ideal_weight.negative?
    "Ваш вес уже оптимальный."
  else
    "#{user_name}, ваш идеальный вес #{ideal_weight}."
  end

puts message
