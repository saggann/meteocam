class Meteocam.Views.DeviceMapPortlet extends Meteocam.Views.Portlet

  
  template:               JST['portlets/device_map_portlet']

  render: ->
    
    loc = @model.getLastLocation()
    
    @parent.append(@template(location : loc))
    
     
    
    
    position = new google.maps.LatLng loc.get('lat'), loc.get('lon')
    
    mapOptions =
      zoom: 12
      center: position
      mapTypeId: google.maps.MapTypeId.TERRAIN

    map = new google.maps.Map(document.getElementById("devicemap"), mapOptions)
    
    info  = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">' + @model.get("name") + '</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Latitude : </b>  ' + loc.get('lat') + ' </p>'+
      '<p><b>Longitude : </b> ' + loc.get('lon') + '</p>'+
      '<p><b>Altitude : </b> ' + loc.get('alt') + '</p>'+
      '</div>'+
      '</div>';
      
    infowindow = new google.maps.InfoWindow
        content: info#"<b>Lat :</b>" + loc.get('lat') + "<br> <b>Lon :</b> " + loc.get('lon')
        maxWidth: 200
    
    
    iconBase = 'https://maps.google.com/mapfiles/kml/pal4/';

    
    marker = new google.maps.Marker
         position: position
         map: map
         title:"camera"
         icon: iconBase + 'icon45.png'

    
    weatherLayer = new google.maps.weather.WeatherLayer
         temperatureUnits: google.maps.weather.TemperatureUnit.CELSIUS
    weatherLayer.setMap map

    cloudLayer = new google.maps.weather.CloudLayer
    cloudLayer.setMap map 



    google.maps.event.addListener marker, "click", ->
          infowindow.open map, marker
    
    
    this
    

