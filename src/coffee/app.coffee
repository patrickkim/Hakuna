$ ->
  console.log "coffee test!"
  
  $(window).scroll ->
    parallax = $(document).scrollTop()/-3
    # $(".header").css "background-position": "center " + parallax + "px"
    console.log "amount to parallax", parallax

