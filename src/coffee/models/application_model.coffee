class App.Models.Application extends Backbone.Model
  @mixin App.Mixins.Timers

  initialize: ->
    @_set_defaults()

  _set_defaults: ->
    @set(window_size: {height: 0, width: 0})
