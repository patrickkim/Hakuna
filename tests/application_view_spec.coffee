describe "App.Views.ApplicationView", ->
  beforeEach ->
    @application = new App.Models.Application()
    @view = new App.Views.ApplicationView(application: @application)

  it "exists", ->
    expect(@view).to.exist

  describe "#cart", ->
    beforeEach ->
      @cart_view_stub = sinon.stub(App.Views, "CartView").returns({ leave: -> })

    afterEach ->
      @cart_view_stub.restore()

    it "listens to application changes on cart", ->
      @application.set(cart: true)
      expect(@cart_view_stub.called).to.be.ok

    it "doesn't show if cart is falsy", ->
      @application.set(cart: false)
      expect(@cart_view_stub.called).not.to.be.ok
