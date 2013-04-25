m = ARGV[0]
y = ARGV[1]
#system "cal #{month} #{year}"

if [m].include? nil
	puts "please enter a month"
	m = gets.chomp!
end

if [y].include? nil
	puts "please enter a year"
	y = gets.chomp!
end




#---- tests! tests! tests! tests! ----
if ["9", "09", "september", "sept", "September", "Sept"].include? m
	if y == "2012"
		puts "Right"
	else
	  puts "Failed Year"
	end
else
	puts "Failed Month"
end