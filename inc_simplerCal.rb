# File:  inc_simpleCal.rb
MonthArray = ["Blern",
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December"
	]

CalendarPrintout = ["",
	" Su Mo Tu We Th Fr Sa",
	"",
	"",
	"",
	"",
	"",
	"",
	""
]
 
class SimplerCal


	def initialize( month , year )
		raise unless month >=1
		raise unless year >=1800
		raise unless month <= 12
		raise unless year <= 3000
		@month = month
		@year = year
		@day_of_the_month = 1
		if [1, 3, 5, 7, 8, 10, 12].include? month
			@number_of_days = 31
		elsif [4, 6, 9, 11].include? month
			@number_of_days = 30
		else
			if (@year % 400) == 0
				@number_of_days = 29
			elsif (@year % 100) == 0
				@number_of_days = 28
			elsif (@year % 4) == 0
				@number_of_days = 29
			else
				@number_of_days = 28
			end
		end
		if @month < 3
			@zeller_month = @month + 12
			@zeller_month
		else
			@zeller_month = @month
		end
		if (@year % 400) == 0
			@leap_year = true
		elsif (@year % 100) == 0
			@leap_year = false
		elsif (@year % 4) == 0
			@leap_year = true
		else
			@leap_year = false
		end
		if @month < 3
			@zeller_year = @year - 1
		else
			@zeller_year = @year
		end
		@zeller_weekday = (@day_of_the_month+(((@zeller_month+1)*26)/10)+@zeller_year+(@zeller_year/4)+6*(@zeller_year/100)+(@zeller_year/400))%7
	end

	def month
      MonthArray[@month]
	end

	def zeller_month
		@zeller_month
	end

	def zeller_year
		@zeller_year
	end

	def leap_year?
		@leap_year
	end

	def number_of_days
		@number_of_days
	end

	def empty_cal
		CalendarPrintout.join("\n")
	end

	def only_MMYYYY
		#Removing the line below here will be important later!
		CalendarPrintout[0] = ""#When I didn't have these lines, I was accidently printing two months at a time.
		#Removing the line above here will be important later!
		math = ""
		math << MonthArray[@month]
		math << " "
		math << @year.to_s
		while math.length < 21 do
			if math.length%2 == 0
				math = " " + math if math.length < 21
			else
				math = math + " " if math.length < 21
			end
		end
		CalendarPrintout[0] << math
		CalendarPrintout.join("\n")
	end

	def zeller_weekday
		@zeller_weekday
	end

	def full_month
		big_calendar = ""
		CalendarPrintout[0] =""
		CalendarPrintout[1] =" Su Mo Tu We Th Fr Sa"
		CalendarPrintout[2] =""
		CalendarPrintout[3] =""
		CalendarPrintout[4] =""
		CalendarPrintout[5] =""
		CalendarPrintout[6] =""
		CalendarPrintout[7] =""
		calendar_box_counter = 1 #human counting! box 0 !== exist
		calendarprintout_array_counter = 2
		math = ""
		math << MonthArray[@month]
		math << " "
		math << @year.to_s
		while math.length < 21 do
			if math.length%2 == 0
				math = " " + math if math.length < 21
			else
				math = math + " " if math.length < 21
			end
		end
		CalendarPrintout[0] << math
		line_counter = 2
		date_counter = 1
		if @zeller_weekday == 0
			CalendarPrintout[line_counter] = "                    1"
			line_counter = line_counter + 1
				calendar_box_counter = calendar_box_counter + 7
				date_counter = date_counter + 1
		end
		while calendar_box_counter < 43
			box_math = ""
			if calendar_box_counter >= @zeller_weekday
				if date_counter <= @number_of_days
					box_math << date_counter.to_s 
					date_counter = date_counter + 1
				end
			end
			while box_math.length < 3 do
				box_math = " " + box_math
			end
			CalendarPrintout[line_counter] << box_math
			calendar_box_counter = calendar_box_counter + 1
			line_counter = line_counter + 1 if (calendar_box_counter - 1)%7 == 0
		end
		big_calendar = CalendarPrintout.join("\n")
		big_calendar
	end
end