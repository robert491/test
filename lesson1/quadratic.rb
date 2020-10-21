numbers = []

'a'.upto('c') do |index|
  print "Коэффициент \"#{index}\" равен: "
  numbers << gets.to_i
end

a, b, c = numbers
discriminant = b ** 2 - 4 * a * c
discriminant_root = Math.sqrt(discriminant)

unless discriminant.negative?
  first_x = (- b + discriminant_root) / (2 * a) 
  second_x = (- b - discriminant_root) / (2 * a)
end

message =
  if discriminant.positive?
    "D = #{discriminant}. x1 = #{first_x}, x2 = #{second_x}."
  elsif d.zero?
    "D = #{discriminant}. x = #{first_x}."
  else
    "D = #{discriminant}. Корней нет."
  end

puts message
