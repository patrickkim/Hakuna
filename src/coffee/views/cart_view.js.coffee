class App.Views.CartView extends Backbone.View
  id: "cart"
  template: JST["cart"]

  initialize: (options ={}) ->
    @application = options.application
    @render()

  leave: ->
    @application.set("cart", false)
    @remove()

  render: ->
    @$el.html @template()
    this
