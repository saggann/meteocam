class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :twitter]
         
  # Following devices
  has_many  :user_follow_devices, :dependent => :destroy
  has_many  :followed_devices,    :through   => :user_follow_devices, 
                                  :source    => :device
  

                              
  # Owned devices  
  has_many  :devices

  
  def following?(device)
    user_follow_devices.find_by(device_id: device.id)
  end

  # Follow only public devices
  def follow!(device)
    if device.public
       user_follow_devices.create!(device_id: device.id)
    else
      e = UserFollowDevice.new
      e.errors.add(:base, 'Device should be public to be followed')
      e
    end
  end
  
  def unfollow!(device)
     user_follow_devices.find_by_device_id(device).destroy
  end
  

  
  
end
