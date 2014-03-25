class Meteocam.Views.LocationSummary extends Backbone.View

  
  template:               JST['locations/summary_table']
  el:                     "#location-summary-table"

  
  render: ->
    $(@el).html(@template(location : @model))
    this
    
