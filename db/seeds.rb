# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Device.delete_all
Fix.delete_all
Weather.delete_all


dev =       Device.create(uid: "d74d488752650f23e6394cdd8540325be42be9b87134e798ed7047e0df5c1b68")

fix =       Fix.create( device_id: dev.id, timestamp: Time.now, longitude: -1.2514124, latitude: 45.015454, altitude: 80.00)

weather =   Weather.create( device_id: dev.id, timestamp: Time.now, temperature: 275.3, pressure: 10254.0)
