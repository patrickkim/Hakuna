App.Mixins.Timers =
  wait: (ms, func) -> setTimeout func, ms
  repeat: (ms, func) -> setInterval func, ms
  clear_wait: (id) -> clearTimeout(id)
  clear_repeat: (id) -> clearInterval(id)
  test: -> console.log "mixins work!"