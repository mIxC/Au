$(function(){

  source = new EventSource('/steps');

  source.onmessage = function(event) {
      var step = JSON.parse(event.data);
      console.log(step);
      $($('.col-xs-4')[step.position]).html(step.symbol);
  }
});