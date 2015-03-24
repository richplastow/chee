`Chee` Constructor Errors
=========================

Ensure that the `Chee` constructor throws exceptions as expected. 


    test.section "`Chee` Constructor Errors, Invalid `opt` Argument"

    test.throws [

      -> (new Chee).i


      "`opt` is a number"
      "Invalid `opt`:\n  `subject` is type 'number' not 'object'"
      -> new Chee 1

      "`opt` is a Date object"
      "Invalid `opt`:\n  `subject` is type 'date' not 'object'"
      -> new Chee new Date

    ]


    test.section "`Chee` Constructor Errors, Position and Size"

    test.throws [

      "Instantiated y-position is null"
      "Invalid `opt`:\n  Key 'y' is type 'null' not 'number'"
      -> new Chee { x:4, y:null, z:0 }

      "All instantiated positions are invalid"
      "Invalid `opt`:\n  Key 'x' is type 'string' not 'number'" +
                    "\n  Key 'y' fails the low-whole-number test" +
                    "\n  Key 'z' fails the low-whole-number test"
      -> new Chee { x:'3', y:-54, z:5.1 }

      "Instantiated h-size is zero"
      "Invalid `opt`:\n  Key 'h' fails the low-natural-number test"
      -> new Chee { w:3, h:0, d:1 }

      "All instantiated positions are invalid"
      "Invalid `opt`:\n  Key 'w' is type 'regexp' not 'number'" +
                    "\n  Key 'h' fails the low-natural-number test" +
                    "\n  Key 'd' fails the low-natural-number test"
      -> new Chee { w:/3/, h:100, d:5.1 }

    ]


    test.section "Invalid Instances Are Not Recorded"

    test.equal [

      "Invalid `Chee` instances were not pushed to `chees`"
      true
      (currIndex) -> currIndex + 1 == (new Chee).i

    ]



