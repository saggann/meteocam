json.id 	@device.id
json.uid 	@device.uid

json.coords do |json|
  json.alt  @device.last_fix.altitude
  json.lon  @device.last_fix.longitude
  json.lat  @device.last_fix.latitude
end

json.main do |json|
	json.temp 	 	@device.last_weather.temperature
	json.pressure  	@device.last_weather.pressure
end

