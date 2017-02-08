// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function(){
    var $search_field = $('#location_search_service_location');
    var $search_button = $('#search_locations');
    var $errors = $('.errors');

    $search_button.on('click', function(e){
        var search_value = $search_field.val();
        if(search_value === ''){
            $errors.html('<p>Please specify a location!</p>');
            e.preventDefault();
        }else{
            $errors.html('')
        }

    });
});



