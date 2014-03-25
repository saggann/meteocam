class Meteocam.Views.WeatherSummary extends Backbone.View

  
  template:               JST['weathers/summary_table']
  el:                     "#weather-summary-table"

  
  render: ->
    $(@el).html(@template(weather : @model))
    this
    
