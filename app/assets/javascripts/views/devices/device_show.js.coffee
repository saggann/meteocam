class Meteocam.Views.DeviceShow extends Backbone.View

  
  el :                    "#content"
  template:               JST['devices/show']
  
  # Subviews
  subv : []
  weathers = null
  
  initialize: ->
    @on 'render', @renderSubViews
        
        
  render: ->
    
    # Create main view
    $(@el).append(@template(device : @model))
    

    # Initialize subviews
    @subv["img"] =   new Meteocam.Views.CameraImage(     model :  @model.getLastImage())
    @subv["map"] =   new Meteocam.Views.LocateDeviceMap( model :  @model)
    @subv["sum"] =   new Meteocam.Views.WeatherSummary(  model:   @model.getLastWeather() )
    @subv["loc"] =   new Meteocam.Views.LocationSummary( model:   @model.getLastLocation() )
    @subv["gra"] =   new Meteocam.Views.WeatherGraph( model: new Meteocam.Collections.Weathers() )
    

    
    # Trigger a render event
    @trigger 'render'
    this
    

  events: ->
   "click #weather-time-range" : 'updateWeatheGraph'
  
    
  renderSubViews: ->
    
    @subv["img"].render()
    @subv["map"].render()
    @subv["sum"].render()
    @subv["loc"].render()
    @updateWeatheGraph()
         
  
  updateWeatheGraph: (ev) =>
    
  
    
    @weathers = new Meteocam.Collections.Weathers(  @model) 
        
    if typeof ev != "undefined"
      @weathers.setRange($("#weather-time-range .active").text().trim())
       
    @weathers.fetch success: =>
      @subv["gra"].model  =  @weathers
      @subv["gra"].render()

       
     
