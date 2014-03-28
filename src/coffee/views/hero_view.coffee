class App.Views.HeroView extends Backbone.View

  initialize: (options ={}) ->
    @application = options.application

    @listenTo @application, "scroll", @parallax_scroll
    @listenTo @application, "change:window_size", @resize_header
    @render()

  render: ->
    @resize_header()
    this

  parallax_scroll: (scroll_amount) =>
    return if scroll_amount < 0 || scroll_amount > @_window_size().height

    console.log "scroll123"
    parallax = Math.floor(scroll_amount/-3)
    @$("#cover").css("background-position": "center #{parallax}px")

  resize_header: ->
    @$el.css(height: @_window_size().height - 60)

  _window_size: ->
    @application.get("window_size")
