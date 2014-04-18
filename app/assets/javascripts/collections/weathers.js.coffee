class Meteocam.Collections.Weathers extends Backbone.Collection

  # Collection de fix meteo
  model   : Meteocam.Models.Weather
  device  : null
  range   : "day"
  
  initialize: ( device )->
    @device = device
    
    
  url: ->
    '/api/v1/devices/' + @device.id + '/weathers?range=' + @range
    
  setRange: (r) ->
    @range = r if r in ["hour", "day", "week", "month"]
  
  