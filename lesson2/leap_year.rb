common_year = {
  1 =>  31,
  2 =>  28,
  3 =>  31,
  4 =>  30,
  5 =>  31,
  6 =>  30,
  7 =>  31,
  8 =>  31,
  9 =>  30,
  10 => 31,
  11 => 30,
  12 => 31 
}

def leap?(year)
  if (year % 4).positive?
    false
  elsif (year % 100).positive?
    true
  elsif (year % 400).positive?
    false
  else
    true
  end
end

print "Введите число: "
user_date = gets.to_i

print "Введите месяц (1-12): "
user_month = gets.to_i

print "Введите год: "
user_year = gets.to_i

quantity = leap?(user_year) && user_month > 2 ? user_date += 1 : user_date

(1...user_month).each do |month|
  quantity += common_year[month]
end

puts quantity
