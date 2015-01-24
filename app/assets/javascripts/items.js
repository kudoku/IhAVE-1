$(function() {
	$('#item_is_out').change(function() {
		// alert('hi');
		if($('#item_is_out').prop('checked')) {
			// alert('checked');
			$('.record-form').show();
		}
		else {
			// alert('unchecked');
			$('.record-form').hide();
		}
	});

	$('.date').datepicker({
		dateFormat: 'yy-mm-dd'
	});

	$("#myTags").tagit();
});