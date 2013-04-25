# File:  simplerCal.rb

require "./inc_simplerCal"
require "test/unit"
#
class Test_The_Cal < Test::Unit::TestCase
	def test_01_simple_number_test
		this_one = SimplerCal.new(9, 2012)	
	end

	def test_02_test_the_month_array
		this_one = SimplerCal.new(9, 2012)
		this_other_one = SimplerCal.new(1,2011)
		assert_equal("September",this_one.month)
		assert_equal("January",this_other_one.month)
	end

	def test_03_month_and_and_year_adjustment_for_Zellers
		this_one = SimplerCal.new(1, 2012)
		this_other_one = SimplerCal.new(2,2012)
		assert_equal(13,this_one.zeller_month)
		assert_equal(2011,this_one.zeller_year)
	end

	def test_04_leap_year_question_mark
		twenty_twelve = SimplerCal.new(1, 2012)
		two_thousand = SimplerCal.new(3, 2000)
		nineteen_hundred = SimplerCal.new(4, 1900)
		nineteen_eighty_seven = SimplerCal.new(5, 1987)
		twenty_three_eighty_three = SimplerCal.new(6, 2383)
		assert_equal(true,twenty_twelve.leap_year?)
		assert_equal(true,two_thousand.leap_year?)
		assert_equal(false,nineteen_hundred.leap_year?)
		assert_equal(false,nineteen_eighty_seven.leap_year?)
		assert_equal(false, twenty_three_eighty_three.leap_year?)
	end

	def test_05_check_number_of_days
		twenty01 = SimplerCal.new(1, 2001)
		twenty02 = SimplerCal.new(2, 2002)
		twenty03 = SimplerCal.new(3, 2003)
		twenty04 = SimplerCal.new(4, 2004)
		twenty05 = SimplerCal.new(5, 2005)
		twenty06 = SimplerCal.new(6, 2006)
		twenty07 = SimplerCal.new(7, 2007)
		twenty08 = SimplerCal.new(8, 2008)
		twenty09 = SimplerCal.new(9, 2009)
		twenty10 = SimplerCal.new(10, 2010)
		twenty11 = SimplerCal.new(11, 2011)
		twenty12 = SimplerCal.new(12, 2012)
		two1000 = SimplerCal.new(2, 2012)
		nineteen100 = SimplerCal.new(2, 1900)
		nineteen84 =SimplerCal.new(2, 1984)
		nineteen77 = SimplerCal.new(2, 1977)
		nineteen56 = SimplerCal.new(2, 1956)
		assert_equal(31, twenty01.number_of_days)
		assert_equal(28, twenty02.number_of_days)
		assert_equal(31, twenty03.number_of_days)
		assert_equal(30, twenty04.number_of_days)
		assert_equal(31, twenty05.number_of_days)
		assert_equal(30, twenty06.number_of_days)
		assert_equal(31, twenty07.number_of_days)
		assert_equal(31, twenty08.number_of_days)
		assert_equal(30, twenty09.number_of_days)
		assert_equal(31, twenty10.number_of_days)
		assert_equal(30, twenty11.number_of_days)
		assert_equal(31, twenty12.number_of_days)
		assert_equal(29, two1000.number_of_days)
		assert_equal(28, nineteen100.number_of_days)
		assert_equal(29, nineteen84.number_of_days)
		assert_equal(28, nineteen77.number_of_days)
		assert_equal(29, nineteen56.number_of_days)

	end

	def test_06_checks_empty_calendar
		nineteen88 = SimplerCal.new(3, 2012)
		assert_equal(nineteen88.empty_cal, <<"""

 Su Mo Tu We Th Fr Sa






""")
	end

	def test_07_checks_the_month_and_year_in_the_empty_calendar
		twenty01 = SimplerCal.new(1, 2001)
		nineteen23 = SimplerCal.new(5, 1923)
		assert_equal(twenty01.only_MMYYYY, <<"""
     January 2001    
 Su Mo Tu We Th Fr Sa






""")
		assert_equal(nineteen23.only_MMYYYY, <<"""
       May 1923      
 Su Mo Tu We Th Fr Sa






""")	
	end

	def test_08_checks_the_zeller_weekday
		twenty12 = SimplerCal.new(10, 2012)
		twenty11 = SimplerCal.new(10, 2011)
		twenty10 = SimplerCal.new(3, 2010)
		two1009 = SimplerCal.new(3, 2009)
		two1008 = SimplerCal.new(3, 2008)
		assert_equal(twenty12.zeller_weekday, 2)
		assert_equal(twenty11.zeller_weekday, 0)
		assert_equal(twenty10.zeller_weekday, 2)
		assert_equal(two1009.zeller_weekday, 1)
		assert_equal(two1008.zeller_weekday, 0)
	end

	def test_09_checks_the_full
		nineteen23 = SimplerCal.new(5, 1923)
		nineteen92 = SimplerCal.new(2, 1992)
		eighteen88 = SimplerCal.new(2, 1888)
		foo = """       May 1923      
 Su Mo Tu We Th Fr Sa
        1  2  3  4  5
  6  7  8  9 10 11 12
 13 14 15 16 17 18 19
 20 21 22 23 24 25 26
 27 28 29 30 31      
                     
"""
        assert_equal(nineteen23.full_month, foo)
        foo = """    February 1992    
 Su Mo Tu We Th Fr Sa
                    1
  2  3  4  5  6  7  8
  9 10 11 12 13 14 15
 16 17 18 19 20 21 22
 23 24 25 26 27 28 29
                     
"""
        assert_equal(nineteen92.full_month, foo)
        foo = """    February 1888    
 Su Mo Tu We Th Fr Sa
           1  2  3  4
  5  6  7  8  9 10 11
 12 13 14 15 16 17 18
 19 20 21 22 23 24 25
 26 27 28 29         
                     
"""
        assert_equal(eighteen88.full_month, foo)
	end
end