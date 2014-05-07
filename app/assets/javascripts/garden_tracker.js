$(function(){
	$.scrollTo('.today', {
		offset: -220
	});

	// hide the future mask when near the top of the page.
	$(window).scroll(function () {
		if($(window).scrollTop() <= 5){
			$('#future-mask').fadeOut();
		} else {
			$('#future-mask').fadeIn();
		}
	});

	$( ".task-form-row #followup-button" ).click(function() {
	  $(this).hide();
    $('.task-form-row .hidden-fields').show();
    return false;
	});

	$(".edit_garden_task input[type=checkbox]").click(function() {
		$(this).parent('form').submit();
		$(this).closest('.garden-task-row').find('.completed-message').toggle(this.checked);
	});
});



