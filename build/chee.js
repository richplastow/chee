// Generated by CoffeeScript 1.8.0

/*! Chee 0.0.4 // MIT licence // chee.richplastow.com // Rich Plastow // */

(function() {
  var Chee, chees, integerTest, log, lowNaturalTest, lowWholeTest, naturalTest, toType, validate, wholeTest;

  chees = [];

  integerTest = {
    toString: function() {
      return 'the integer test';
    },
    test: function(v) {
      return 0 === v % 1 && Infinity !== v && -Infinity !== v;
    }
  };

  naturalTest = {
    toString: function() {
      return 'the natural-number test';
    },
    test: function(v) {
      return 0 === v % 1 && Infinity !== v && -Infinity !== v && v > 0;
    }
  };

  wholeTest = {
    toString: function() {
      return 'the whole-number test';
    },
    test: function(v) {
      return 0 === v % 1 && Infinity !== v && -Infinity !== v && v >= 0;
    }
  };

  lowNaturalTest = {
    toString: function() {
      return 'the low-natural-number test';
    },
    test: function(v) {
      return (100 > v && v > -100) && naturalTest.test(v);
    }
  };

  lowWholeTest = {
    toString: function() {
      return 'the low-whole-number test';
    },
    test: function(v) {
      return (100 > v && v > -100) && wholeTest.test(v);
    }
  };

  log = console.log.bind(console);

  toType = function(x) {
    return {}.toString.call(x).match(/\s([a-z|A-Z]+)/)[1].toLowerCase();
  };

  validate = function(subject, rules) {
    var errors, key, mand, rule, test, type, value, _i, _len;
    if ('object' !== toType(subject)) {
      return ["`subject` is type '" + (toType(subject)) + "' not 'object'"];
    }
    errors = [];
    for (_i = 0, _len = rules.length; _i < _len; _i++) {
      rule = rules[_i];
      key = rule[0], mand = rule[1], type = rule[2], test = rule[3];
      value = subject[key];
      if (void 0 === value) {
        if (mand) {
          errors.push("Key '" + key + "' is mandatory");
        } else {
          continue;
        }
      } else if (type !== toType(value)) {
        errors.push("Key '" + key + "' is type '" + (toType(value)) + "' not '" + type + "'");
      } else if (!test.test(value)) {
        errors.push("Key '" + key + "' fails " + (test.toString()));
      }
    }
    if (errors.length) {
      return errors;
    }
  };

  Chee = (function() {
    var key, rules, _i, _j, _len, _len1, _ref, _ref1;

    Chee.prototype.I = 'Chee';

    Chee.prototype.toString = function() {
      return "[object " + this.I + "]";
    };

    rules = {
      opt: []
    };

    _ref = ['x', 'y', 'z'];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      key = _ref[_i];
      rules.opt.push([key, 0, 'number', lowWholeTest]);
    }

    _ref1 = ['w', 'h', 'd'];
    for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
      key = _ref1[_j];
      rules.opt.push([key, 0, 'number', lowNaturalTest]);
    }

    function Chee(opt) {
      var errors;
      if (opt == null) {
        opt = {};
      }
      errors = validate(opt, rules.opt);
      if (errors) {
        throw new Error('Invalid `opt`:\n  ' + errors.join('\n  '));
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
