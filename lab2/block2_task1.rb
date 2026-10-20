matrix = [[3, 9, 1], [5, 2, 4], [7, 0, 9]]
puts "Матриця: #{matrix.inspect}"
puts

puts "--- Спосіб 1 (while) ---"
def task1_loop(matrix)
  return matrix if matrix.empty? || matrix.first.empty?
  rows = matrix.length
  cols = matrix.first.length
  max = matrix[0][0]
  r = 0
  while r < rows
    c = 0
    while c < cols
      max = matrix[r][c] if matrix[r][c] > max
      c += 1
    end
    r += 1
  end
  puts "Максимум: #{max}"
  r = 0
  while r < rows
    if matrix[r].include?(max)
      n = matrix[r].length
      i = 0
      while i < n - 1
        j = 0
        while j < n - 1 - i
          if matrix[r][j] > matrix[r][j + 1]
            matrix[r][j], matrix[r][j + 1] = matrix[r][j + 1], matrix[r][j]
          end
          j += 1
        end
        i += 1
      end
    end
    r += 1
  end
  matrix
end
puts "Результат: #{task1_loop(matrix.map(&:dup)).inspect}"
puts

puts "--- Спосіб 2 (ітератор) ---"
def task1_iterator(matrix)
  return matrix if matrix.empty? || matrix.first.empty?
  max = matrix.flatten.max
  puts "Максимум: #{max}"
  matrix.map { |row| row.include?(max) ? row.sort : row }
end
puts "Результат: #{task1_iterator(matrix.map(&:dup)).inspect}"