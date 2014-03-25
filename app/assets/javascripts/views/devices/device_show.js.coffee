class Meteocam.Views.DeviceShow extends Backbone.View

  
  el :                    "#content"
  template:               JST['devices/show']
  
  
  initialize: ->
    @on 'render', @renderSubViews
  
  render: ->
    $(@el).html(@template(device : @model))
    @trigger 'render'
    this
    

  renderSubViews: ->
    
     new Meteocam.Views.CameraImage(     model :  @model.getLastImage()).render()
     new Meteocam.Views.LocateDeviceMap( model :  @model).render()
     new Meteocam.Views.WeatherSummary(  model:   @model.getLastWeather() ).render()
     new Meteocam.Views.LocationSummary( model:   @model.getLastLocation() ).render()
     
     # Render weather history after history fetch
     history = new Meteocam.Collections.Weathers(  @model)
     history.fetch success: ->
        new Meteocam.Views.WeatherGraph( model: history).render()
