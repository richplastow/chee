`Chee` Constructor Usage
========================

Run passing unit tests on the `Chee` constructor. 


    test.section "`Chee` Constructor Usage"

    test.is [

      "Instantiate with no arguments"
      'object'
      -> new Chee

    ]

    test.equal [

      "`toString()` as expected"
      '[object Chee]'
      -> (new Chee).toString()

    ]
