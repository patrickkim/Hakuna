class App.Views.MainNavView extends Backbone.View

  DELTA: 15

  initialize: (options ={}) ->
    @application = options.application
    @previous_scroll = 0

    @listenTo @application, "scroll",  @toggle_scroll
    @listenTo @application, "scroll",  @toggle_static
    @render()

  render: ->
    this

  toggle_scroll: (scroll) =>
    return if scroll < 0 || @_scroll_delta(scroll) < @DELTA
    if scroll > @previous_scroll then @_hide() else @_show()
    @previous_scroll = scroll

  toggle_static: (scroll) ->
    @$el.toggleClass "static", scroll <= 30

  _show: ->
    @$el.removeClass("hidden").addClass "visible"

  _hide: ->
    @$el.removeClass("visible").addClass "hidden"

  _scroll_delta: (scroll_amt) ->
    Math.abs(@previous_scroll - scroll_amt)
