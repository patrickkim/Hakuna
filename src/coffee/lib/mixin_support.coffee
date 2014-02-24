Function::mixin = (module) ->
  _.extend this.prototype, module
  if @::initialize && module.included
    @::_wrapped_initialize = @::initialize
    @::initialize = ->
      @_wrapped_initialize.apply(@, arguments)
      @included() 

  return this