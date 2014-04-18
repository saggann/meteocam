class Meteocam.Views.DeviceMapPortlet extends Meteocam.Views.Portlet

  
  template:               JST['portlets/device_map_portlet']

  render: ->
    
    loc = @model.getLastLocation()
    
    @parent.append(@template(location : loc))
    
     
    
    
    position = new google.maps.LatLng loc.get('lat'), loc.get('lon')
    
    mapOptions =
      zoom: 14
      center: position
      mapTypeId: google.maps.MapTypeId.TERRAIN

    map = new google.maps.Map(document.getElementById("devicemap"), mapOptions)
    
    info  = '<div id="content">'+
      '<div id="bodyContent">'+
      '<p><b>Device : ' + @model.get("name") + '</b></p>'
      '<p><b>Latitude : </b>'  + loc.get('lat') +  '</br>' +
      '<b>Longitude : </b>' + loc.get('lon') +  '</br>' +
      '<b>Altitude : </b> ' + loc.get('alt') +  '</a>' +
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

    google.maps.event.addListener marker, "click", ->
          infowindow.open map, marker
    
    
    this
    

