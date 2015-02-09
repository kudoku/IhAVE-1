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
//= require jquery.validate.min
//= require tag-it
//= require isotope.min.js
//= require imagesloaded.pkgd.min.js
//= require_tree .

$(function() {

  $('#myTab a').click(function (e) {
      e.preventDefault()
      $(this).tab('show')
  })



  var $masonry_container = $('#loc-masonry_container').imagesLoaded( function() {
    // init
    $masonry_container.isotope({
      // options
      itemSelector: '.location-block',
      masonry: {
        columnWidth: 100,
        gutter: 10,
        isFitWidth: true
      },

      layoutMode: 'masonry'
    });
  });

    var $masonry_container = $('#masonry_container').imagesLoaded( function() {
    // init
    $masonry_container.isotope({
      // options
      itemSelector: '.item-block',
      masonry: {
        columnWidth: 25,
        gutter: 10,
        isFitWidth: true
      },

      layoutMode: 'masonry'
    });
  });

  var $user_items = $('#user_items').imagesLoaded( function() {
    // init
    $user_items.isotope({
      // options
      itemSelector: '.user-item-block',
      masonry: {
        columnWidth: 25,
        gutter: 10,
        isFitWidth: true
      },

      layoutMode: 'masonry'
    });
  });

  var $checked_out_items = $('#checked_out_items').imagesLoaded( function() {
    // init
    $checked_out_items.isotope({
      // options
      itemSelector: '.over-due-item-block',
      masonry: {
        columnWidth: 25,
        gutter: 10,
        isFitWidth: true
      },

      layoutMode: 'masonry'
    });
  });

  var $overdue_items = $('#overdue_items').imagesLoaded( function() {
    // init
    $overdue_items.isotope({
      // options
      itemSelector: '.checked-out-item',
      masonry: {
        columnWidth: 25,
        gutter: 10,
        isFitWidth: true
      },

      layoutMode: 'masonry'
    });
  });

  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    // $masonry_container.isotope('reLayout');
    // $user_items.isotope('reLayout');
    // $checked_out_items.isotope('reLayout');
    // $overdue_items.isotope('reLayout');
    if(e.target.hash == '#locations') {
      $masonry_container.isotope('layout');
    }    
    if(e.target.hash == '#items') {
      $user_items.isotope('layout');
    }    
    if(e.target.hash == '#messages') {
      $checked_out_items.isotope('layout');
    }    
    if(e.target.hash == '#settings') {
      $overdue_items.isotope('layout');
    }
  });

  // $('.jquerytabs').on("click", function() {
  //   $(window).resize().delay( 800 );
  //   $masonry_container.isotope('reLayout');
  //   $user_items.isotope('reLayout');
  //   $checked_out_items.isotope('reLayout');
  //   $overdue_items.isotope('reLayout');
  // });

});




//$('#myTab a[href="#locations"]').tab('show') // Select tab by name
//$('#myTab a:first').tab('show') // Select first tab
//$('#myTab a:last').tab('show') // Select last tab
//$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)