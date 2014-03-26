class App.Views.MainNavView extends Backbone.View

  DELTA: 15
  events:
    "click #nav-cart": "toggle_cart"

  initialize: (options ={}) ->
    @application = options.application
    @previous_scroll = 0

    @listenTo @application, "change:cart", @toggle_show
    @listenTo @application, "scroll",  @toggle_scroll
    @render()

  render: ->
    this

  toggle_cart: ->
    # TODO this shouldnt be a boolean but actual cart
    @application.set(cart: !@_cart())
    false

  toggle_show: ->
    if @_cart() then @_show()

  toggle_scroll: (scroll) =>
    return if @_cart() || scroll <= 0 || @_scroll_delta(scroll) < @DELTA
    if scroll > @previous_scroll then @_hide() else @_show()
    @previous_scroll = scroll

  _cart: ->
    @application.get("cart")

  _show: ->
    @$el.removeClass("hidden").addClass "visible"

  _hide: ->
    @$el.removeClass("visible").addClass "hidden"

  _scroll_delta: (scroll_amt) ->
    Math.abs(@previous_scroll - scroll_amt)
