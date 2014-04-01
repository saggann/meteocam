class Meteocam.Views.Sidebar extends Backbone.View

  el :                    "#sidebar"
  template:               JST['navigation/sidebar']
  no_device_item:         JST['devices/sidebar_no_device_item']
  
  initialize: ->
    Meteocam.collections.devices.on('reset', @render, this)
    
    
  render: ->
    $(@el).html(@template())
    Meteocam.collections.devices.each(@appendSidebarDeviceItem)
    
    if Meteocam.collections.devices.length  == 0
         $('#sidebar-devices-items').append( @no_device_item() )
         
    this
    

   
  # Append a device item to sidebar devices menu item
  appendSidebarDeviceItem: (device) ->
    
    # Create view for device item
    view = new Meteocam.Views.DevicesSidebarItem(model: device)
    
    # Append the view render to the sidebar
    $('#sidebar-devices-items').append(view.render().el)
    

