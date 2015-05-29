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
//= require foundation
//= require turbolinks
//= require marked
//= require blocmetrics
//= require_tree .
$(function(){ $(document).foundation(); });

var ready;
ready = function(){

// auto-fadeout alerts
  if ($('.alert-box').length >= 0) {
    setTimeout(function(){
        $('.alert-box .close').click();
      }, 2000);
    }

// wiki preview button
  $('.prev-btn').click(function(){
    var wiki_body = $('#wiki_body').val();
    var title = $('#wiki_title').val();
    var formatted_body = marked(wiki_body)
    $('#wiki-preview h3').html(title);
    $('#preview-body').html(formatted_body);
  });

// send events to blocmetrics api
  $('#free a').click(function(){
    blocmetrics.report('sign_up_click');
  });

};
$(document).ready(ready);
$(document).on('page:load', ready);