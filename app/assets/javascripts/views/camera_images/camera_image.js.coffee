class Meteocam.Views.CameraImage extends Backbone.View

  
  el :                    "#camera-image"
  template:               JST['images/camera']
  
  

  render: ->
    $(@el).html(@template(img : @model))
    this