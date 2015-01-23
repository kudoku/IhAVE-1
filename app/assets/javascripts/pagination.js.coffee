jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_locations_url = $('#infinite-scrolling .pagination .next a').attr('href')

      if more_locations_url && $(window).scrollTop() > $(document).height() - $(window).height() - 30
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..."/>')
        $.getScript more_locations_url, ->
      return
  return





