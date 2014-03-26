
json.array! @weathers do |weather|

 json.partial! 'weather', weather: weather

end
