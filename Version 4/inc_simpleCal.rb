# File:  inc_simpleCal.rb
 
class SimpleCal
 
  def initialize( month , year )
    raise unless month >=1
    raise unless year >=1800
    raise unless month <= 12
    raise unless year <= 3000

  end

end