class App.Views.ApplicationView extends Backbone.View
  @mixin App.Mixins.Timers

  el: "#application"

  initialize: (options ={}) ->
    @application = options.application
    @render()

  render: ->
    @hero_view = new App.Views.HeroView(application: @application, el: @$("#hero"))
    @nav_view = new App.Views.MainNavView(application: @application, el: @$("#main-nav"))
    @_start_slideshow()
    this

  # TODO how hack is a view accessing window...?
  _save_scroll: ->
    @scroll_amt = $(window).scrollTop()

  _apply_scroll: ->
    $(window).scrollTop(@scroll_amt)
    delete @scroll_amt

  _start_slideshow: ->
    @repeat 3e3, => @_next_slide()

  _next_slide: ->
    @$(".news").first().appendTo("#in-the-news")
