b = 8.0  
h = 6.0   

area = 0.5 * b * h

side = Math.sqrt(h**2 + (b / 2.0)**2)

perimeter = b + 2 * side

puts "Основа: #{b}"
puts "Висота: #{h}"
puts "Площа: #{area}"
puts "Бічна сторона: #{side.round(3)}"
puts "Периметр: #{perimeter.round(3)}"