describe "App.Views.CartView", ->
  beforeEach ->
    @application = new App.Models.Application()
    @view = new App.Views.CartView(application: @application)

  it "exists", ->
    expect(@view).to.exist
