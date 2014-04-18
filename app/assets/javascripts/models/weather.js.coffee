class Meteocam.Models.Weather extends Backbone.Model

  
   defaults: 
    
      # Temperature in  kelvin
      temp:         null
      
      # Pressure in Pa
      pressure:     null
    
  
   getTemperatureInCelsius: =>
     if @get("temp")
       Math.floor( 100* (@get("temp") - 273.15))/100 + "°C "
     else
       "No Data"


   getPressureInhPa: =>
     if @get("pressure")
       @get('pressure')/100 + "hPa "
     else
       "No Data"