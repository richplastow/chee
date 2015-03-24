Chee
====

The base class for more specialized `Chee` subclasses. 




Define the `Chee` class
-----------------------

    class Chee
      I: 'Chee'
      toString: -> "[object #{@I}]"




Define the constructor
----------------------

      constructor: (opt={}) ->

Record this instance in the app-scope `chees` array, and get the index, `i`. 

        @i = (chees.push @) - 1

Get the position from `opt`, or set to the origin by default. 

        @x = opt.x || 0
        @y = opt.y || 0
        @z = opt.z || 0

Get the size from `opt`, or set to 1x1x1 by default. 

        @w = opt.w || 1
        @h = opt.h || 1
        @d = opt.d || 1



