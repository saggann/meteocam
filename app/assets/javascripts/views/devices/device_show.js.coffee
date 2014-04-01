class Meteocam.Views.DeviceShow extends Backbone.View

  
  el :                    "#content"
  template:               JST['devices/show']
  
  # Subviews
  subv : []
  weathers = null
  
  initialize: ->
    @on 'render', @renderPortlets
        
        
  render: ->
    
    # Create main view
    $(@el).html(@template(device : @model))
    

    # Initialize subviews
    @subv["sum"] =   new Meteocam.Views.SummaryPortlet(  model:@model, weather: @model.getLastWeather() , location: @model.getLastLocation(), parent : $(@el))
    @subv["img"] =   new Meteocam.Views.CameraImagePortlet(     model :   @model.getLastImage(),   parent : $(@el))
    @subv["map"] =   new Meteocam.Views.DeviceMapPortlet( model :  @model,parent : $(@el))
    
    
    @subv["gra"] =   new Meteocam.Views.WeatherGraph( model: new Meteocam.Collections.Weathers(), parent : $(@el))
    

    
    # Trigger a render event
    @trigger 'render'
    this
    

  events: ->
   "click #weather-time-range" : 'updateWeatheGraph'
  
    
  renderPortlets: ->
    
    @subv["sum"].render()
    @subv["img"].render()
    
    @subv["gra"].render()
    @subv["map"].render()
    
    
    @updateWeatheGraph()
         
  
  updateWeatheGraph: (ev) =>
    
    App.blockUI $("#weather-graph-portlet-body") , true
    
    @weathers = new Meteocam.Collections.Weathers(  @model) 
        
    if typeof ev != "undefined"
      @weathers.setRange $(ev.target).text().trim()
      
       
    @weathers.fetch success: =>
      App.unblockUI $("#weather-graph-portlet-body") 
      @subv["gra"].model  =  @weathers
      @subv["gra"].renderGraph()

       
     
