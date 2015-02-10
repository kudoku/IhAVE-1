
$(function() {

	alert('returned');

	$('.return-button-index').bind("click", function() {
		console.log('return index');
		$(this).replaceWith("<%= j link_to 'Lend out this item', location_item_path(@item.location_id, @item.id, btn: 'lend'), class: 'btn btn-primary btn-xs lend-button-index', remote: true %>");
	});

	$(".modal-body").empty().append("<%= j render partial: 'show_item', locals: {using_modal: true} %>");

	$('.lend-button').bind("click", function() {
		alert('lending');
		$(this).replaceWith("<%= j render partial: 'is_out_form' %>");
		$('.date').datepicker({
			dateFormat: 'yy-mm-dd'
		});
	});

});


