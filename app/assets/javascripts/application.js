// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks

$(document).ready(function(){
$('#tipo').hide();
  $('#grupo').change(function(){
    ValidaTipo();
  });
  ValidaTipo();
});

function index_activities_slide() {
  $(".slide1").mouseenter(function(){
    $(".slidedown1").slideDown();
  });

  $(".slide1").mouseleave(function(){
    $(".slidedown1").slideUp();
  });

  $(".slide2").mouseenter(function(){
    $(".slidedown2").slideDown();
  });

  $(".slide2").mouseleave(function(){
    $(".slidedown2").slideUp();
  });

  $(".slide3").mouseenter(function(){
    $(".slidedown3").slideDown();
  });

  $(".slide3").mouseleave(function(){
    $(".slidedown3").slideUp();
  });
}

function ValidaTipo() {
    if($('#grupo').val() == 0 || $('#grupo').val() == 10) {
      $('#tipo').show();
    } else {
      $('#tipo').hide();
    }
}


function div_index_activities() {
}
