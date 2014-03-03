class App.Views.HeaderView extends Backbone.View
  el: "#header"

  initialize: (options ={}) ->
    @application = options.application

    @listenTo @application, "scroll", @parallax_scroll
    @listenTo @application, "resize", @resize_header
    @render()

  render: ->
    @resize_header()
    this

  parallax_scroll: (scroll_amount) =>
    return if scroll_amount < 0 || scroll_amount > 750

    parallax = Math.floor(scroll_amount/-3)
    @$el.css("background-position": "center #{parallax}px")

  resize_header: ->
    window = @_window_size()
    @$el.css(width: window.width, height: window.height)

  _window_size: ->
    { width: $(window).width(), height: $(window).height() }
