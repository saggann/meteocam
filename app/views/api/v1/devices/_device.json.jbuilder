json.id 	device.id
json.name	device.name

json.image do |json|
	if device.camera_picture
		json.image_url	        device.camera_picture.image.url
		json.time	            device.camera_picture.timestamp.to_i*1000
		json.remote_image_url device.camera_picture.remote_picture_url
	end
end


json.coords do |json|
	if device.location 
 		 json.alt   device.location.altitude 		 
 		 json.lon   device.location.longitude 	 
  		 json.lat   device.location.latitude 	 
  		 json.time	device.location.timestamp.to_i*1000		 
	end

end


json.main do |json|
	if device.last_weather 
		json.temp 	 	    device.last_weather.temperature 	 
		json.pressure  	  device.last_weather.pressure	 
		json.time		     device.last_weather.timestamp.to_i*1000		
	end

end