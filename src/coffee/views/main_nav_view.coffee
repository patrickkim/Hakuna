class App.Views.MainNavView extends Backbone.View

  THRESHOLD:
    delta: 15
    header: 600

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
    if @_cart() then @_show() else @_hide()

  toggle_scroll: (scroll_amt) =>
    return if @_cart()
    return if @_scroll_delta(scroll_amt) < @THRESHOLD["delta"]

    if scroll_amt > @previous_scroll || scroll_amt < @THRESHOLD["header"]
      @_hide()
    else
      @_show()

    @previous_scroll = scroll_amt

  _cart: ->
    @application.get("cart")

  _show: ->
    @$el.removeClass("hidden").addClass "visible"

  _hide: ->
    @$el.removeClass("visible").addClass "hidden"

  _scroll_delta: (scroll_amt) ->
    Math.abs(@previous_scroll - scroll_amt)
