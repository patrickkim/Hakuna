$ ->
  x = -> $('<h2>Express Coffee Template 1.4</h2>').prependTo('body')
  setTimeout x, 500

  test = 100
  console.log "working!"
  console.log "really with watch too?", test


  $(window).scroll ->
    parallax = $(document).scrollTop()/-3
    # $(".header").css "background-position": "center " + parallax + "px"
    console.log "amount to parallax", parallax

