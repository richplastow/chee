// Generated by CoffeeScript 1.8.0

/*! Chee 0.0.2 // MIT licence // chee.richplastow.com // Rich Plastow // */

(function() {
  var Chee, chees, log;

  chees = [];

  log = console.log.bind(console);

  Chee = (function() {
    Chee.prototype.I = 'Chee';

    Chee.prototype.toString = function() {
      return "[object " + this.I + "]";
    };

    function Chee(opt) {
      if (opt == null) {
        opt = {};
      }
      this.i = (chees.push(this)) - 1;
      this.x = opt.x || 0;
      this.y = opt.y || 0;
      this.z = opt.z || 0;
      this.w = opt.w || 1;
      this.h = opt.h || 1;
      this.d = opt.d || 1;
    }

    return Chee;

  })();

  window.Chee = Chee;

}).call(this);
