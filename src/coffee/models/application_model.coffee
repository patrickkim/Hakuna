class App.Models.Application extends Backbone.Model
  @mixin App.Mixins.Timers

  initialize: ->
    console.log "new Applicatio Model to store state!"
    # @wait 600, -> console.log "Tada!"
    @test()