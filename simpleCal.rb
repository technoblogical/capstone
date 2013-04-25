puts "what month?"
temp = gets.chomp!
MoCKW = temp.to_i
puts "what year?"
temp = gets.chomp!
YeCKW = temp.to_i

# File:  simpleCal.rb

require "./inc_simpleCal"
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
 
  def test_01_simple_number_test
    SimpleCal.new(MoCKW, YeCKW)
  end
 
end
#