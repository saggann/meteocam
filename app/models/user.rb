class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :twitter],
         :authentication_keys => [:login]

  validates :username,
                :uniqueness => {
                        :case_sensitive => false
                  },
                 :presence => true

  # Following devices
  has_many  :user_follow_devices, :dependent => :destroy
  has_many  :followed_devices,    :through   => :user_follow_devices,
                                  :source    => :device

  # Owned devices
  has_many  :devices

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  #### This is the correct method you override with the code above
  #### def self.find_for_database_authentication(warden_conditions)
  #### end
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  # Email is not required
  def email_required?
    false
  end
  
  # Username is required
  def username_required?
    true
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_twitter_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

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
