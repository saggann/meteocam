# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Device.destroy_all
Location.destroy_all
Weather.destroy_all
User.destroy_all
CameraPicture.destroy_all


user =       User.create!   :email => 'toto@toto.com',    :password => 'xxxxxxxx', :password_confirmation => 'xxxxxxxx'

dev3=        Device.create  :name =>  "Prototype",        :uid => "dcce27c124e309b9a22c753e70cf48d8aca2c1dd101e4131d3f40d27" 








