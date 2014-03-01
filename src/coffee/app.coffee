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

  initialize: (options) ->
    @_setup_models()
    @_setup_views()
    @_temp_drop_down()

  _setup_models: ->
    @application = new App.Models.Application()
    @_listen_to_scroll()

  _setup_views: ->
    @header_view = new App.Views.HeaderView(application: @application)
    @nav_view = new App.Views.MainNavView(application: @application)

  _listen_to_scroll: ->
    $(window).scroll( => _.throttle(@_trigger_scroll(), 300))

  _trigger_scroll: ->
    scroll_amount = $(window).scrollTop()
    @application.trigger "scroll", scroll_amount

  _temp_drop_down: ->
    $(".drop-down .selector").on "click", ->
      $(".drop-down").toggleClass "visible"

