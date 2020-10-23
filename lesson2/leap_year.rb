common_year = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

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

quantity += common_year.take(user_month - 1).sum

puts quantity
