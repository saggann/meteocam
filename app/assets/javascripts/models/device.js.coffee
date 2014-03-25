class Meteocam.Models.Device extends Backbone.Model

  idAttribute: 'id'
   
  # Url du modele 
  url: -> 
    "/api/v1/devices/" + @id
    
    
    
  # Get last weather update
  getLastWeather: ->
    new Meteocam.Models.Weather @get("main")
        
  # Get last location fix
  getLastLocation: ->
     new Meteocam.Models.Location @get("coords")

  # Get last image
  getLastImage: ->
     new Meteocam.Models.CameraImage @get("image") 