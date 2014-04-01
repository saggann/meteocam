class Meteocam.Views.Portlet extends Backbone.View
 
  parent : $("document.body")
 
  # Extends constructor to pick  the parent options ( needed since backbone 1.1.0)
  initialize: (options) ->
    _.extend this, _.pick(options, "parent", "location", "weather")
  

    
  render: ->
    @parent.append(@template(img : @model))
    this