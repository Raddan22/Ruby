N = 10

# map 
squares_range = (1..N).map { |i| i * i }
puts "Спосіб 1 (range.map): #{squares_range.inspect}"

# times
squares_times = []
N.times { |i| squares_times << (i + 1) ** 2 }
puts "Спосіб 2 (times):     #{squares_times.inspect}"

# upto
squares_upto = []
1.upto(N) { |i| squares_upto << i ** 2 }
puts "Спосіб 3 (upto):      #{squares_upto.inspect}"