# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

make_chart = (sample_name, sample_data) ->
  upcased_sample_name = sample_name.toUpperCase()

  new Highcharts.Chart({ 
    chart: { renderTo: "#{sample_name}-chart" },
    title: { text: "#{upcased_sample_name} over time" },
    xAxis: { type: 'datetime' },
    yAxis: {
      title: { text: upcased_sample_name }
    },
    series: [{ 
      name: upcased_sample_name,
      pointInterval: gon.point_interval,
      pointStart: gon.point_start,
      data: sample_data
    }]
  });

$ ->
  make_chart("tsh", gon.tsh_samples)
  make_chart("t3", gon.t3_samples)
  make_chart("t4", gon.t4_samples)
