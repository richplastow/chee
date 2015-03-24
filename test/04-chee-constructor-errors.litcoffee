`Chee` Constructor Errors
=========================

Ensure that the `Chee` constructor throw exceptions as expected. 


    test.section "`Chee` Constructor Errors, Invalid `opt` Argument"

    test.throws [

      "A number"
      "Invalid `opt`:\n  `subject` is type 'number' not 'object'"
      -> new Chee 1

      #@todo more of these

    ]



