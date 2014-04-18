class Meteocam.Models.CameraImage extends Backbone.Model

  
   defaults: 
      image_url : "http://placehold.it/500x300"


   get_image: ->
      if @.get('remote_image_url')
        @.get('remote_image_url')
      else
        @.get('image_url')