matrix = [[1, 2, 3], [9, 5, 4], [2, 4, 6], [7, 3, 1]]
puts "Матриця: #{matrix.inspect}"
puts

puts "--- Спосіб 1 (for + while) ---"
def task2_loop(matrix)
  result = matrix.map(&:dup)
  for row in result
    sorted = true
    i = 0
    while i < row.length - 1
      if row[i] > row[i + 1]
        sorted = false
        break
      end
      i += 1
    end
    if sorted
      row.sort!
    else
      row.shuffle!
    end
  end
  result
end
puts "Результат: #{task2_loop(matrix).inspect}"
puts

puts "--- Спосіб 2 (ітератор) ---"
def task2_iterator(matrix)
  matrix.map do |row|
    if row == row.sort
      row.sort
    else
      row.shuffle
    end
  end
end
puts "Результат: #{task2_iterator(matrix).inspect}"