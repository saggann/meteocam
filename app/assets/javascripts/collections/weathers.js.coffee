class Meteocam.Collections.Weathers extends Backbone.Collection

  # Collection de fix meteo
  model   : Meteocam.Models.Weather
  device  : null
  
  initialize: ( device )->
    @device = device
    
    
  url: ->
    '/api/v1/devices/' + @device.id + '/weathers'
  
