alert('returned');

$(".modal-body").empty().append("<%= j render partial: 'show_item', locals: {using_modal: true} %>");