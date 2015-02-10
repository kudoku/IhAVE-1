$(function() {

	$('#lend-button').replaceWith("<%= j render partial: 'is_out_form' %>");
	$('#new_record').validate({

		rules: {
			"record[borrower_name]": { required: true },
			"record[date_due]": { required: true, date: true }
		}
	});
});
