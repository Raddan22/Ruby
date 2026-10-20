puts "--- Спосіб 1 (File.open + raise) ---"
def task1_block(path)
  File.open(path, "w") do |file|
    file.puts "=== ЗВІТ (спосіб 1) ==="
    file.puts "Дата: #{Time.now}"
    file.puts "Рядок 1: успішно записано"
    raise "Тестовий виняток для перевірки автозакриття"
    file.puts "Цей рядок НЕ буде записано"
  end
rescue => e
  puts "  Перехоплено: #{e.message}"
  puts "  Файл закрито автоматично блоком File.open"
end

task1_block("report1.txt")
puts "  Вміст report1.txt:"
puts File.read("report1.txt").lines.map { |l| "    #{l}" }.join
puts

puts "--- Спосіб 2 (File.open + перевірка closed?) ---"
def task1_verify(path)
  ref = nil
  begin
    File.open(path, "w") do |file|
      ref = file
      file.puts "=== ЗВІТ (спосіб 2) ==="
      file.puts "Час: #{Time.now}"
      file.puts "Перевірка автозакриття через closed?"
      raise "Демонстраційний виняток"
    end
  rescue => e
    puts "  Помилка: #{e.message}"
  ensure
    puts "  file.closed? => #{ref&.closed?}"
  end
end

task1_verify("report2.txt")
puts "  Вміст report2.txt:"
puts File.read("report2.txt").lines.map { |l| "    #{l}" }.join