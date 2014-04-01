class Meteocam.Views.Dashboard extends Backbone.View

  el :                    "#content"
  template:               JST['navigation/dashboard']
  
  render: ->
    $(@el).html(@template())
    this
    

