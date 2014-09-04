$ ->
  $('#posts').imagesLoaded ->
    $('#posts').masonry
      itemSelector: '.box'
      isFitWidth: true