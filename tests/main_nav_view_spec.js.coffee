describe "App.Views.MainNavView", ->
  beforeEach ->
    @application = new App.Models.Application()
    @view = new App.Views.MainNavView(application: @application)

  it "exists", ->
    expect(@view).to.exist
