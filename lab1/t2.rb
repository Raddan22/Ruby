lines = [
  "Як справи?",
  "Це твердження.",
  "Котра година?",
  "Ruby — чудова мова!",
  "Ти впевнений?",
  "Ні."
]

questions = lines.select { |s| s.end_with?("?") }
puts "Через select: #{questions.inspect}"

questions2 = lines.reject { |s| !s.end_with?("?") }
puts "Через reject: #{questions2.inspect}"

questions3 = lines.grep(/\?\z/)
puts "Через grep:   #{questions3.inspect}"