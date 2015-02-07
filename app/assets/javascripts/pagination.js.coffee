jQuery ->
  if $('.infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_locations_url = $('.infinite-scrolling .pagination .next a').attr('href')

      if more_locations_url && $(window).scrollTop() > $(document).height() - $(window).height() - 30
        $('.pagination').html('Loading... <img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..."/>')
        $.getScript more_locations_url, ->
      return
  return

  if $('.items-index-infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_items_index_url = $('.items-index-infinite-scrolling .pagination .next a').attr('href')

      if more_items_index_url && $(window).scrollTop() > $(document).height() - $(window).height() - 30
        $('.pagination').html('Loading... <img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..."/>')
        $.getScript more_items_index_url, ->
      return
  return

  if $('.user-items-infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_user_items_url = $('.user-items-infinite-scrolling .pagination .next a').attr('href')

      if more_user_items_url && $(window).scrollTop() > $(document).height() - $(window).height() - 30
        $('.pagination').html('Loading... <img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..."/>')
        $.getScript more_user_items_url, ->
      return
  return

  if $('.checked-out-infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_checked_out_url = $('.checked-out-infinite-scrolling .pagination .next a').attr('href')

      if more_checked_out_url && $(window).scrollTop() > $(document).height() - $(window).height() - 30
        $('.pagination').html('Loading... <img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..."/>')
        $.getScript more_checked_out_url, ->
      return
  return

  if $('.overdue-infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_overdue_url = $('.overdue-infinite-scrolling .pagination .next a').attr('href')

      if more_overdue_url && $(window).scrollTop() > $(document).height() - $(window).height() - 30
        $('.pagination').html('Loading... <img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..."/>')
        $.getScript more_overdue_url, ->
      return
  return





