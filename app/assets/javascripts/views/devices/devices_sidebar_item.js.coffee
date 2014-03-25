class Meteocam.Views.DevicesSidebarItem extends Backbone.View

  template: JST['devices/sidebar_item']
  tagName: 'li'
  
  render: ->
    $(@el).html(@template(device: @model))
    this
