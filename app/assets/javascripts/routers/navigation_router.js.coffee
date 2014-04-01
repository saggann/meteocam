class Meteocam.Routers.Navigation extends Backbone.Router

   routes:
    # Navigation routes
    '!dashboard'    : 'dashboard'
   
    # Render devices
    '!devices'      : 'devices'
    '!devices/:id'  : 'getDevice'
    
    # Defaults
    ''              : 'dashboard'
    '*notFound'     : 'pageNotFound'

        
   # show dashboard      
   dashboard: ->
      @clear()
      Meteocam.views.content = new Meteocam.Views.Dashboard().render()
     
   # Show all devices
   devices: ->
      @clear()
      Meteocam.views.content = new Meteocam.Views.Devices().render()

   # Show one device
   getDevice: (id)->
      @clear()
      Meteocam.views.content = new Meteocam.Views.DeviceShow(model : Meteocam.collections.devices.get(id)).render()
      Meteocam.views.content.delegateEvents()
  
   # Default page not found
   pageNotFound: ->
      alert "page not found"
      Meteocam.views.content = new Meteocam.Views.Dashboard().render()
      

   # Remove curent content view data and listeners
   clear: ->
      Meteocam.views.content.undelegateEvents()
      $(Meteocam.views.content.el).removeData().unbind()
