

alert('returned');
$(".modal-body").empty().append("<%= j render partial: 'show_item', locals: {using_modal: true} %>");


	$('#lend-button').bind("click", function() {
		alert('lending');
		$(this).replaceWith("<%= j render partial: 'is_out_form' %>");
		$('.date').datepicker({
			dateFormat: 'yy-mm-dd'
		});
	});


