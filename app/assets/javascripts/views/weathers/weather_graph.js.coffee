class Meteocam.Views.WeatherGraph extends Backbone.View

  
  template:               JST['weathers/weather_graph']
  el:                     "#weather-graph"
  temp_unit : "°C"
  pressure_unit : "hPa"
    
  render: ->
    temp = []
    pressure = []
    

    for weather in @model.models
      temp.push     [weather.get("time"), weather.get("temp") - 273.15]
      pressure.push [weather.get("time"), weather.get("pressure")/100.0]
     
    plot = $.plot($("#weather-graph"), [
      {
        data: temp
        label: "Temperature"
        yaxis: 1
     
      }
      {
        data: pressure
        label: "Pressure"
        yaxis: 2
      }
    ],
      series:
        lines:
          show: true
          lineWidth: 2
          fill: false
          fillColor:
            colors: [ 
                  { opacity: 0.05  }
                  { opacity: 0.01  }
            ]
    
        points:
          show: true
    
    
      grid:
        hoverable: true
        clickable: true
        tickColor: "#eee"
        borderWidth: 0
    
      colors: [
        "#d12610"
        "#37b7f3"
        "#52e136"
      ]
      
      xaxis:
        mode: "time"
        ticks: 11
        tickDecimals: 0 
      
      yaxis:
          ticks: 11
          tickDecimals: 0
                                     
        
      yaxes:
        [
          {
            position: "left"
            axisLabel: "Temperature " + @temp_unit
            axisLabelUseCanvas: true
            min : -10
            max : 40
  
          }
          {
            position: "right"
            axisLabel: "Pressure " + @pressure_unit
            axisLabelUseCanvas: true
            min : 900
            max : 1100
          }
        ]
    )
    
    previousPoint = null
    
    $("#weather-graph").bind "plothover", (event, pos, item) =>
      if item
        unless previousPoint is item.dataIndex
          previousPoint = item.dataIndex
          $("#tooltip").remove()
          y = item.datapoint[1].toFixed(2)
          @showTooltip item.pageX, item.pageY, item.series.label +  " = " + y
      else
        $("#tooltip").remove()
        previousPoint = null
      return
    this
    


  showTooltip: (x, y, contents) ->
                    $('<div id="tooltip">' + contents + '</div>').css({
                            position: 'absolute'
                            display: 'none'
                            top: y + 5
                            left: x + 15
                            border: '1px solid #333'
                            padding: '4px'
                            color: '#fff'
                            'border-radius': '3px'
                            'background-color': '#333'
                            opacity: 0.80
                        }).appendTo("body").fadeIn(200)
            
                