d = 0
m = 0
puts "what date?"
d = gets.chomp!
puts "what month?"
m = gets.chomp!
puts "what year?"
year = gets.chomp!
year.reverse!
k = year[0,2]
k.reverse!
j = year
puts "\nHere is the date\n"
puts d
puts m
  if j == nil
  	j = 0
  	puts j
  else
    j.reverse!
    puts j
  end
puts k


class AboutNil < EdgeCase::Koan
	
end