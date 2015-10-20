// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require turbolinks
//= require_tree .

//------ Countdown Clock -------//


  var deadline = 'October 24 2015 23:59:59 GMT-04:00';

  function getTimeRemaining(endtime){

  var t = Date.parse(endtime) - Date.parse(new Date());
  var seconds = Math.floor( (t/1000) % 60 );
  var minutes = Math.floor( (t/1000/60) % 60 );
  var hours = Math.floor( (t/(1000*60*60)) % 24 );
  var days = Math.floor( t/(1000*60*60*24) );
      
    return {
      'total': t,
      'days': days,
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds
    };
  }

  //------ Displaying the Clock in HTML/CSS -------//

  function initializeClock(endtime){
    var clock = document.getElementById('clockdiv');
    function updateClock(){
        var t = getTimeRemaining(endtime);

        var daysSpan = clock.querySelector('.days');
        var hoursSpan = clock.querySelector('.hours');
        var minutesSpan = clock.querySelector('.minutes');
        var secondsSpan = ('0' + t.seconds).slice(-2);

        clock.innerHTML = 'Days: ' + t.days + 
                          ' | Hours: '+ t.hours + 
                          ' | Minutes: ' + t.minutes +
                          ' | Seconds: ' + t.seconds;
        if(t.total<=0){
          clearInterval(timeinterval);
        }
      }

      updateClock(); // run function once at first to avoid delay
      var timeinterval = setInterval(updateClock,1000);
  }

  //------ Displaying the Clock in HTML/CSS -------//

//------ Countdown Clock -------//
 