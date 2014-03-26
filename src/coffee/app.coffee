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

  _setup_models: ->
    @application = new App.Models.Application()
    @_set_window_dimensions()
    @_listen_to_window()

  _setup_views: ->
    @application_view = new App.Views.ApplicationView(application: @application)

  _listen_to_window: ->
    $(window).scroll( => _.throttle(@_trigger_scroll(), 300))
    $(window).resize( => @_trigger_resize())

  _set_window_dimensions: ->
    @application.set(
      window_size:
        width: $(window).width()
        height: $(window).height())

  _trigger_resize: ->
    @_set_window_dimensions()

  _trigger_scroll: ->
    scroll_amount = $(window).scrollTop()
    @application.trigger "scroll", scroll_amount
