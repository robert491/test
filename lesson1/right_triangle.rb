triangle_sides = []

1.upto(3) do |index|
  print "#{index} сторона треугольника: "
  triangle_sides << gets.to_f
end

hypotenuse = triangle_sides.max if triangle_sides.sort.last(2).uniq.size > 1 
legs = triangle_sides - [hypotenuse]

message = ["Треугольник", "исходя из наших рассчетов"]
message << "равнобедренный и равносторонний" if triangle_sides.uniq.size == 1
message << "прямоугольный" if !hypotenuse.nil? && hypotenuse ** 2 == legs.first ** 2 + legs.last ** 2
message << "равнобедренный" if triangle_sides.uniq.size == 2
puts message.join(', ') << '.'
