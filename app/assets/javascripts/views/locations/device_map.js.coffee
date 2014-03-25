class Meteocam.Views.LocateDeviceMap extends Backbone.View

  
  el :                    "#devicemap"

  render: ->
    
    loc = @model.getLastLocation()
    position = new google.maps.LatLng loc.get('lat'), loc.get('lon')
    
    mapOptions =
      zoom: 14
      center: position
      mapTypeId: google.maps.MapTypeId.TERRAIN

    map = new google.maps.Map(document.getElementById("devicemap"), mapOptions)
    marker = new google.maps.Marker
         position: position
         map: map
         title:"camera"
   

    this
    

