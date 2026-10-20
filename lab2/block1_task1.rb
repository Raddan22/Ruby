arr = [1, 5, 3, 8, 2, 10]
puts "Масив: #{arr.inspect}"
puts

puts "--- Спосіб 1 (керуючі конструкції) ---"
def task1_control(arr)
  return [] if arr.empty?
  sum = 0
  i = 0
  while i < arr.length
    sum += arr[i]
    i += 1
  end
  avg = sum.to_f / arr.length
  puts "Середнє арифметичне: #{avg}"
  result = []
  for x in arr
    result << x if x > avg
  end
  result
end
puts "Результат: #{task1_control(arr).inspect}"
puts

puts "--- Спосіб 2 (ітератор) ---"
def task1_iterator(arr)
  return [] if arr.empty?
  avg = arr.sum.to_f / arr.size
  puts "Середнє арифметичне: #{avg}"
  arr.select { |x| x > avg }
end
puts "Результат: #{task1_iterator(arr).inspect}"