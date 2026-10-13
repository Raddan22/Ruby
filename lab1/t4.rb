events = [
  { title: "Ruby Meetup",    date: "2026-10-12", attendees: 58 },
  { title: "JS Conf",        date: "2026-09-01", attendees: 29 },
  { title: "Rails Workshop", date: "2026-11-05", attendees: 35 },
  { title: "Python Day",     date: "2026-10-20", attendees: 20 },
  { title: "Go Seminar",     date: "2026-08-15", attendees: 15 },
  { title: "DevOps Summit",  date: "2026-12-01", attendees: 100 }
]

result1 = events
            .select { |e| e[:attendees] > 30 }
            .sort_by { |e| e[:date] }
            .map { |e| e[:title] }
puts "Спосіб 1: #{result1.inspect}"

result2 = events
            .each_with_object([]) { |e, acc| acc << e if e[:attendees] > 30 }
            .sort_by { |e| e[:date] }
            .map { |e| e[:title] }
puts "Спосіб 2: #{result2.inspect}"

result3 = events
            .filter_map { |e| e if e[:attendees] > 30 }
            .sort { |a, b| a[:date] <=> b[:date] }
            .map { |e| e[:title] }
puts "Спосіб 3: #{result3.inspect}"