// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require parsley
//= require moment
//= require bootstrap-datetimepicker
//= require validations
//= require_tree .
$(document).ready(function(){
	$('#radio_button').change(function(){
		console.log(this);
		console.log($(this).find('#appointment_is_new_customer_false')[0].checked);
		console.log($('.customer'))
		if($(this).find('#appointment_is_new_customer_false')[0].checked){
			$('.old_customer').show();
			$('.customer').addClass('new_customer');
		}else
		{
			$('form-group, .new_customer').removeClass('new_customer');
			$('.old_customer').hide();
		}
	});
});

$(document).ready(function(){
	$(function () {
	  $('#datetimepicker1').datetimepicker({
	  sideBySide: true
	  });
	});
});