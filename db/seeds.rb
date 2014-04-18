# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Device.destroy_all
Location.destroy_all
Weather.destroy_all
User.destroy_all
CameraPicture.destroy_all


user1 =       User.create!  :id=>1,  :email => 'toto@toto.com',    :password => 'xxxxxxxx', :password_confirmation => 'xxxxxxxx'

dev1=        Device.create  :id=>1, :name =>  "Prototype",  :user=>user1,       :uid => "dcce27c124e309b9a22c753e70cf48d8aca2c1dd101e4131d3f40d27" , :authentication_token =>"OK"

dev2=        Device.create  :id=>2, :name =>  "Chalet Suisse",  :user=>user1,       :uid => "dcce27c124e309b9a22c753e70cf48d8aca2c1dd101e4131d3f40d26" , :authentication_token =>"OK"

loc = Location.create :device => dev2,  :latitude => 47.041595, :longitude => 8.786838, :altitude => 1800, :timestamp => DateTime.now
dev2.location = loc
dev2.save

uri =  "http://www.gasthaushirschen.ch/wetter-kamera/getbild.php"

img = CameraPicture.create :device => dev2, :timestamp => DateTime.now, :remote_picture_url => uri
img.save
dev2.save

user2 =       User.create!  :id=>2,  :email => 'tata@tata.com',    :password => 'xxxxxxxx', :password_confirmation => 'xxxxxxxx'

dev3=         Device.create  :id=>3, :name =>  "Prototype 3 is public and followed",  :public => true,  :user=>user2,       :uid => "dcce27c124e309b9a22c753e70cf48d8aca2c1dd101e4131d3f40d28" , :authentication_token =>"OK"
dev4=         Device.create  :id=>4, :name =>  "Prototype 4 is public",               :public => true,  :user=>user2,       :uid => "dcce27c124e309b9a22c753e70cf48d8aca2c1dd101e4131d3f40d29" , :authentication_token =>"OK"
dev5=         Device.create  :id=>5, :name =>  "Prototype 5 is private",              :public => false,  :user=>user2,       :uid => "dcce27c124e309b9a22c753e70cf48d8aca2c1dd101e4131d3f40d25" , :authentication_token =>"OK"

user1.follow!(dev3)






