json.array! @weathers do |weather|

		json.temp 	 	 weather.temperature 	 
		json.pressure  	 weather.pressure	 
		json.time		 weather.timestamp.to_i*1000	
 

end

