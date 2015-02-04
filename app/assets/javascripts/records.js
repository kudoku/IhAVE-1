var $masonry_container = $('#masonry_container');
// init
$masonry_container.isotope({
  // options
  itemSelector: '.item',
  masonry: {
    columnWidth: 100
  },

  layoutMode: 'masonry'
});