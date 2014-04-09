class Device < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :trackable,:rememberable,
  devise :database_authenticatable, :registerable,
         :authentication_keys => [:uid]
         
  
  
  has_many :locations
  has_many :weathers
  has_many :camera_pictures
  
  def last_location
    locations.last
  end
  

  def last_weather
    weathers.last
  end  
  
  
  def last_picture
    camera_pictures.last
  end
  
end
