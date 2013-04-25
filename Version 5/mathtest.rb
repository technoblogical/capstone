chicken = "July"
math = ""
math << chicken
while math.length < 21 do
	if math.length%2 == 0
		math = "+" + math if math.length < 21
	else
		math = math + "+" if math.length < 21
	end
end

puts math.length
puts chicken
puts math