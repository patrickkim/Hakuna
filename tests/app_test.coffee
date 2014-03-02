describe "App.Views.HeaderView", ->
  beforeEach ->
    @application = new App.Models.Application()
    @view = new App.Views.HeaderView(application: @application)

  it "exists", ->    
    expect(@view).to.exist

  it "parallax to listen to the application scroll event ", ->
    spy_on_parallax = sinon.stub(@view, "parallax_scroll")

    @application.on "scroll", spy_on_parallax
    @application.trigger("scroll")
    @application.trigger("scroll")

    expect(spy_on_parallax.callCount).to.equal 2
    # stub_parallax.restore()