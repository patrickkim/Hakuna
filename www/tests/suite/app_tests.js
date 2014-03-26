(function() {
  describe("App.Views.ApplicationView", function() {
    beforeEach(function() {
      this.application = new App.Models.Application();
      return this.view = new App.Views.ApplicationView({
        application: this.application
      });
    });
    it("exists", function() {
      return expect(this.view).to.exist;
    });
    return describe("#cart", function() {
      beforeEach(function() {
        return this.cart_view_stub = sinon.stub(App.Views, "CartView").returns({
          leave: function() {}
        });
      });
      afterEach(function() {
        return this.cart_view_stub.restore();
      });
      it("listens to application changes on cart", function() {
        this.application.set({
          cart: true
        });
        return expect(this.cart_view_stub.called).to.be.ok;
      });
      return it("doesn't show if cart is falsy", function() {
        this.application.set({
          cart: false
        });
        return expect(this.cart_view_stub.called).not.to.be.ok;
      });
    });
  });

}).call(this);

(function() {
  describe("App.Views.CartView", function() {
    beforeEach(function() {
      this.application = new App.Models.Application();
      return this.view = new App.Views.CartView({
        application: this.application
      });
    });
    return it("exists", function() {
      return expect(this.view).to.exist;
    });
  });

}).call(this);

(function() {
  describe("App.Views.HeaderView", function() {
    beforeEach(function() {
      this.application = new App.Models.Application();
      return this.view = new App.Views.HeaderView({
        application: this.application
      });
    });
    it("exists", function() {
      return expect(this.view).to.exist;
    });
    return it("parallax scrolls on application scroll event ", function() {
      var spy_on_parallax;
      spy_on_parallax = sinon.stub(this.view, "parallax_scroll");
      this.application.on("scroll", spy_on_parallax);
      this.application.trigger("scroll");
      this.application.trigger("scroll");
      return expect(spy_on_parallax.callCount).to.equal(2);
    });
  });

}).call(this);

(function() {
  describe("more advanced test examples", function() {
    beforeEach(function() {
      return this.pot_of_tea = {
        tea: ['oolong', 'earl grey', 'chai']
      };
    });
    it("a pot of tea should exist", function() {
      var apot_of_tea;
      apot_of_tea = {
        tea: ['oolong', 'earl grey', 'chai']
      };
      console.log("running a test!");
      return this.pot_of_tea.should.exist;
    });
    it("there should be 3 teas in the pot", function() {
      var tea_mix;
      tea_mix = this.pot_of_tea.tea;
      return tea_mix.length.should.equal(3);
    });
    return it("oolong should be the first tea.", function() {
      var first_tea;
      return first_tea = _(this.pot_of_tea.tea).first();
    });
  });

}).call(this);
