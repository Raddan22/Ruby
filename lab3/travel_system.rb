travels = {
  "Париж" => 8500,
  "Лондон" => 9200,
  "Рим" => 7100,
  "Барселона" => 6500,
  "Берлін" => 5400,
  "Відень" => 4800,
  "Прага" => 3500,
  "Амстердам" => 6200,
  "Мадрид" => 7000,
  "Осло" => 0 
}

seats = {
  "Париж" => 5, "Лондон" => 2, "Рим" => 10, "Барселона" => 8,
  "Берлін" => 4, "Відень" => 6, "Прага" => 12, "Амстердам" => 3,
  "Мадрид" => 7, "Осло" => 9
}

puts "=== Завдання 1 ==="
p travels
puts "\n"

puts "=== Завдання 2 ==="
indexed_array = travels.to_a
p indexed_array
puts "\n"

puts "=== Завдання 3 ==="
puts "Оберіть опцію сортування:"
puts "1 - За напрямком (А-Я)"
puts "2 - За ціною (від дешевших до дорожчих)"
print "Ваш вибір (1/2): "
choice = gets.chomp.to_i

sorted_travels = if choice == 1
                   travels.sort_by { |city, _price| city }.to_h
                 elsif choice == 2
                   travels.sort_by { |_city, price| price }.to_h
                 else
                   puts "Неправильний вибір. Виводимо без сортування."
                   travels
                 end
p sorted_travels
puts "\n"

puts "=== Завдання 4 ==="
shortest_names = travels.sort_by { |city, _price| city.length }.first(3).to_h
p shortest_names
puts "\n"

puts "=== Завдання 5 ==="
cheapest = travels.select { |_city, price| price > 0 }
                  .sort_by { |_city, price| price }
                  .first(5).to_h
p cheapest
puts "\n"

puts "=== Завдання 6 ==="
print "Введіть назву напрямку для пошуку: "
search_city = gets.chomp

if travels.key?(search_city)
  puts "Подорож '#{search_city}' знайдено!"
  puts "Ціна: #{travels[search_city]} грн"
  puts "Доступна кількість місць: #{seats[search_city]}"
else
  puts "Подорож '#{search_city}' не знайдено в базі."
end
puts "\n"

puts "=== Завдання 7 ==="
total_sum = travels.values.sum
puts "Загальна вартість: #{total_sum} грн"
puts "\n"

puts "=== Завдання 8 ==="
zero_price_cities = travels.select { |_city, price| price == 0 || price.nil? }.keys

if zero_price_cities.empty?
  puts "Усі подорожі мають встановлену ціну."
else
  puts "Знайдено подорожі без ціни: #{zero_price_cities.join(', ')}"
  zero_price_cities.each do |city|
    print "Введіть нову ціну для '#{city}': "
    travels[city] = gets.chomp.to_i
  end
  puts "Оновлений хеш:"
  p travels
end