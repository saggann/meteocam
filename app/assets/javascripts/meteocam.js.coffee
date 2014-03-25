window.Meteocam =
  # Classes
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  
  # Instances
  collections: {}
  views: {}
  models:{}
  
  initialize: -> 
  
    
    # Create devices collection
    @collections.devices = new Meteocam.Collections.Devices()

    # Create Sidebar View
    @views.sidebar = new Meteocam.Views.Sidebar()
    
    # Create the Page Content view : Dashboard
    @views.content = new Meteocam.Views.Dashboard()
    
    
    # Render main sidebar view
    @views.sidebar.render()
    
    
    
    # Fetch data
    @collections.devices.fetch 
                reset:  true
                
                success: ->           
                   # Start Navigation router one data is ok
                   navigation = new Meteocam.Routers.Navigation()
                   Backbone.history.start()  
                
                error: ->
                  alert "cannot load data  from server !"  

                  
                  
  
$(document).ready ->
  Meteocam.initialize()
  
