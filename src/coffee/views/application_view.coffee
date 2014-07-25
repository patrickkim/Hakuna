class App.Views.ApplicationView extends Backbone.View
  el: "#application"

  initialize: (options ={}) ->
    @application = options.application
    @render()

  render: ->
    @hero_view = new App.Views.HeroView(application: @application, el: @$("#hero"))
    this

  # TODO how hack is a view accessing window...?
  _save_scroll: ->
    @scroll_amt = $(window).scrollTop()

  _apply_scroll: ->
    $(window).scrollTop(@scroll_amt)
    delete @scroll_amt
