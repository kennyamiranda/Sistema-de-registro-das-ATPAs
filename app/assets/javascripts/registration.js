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

$(document).ready(function() {

  $('#form_senha').hide();
  $('#form_principal').show();
  $('#senha_button').show();
  $('#cancelar_button').show();
  $('#voltar').hide();

  $('.senha_button button').click( function() {
    $('#form_senha').show();
    $('#form_principal').hide();
    $('#senha_button').hide();
    $('#cancelar_button').hide();
    $('#voltar').show();
  });

  $('#voltar').click( function() {
    $('#form_senha').hide();
    $('#form_principal').show();
    $('#senha_button').show();
    $('#cancelar_button').show();
    $('#voltar').hide();
  });
});
