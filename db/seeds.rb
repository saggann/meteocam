# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Device.delete_all
Location.delete_all
Weather.delete_all
User.delete_all
CameraPicture.delete_all


user =       User.create!   :email => 'toto@toto.com', :password => 'xxxxxxxx', :password_confirmation => 'xxxxxxxx'

dev1 =       Device.create  :name => "[dummy] Ad Astra", :uid => "d74d488752650f23e6394cdd8540325be42be9b87134e798ed7047e0df5c1b68"
dev2 =       Device.create  :name => "Home Cam",         :uid => "d84d488752650f23e6394cdd8540325be42be9b87134e798ed7047e0df5c1b69"
dev3=        Device.create  :name => "Prototype",        :uid => "dcce27c124e309b9a22c753e70cf48d8aca2c1dd101e4131d3f40d27" 

img = CameraPicture.create(device: dev1, timestamp: Time.now)
img.image = (File.open(File.join(Rails.root, 'img.jpg')))
img.save


Location.create( device: dev1, timestamp: Time.now ,  longitude: -1.626256, latitude: 49.624381, altitude: 80.00)
Location.create( device: dev2, timestamp: Time.now ,  longitude: -1.474019, latitude: 49.509269, altitude: 10.00)


for i in 0..24

   # creates a 24 hours history
   t = Time.now - i.hour
   
   Weather.create( device: dev1, timestamp: t, temperature: 273.3 + Random.rand(20), pressure: 100000 + Random.rand(2000))
 
   Weather.create( device: dev2, timestamp: t, temperature: 273.3 + Random.rand(20), pressure: 100000 + Random.rand(2000))  
   
end




