$(function(){
	$.scrollTo('.today', {
		offset: -220
	});

	// hide the future mask when near the top of the page.
	$(window).scroll(function () {
		if($(window).scrollTop() <= 5){
			$('#future-mask').fadeOut();
		}
		else{
			$('#future-mask').fadeIn();
		}
	});

	$( ".task-form-row #followup-button" ).click(function() {
	  $(this).hide();
    $('.task-form-row .hidden-fields').show();
    return false;
	});
});



