class Device < ActiveRecord::Base
  
  has_many :fixes
  has_many :weathers
  
  def last_fix
    fixes.last
  end
  

  def last_weather
    weathers.last
  end  
  
end
