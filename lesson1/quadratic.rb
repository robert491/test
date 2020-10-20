numbers = []

'a'.upto('c') do |index|
  print "Коэффициент \"#{index}\" равен: "
  numbers << gets.to_i
end

a, b, c = numbers
d = b ** 2 - 4 * a * c

unless d.negative?
  first_x = (- b + Math.sqrt(d)) / (2 * a) 
  second_x = (- b - Math.sqrt(d)) / (2 * a)
end

message =
  if d.positive?
    "D = #{d}. x1 = #{first_x}, x2 = #{second_x}."
  elsif d.zero?
    "D = #{d}. x = #{first_x}."
  else
    "D = #{d}. Корней нет."
  end

puts message
