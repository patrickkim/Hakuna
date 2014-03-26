if (!window.JST) {
  window.JST = {};
}
window.JST["base"] = function(__obj) {
  var _safe = function(value) {
    if (typeof value === 'undefined' && value == null)
      value = '';
    var result = new String(value);
    result.ecoSafe = true;
    return result;
  };
  return (function() {
    var __out = [], __self = this, _print = function(value) {
      if (typeof value !== 'undefined' && value != null)
        __out.push(value.ecoSafe ? value : __self.escape(value));
    }, _capture = function(callback) {
      var out = __out, result;
      __out = [];
      callback.call(this);
      result = __out.join('');
      __out = out;
      return _safe(result);
    };
    (function() {
      _print(_safe('<h1>Ace of Base</h1>\n'));
    
    }).call(this);
    
    return __out.join('');
  }).call((function() {
    var obj = {
      escape: function(value) {
        return ('' + value)
          .replace(/&/g, '&amp;')
          .replace(/</g, '&lt;')
          .replace(/>/g, '&gt;')
          .replace(/"/g, '&quot;');
      },
      safe: _safe
    }, key;
    for (key in __obj) obj[key] = __obj[key];
    return obj;
  })());
};

if (!window.JST) {
  window.JST = {};
}
window.JST["cart"] = function(__obj) {
  var _safe = function(value) {
    if (typeof value === 'undefined' && value == null)
      value = '';
    var result = new String(value);
    result.ecoSafe = true;
    return result;
  };
  return (function() {
    var __out = [], __self = this, _print = function(value) {
      if (typeof value !== 'undefined' && value != null)
        __out.push(value.ecoSafe ? value : __self.escape(value));
    }, _capture = function(callback) {
      var out = __out, result;
      __out = [];
      callback.call(this);
      result = __out.join('');
      __out = out;
      return _safe(result);
    };
    (function() {
      _print(_safe('<div class="container">\n  <p>\n    ate last fall, at the start of the dry season in the new country called South Sudan, a soldier of fortune named Pierre Booyse led a de-mining team westward from the capital city, Juba, intending to spend weeks unarmed in the remote and dangerous bush. Booyse, 49, is an easygoing Afrikaner and ordnance expert who was once the youngest colonel in the South African Army. He has a full gray beard that makes him look quite unlike a military man. After leaving the army he opened a bedding store in Cape Town, where he became the leading Sealy Posturepedic dealer, then opened a sports bar too, before selling both businesses in order to salvage his marriage and provide a better environment for his young daughter. The daughter flourished, the marriage did not. Booyse returned to the work he knew best, and took the first of his private military jobs, traveling to post-Qaddafi Libya to spend six months surveying the munitions depots there, particularly for surface-to-air missiles. It was dangerous work in a chaotic place, as was the next contract, which took him into the conflict zones of eastern Congo. From there he came here to South Sudan to do minefield mapping and battlefield-ordnance disposal for G4S, a far-flung security company engaged by the local United Nations mission to handle these tasks.\n  </p>\n  <p>\nG4S is based near London and is traded on the stock exchange there. Though it remains generally unknown to the public, it has operations in 120 countries and more than 620,000 employees. In recent years it has become the third-largest private employer in the world, after Walmart and the Taiwanese manufacturing conglomerate Foxconn. The fact that such a huge private entity is a security company is a symptom of our times. Most G4S employees are lowly guards, but a growing number are military specialists dispatched by the company into what are delicately known as “complex environments” to take on jobs that national armies lack the skill or the will to do. Booyse, for one, did not dwell on the larger meaning. For him, the company amounted to a few expatriates in the Juba headquarters compound, a six-month contract at $10,000 a month, and some tangible fieldwork to be done. He felt he was getting too old to be living in tents and mucking around in the dirt, but he liked G4S and believed, however wearily, in the job. As he set out for the west, his team consisted of seven men—four de-miners, a driver, a community-liaison officer, and a medic. The medic was a Zimbabwean. All the others were soldiers of the Sudan People’s Liberation Army, the S.P.L.A., now seconded to G4S, which paid them well by local standards—about $250 a month. At their disposal they had two old Land Cruisers, one of them configured as an ambulance with a stretcher in the back.\n  </p>\n\n</div>\n'));
    
    }).call(this);
    
    return __out.join('');
  }).call((function() {
    var obj = {
      escape: function(value) {
        return ('' + value)
          .replace(/&/g, '&amp;')
          .replace(/</g, '&lt;')
          .replace(/>/g, '&gt;')
          .replace(/"/g, '&quot;');
      },
      safe: _safe
    }, key;
    for (key in __obj) obj[key] = __obj[key];
    return obj;
  })());
};
