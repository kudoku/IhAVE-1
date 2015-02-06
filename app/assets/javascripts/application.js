// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs

//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/mouse
//= require jquery-ui/position

//= require jquery-ui/effect-blind
//= require jquery-ui/effect-highlight

//= require jquery-ui/datepicker
//= require jquery-ui/autocomplete


//= require jquery.infinite-pages
//= require tag-it
//= require isotope.min.js
//= require_tree .


$('#myTab a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
})

var $masonry_container = $('#masonry_container');
// init
$masonry_container.isotope({
  // options
  itemSelector: '.item-block',
  masonry: {
    columnWidth: 100,
    gutter: 5,
    isFitWidth: true
  },

  layoutMode: 'masonry'
});



//$('#myTab a[href="#locations"]').tab('show') // Select tab by name
//$('#myTab a:first').tab('show') // Select first tab
//$('#myTab a:last').tab('show') // Select last tab
//$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)