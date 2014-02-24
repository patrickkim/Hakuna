# ie doesnt have console
window.console ?= { log: -> }

# Define namespaced App
window.App ?= {}

window.App =
  Mixins: {}
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Utilities: {}
  Emitter: _.extend({}, Backbone.Events)

  initialize: (options) ->
    console.log "Hello agea"
    @_listen_to_scroll()
    window.App.model = new App.Models.Application()

  _listen_to_scroll: ->
    $(window).scroll( => _.throttle(@_parallax_header(), 250))

  _parallax_header: ->
    scroll_amount = $(document).scrollTop()
    return if scroll_amount < 0 || scroll_amount > 750

    parallax = Math.floor(scroll_amount/-3)
    $("#header").css("background-position": "center #{parallax}px")
    console.log "amount to parallax", parallax

