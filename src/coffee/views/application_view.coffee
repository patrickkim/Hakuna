class App.Views.ApplicationView extends Backbone.View
  el: "#application"

  initialize: (options ={}) ->
    @application = options.application

    @listenTo @application, "change:cart", @toggle_cart
    @render()

  render: ->
    @hero_view = new App.Views.HeroView(application: @application, el: @$("#hero"))
    @nav_view = new App.Views.MainNavView(application: @application, el: @$("#main-nav"))
    this

  toggle_cart: ->
    if @application.get("cart") then @_show_cart() else @_remove_cart()

  # TODO how hack is a view accessing window...?
  _save_scroll: ->
    @scroll_amt = $(window).scrollTop()

  _apply_scroll: ->
    $(window).scrollTop(@scroll_amt)
    delete @scroll_amt

  _show_cart: ->
    return if @cart_view
    @_save_scroll()
    @cart_view = new App.Views.CartView(application: @application)
    $("body").append @cart_view.el

  _remove_cart: ->
    return unless @cart_view
    @cart_view.leave()
    @_apply_scroll()
    delete @cart_view
