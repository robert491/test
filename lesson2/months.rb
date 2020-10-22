require 'date'

months_names = Date::MONTHNAMES.dup
months_names.shift

year = Time.now.year

months_days = []
1.upto(12) do |month_index|
  months_days << Date.new(year, month_index, -1).day
end

calendar = months_names.zip(months_days).to_h

calendar.each_key do |month|
  puts month if calendar[month] == 30
end
