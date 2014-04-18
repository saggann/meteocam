class Meteocam.Views.SummaryPortlet extends Meteocam.Views.Portlet

  
  template:               JST['portlets/summary_portlet']

  
  render: ->

    @parent.append(@template(device:@model, weather : @weather, location: @location))
    this
    
  