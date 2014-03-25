json.id 	device.id
json.name	device.name

json.image do |json|
	if device.last_picture
		json.img_url	   device.last_picture.image.url
		json.medium_url  device.last_picture.image.medium.url
		json.thumb_url   device.last_picture.image.thumb.url
		json.time	     device.last_picture.timestamp.to_i*1000
	end
end


json.coords do |json|
	if device.last_location 
 		 json.alt   device.last_location.altitude 		 
 		 json.lon   device.last_location.longitude 	 
  		 json.lat   device.last_location.latitude 	 
  		 json.time	device.last_location.timestamp.to_i*1000		 
	end

end


json.main do |json|
	if device.last_weather 
		json.temp 	 	device.last_weather.temperature 	 
		json.pressure  	device.last_weather.pressure	 
		json.time		device.last_weather.timestamp.to_i*1000		
	end

end