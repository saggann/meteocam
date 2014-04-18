
json.array! @weathers do |weather|

 #json.partial! 'weather', weather: weather
  json.id           weather.id
  json.temp         weather.temperature   
  json.pressure     weather.pressure  
  json.time         weather.timestamp.to_i*1000  


end
