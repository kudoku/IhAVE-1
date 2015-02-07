var $masonry_container = $('#masonry_container');
// init
$masonry_container.isotope({
  // options
  itemSelector: '.item-block',
  masonry: {
    columnWidth: 100
  },

  layoutMode: 'masonry'
});