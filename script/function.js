$(document).ready(function(){
	$('#categoryToggle').click(function(event){
		event.preventDefault();
		$('#category').slideToggle();
	});		
	$(window).scroll(function () {
	  if ($(document).scrollTop() < 350) {
	    $('#nav').removeClass('tiny');
	  } else {
	    $('#nav').addClass('tiny');
	  }
	});	
	$('#tag').click(function(event){
		event.preventDefault();
		$('#tagCloud').slideToggle();
	});		
	$(function () {

		// scroll body to 0px on click
		$('.gtt').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
	});
});