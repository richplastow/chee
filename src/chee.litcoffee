Chee
====

The base class for more specialized `Chee` subclasses. 




Define the `Chee` class
-----------------------

    class Chee
      I: 'Chee'
      toString: -> "[object #{@I}]"




Define valid `opt` @todo is this the best place for these rules?
------------------

      rules =
        opt: []

      for key in ['x', 'y', 'z']
        rules.opt.push [ key, 0, 'number', lowWholeTest ]

      for key in ['w', 'h', 'd']
        rules.opt.push [ key, 0, 'number', lowNaturalTest ]




Define the constructor
----------------------

      constructor: (opt={}) ->

Validate `opt` before recording this instance in `chees`. 

        errors = validate opt, rules.opt
        if errors then throw new Error 'Invalid `opt`:\n  ' + errors.join '\n  '

Record this instance in the app-scope `chees` array, and get the index, `i`. 

        @i = (chees.push @) - 1

Get the position from `opt`, or set to the origin by default. 

        @x = opt.x || 0
        @y = opt.y || 0
        @z = opt.z || 0

Get the size from `opt`, or set to 1&times;1&times;1 by default. 

        @w = opt.w || 1
        @h = opt.h || 1
        @d = opt.d || 1



