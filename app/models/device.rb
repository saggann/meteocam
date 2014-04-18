class Device < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :trackable,:rememberable,
  devise :database_authenticatable, :registerable,
         :authentication_keys => [:uid]
         
  # Followers
  has_many :user_follow_devices, :dependent => :destroy
  has_many :followers,           :through   => :user_follow_devices, 
                                 :source    => :user

  
  # Owner
  belongs_to  :user
  validates   :user_id, :presence => true
  
  # Device Location
  has_one  :location,     dependent: :destroy
  
  # Device pictures
  has_one :camera_picture, dependent: :destroy
  
  # Device weathers
  has_many :weathers,      dependent: :destroy
  

  # Device unique id
  validates :uid,     :presence => true
  

  # Get last weather update
  def last_weather
    weathers.last
  end  
  
  
  
  
  
  # User get read access to device ( owner or public device)
  def get_read_access( u)
    
    return (u == self.user) || (self.public)
        
     
  end
    


  
end
