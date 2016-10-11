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
//= require twitter/bootstrap
//= require froala_editor.min.js
//= require languages/es.js

function showAlert(alert_type, msg) {
    $("#messages").parent().prepend(
        '<div class="alert alert-'+alert_type+' alert-dismissable">' +
        '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;' +
        '</button>' +
        msg +
        '</div>');

    setTimeout(function(){
        $(".alert-dismissable").fadeOut('slow',function(){
            this.remove;
        })
    },2000);

}
//= require_tree .