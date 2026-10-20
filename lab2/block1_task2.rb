arr = [3, 4, 7, 2, 9, 6, 1, 5]
puts "Масив: #{arr.inspect}"
puts

puts "--- Спосіб 1 (керуючі конструкції) ---"
def task2_control(arr)
  return arr.dup if arr.length < 3
  result = arr.dup
  first = arr.first
  last  = arr.last
  i = 1
  while i < result.length - 1
    if result[i].even?
      result[i] += first
    else
      result[i] += last
    end
    i += 1
  end
  result
end
puts "Результат: #{task2_control(arr).inspect}"
puts

puts "--- Спосіб 2 (ітератор) ---"
def task2_iterator(arr)
  return arr.dup if arr.length < 3
  first = arr.first
  last  = arr.last
  arr.each_with_index.map do |x, i|
    if i == 0 || i == arr.length - 1
      x
    elsif x.even?
      x + first
    else
      x + last
    end
  end
end
puts "Результат: #{task2_iterator(arr).inspect}"