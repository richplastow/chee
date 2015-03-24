`Chee` Constructor Usage
========================

Run passing unit tests on the `Chee` constructor. 


    test.section "`Chee` Constructor Usage, No `opt` argument"

    test.is [

      "Class is a function"
      'function'
      -> Chee

      -> new Chee

      "Instance is an object"
      'object'
      (c) -> c

    ]

    test.equal [

      "Class has no properties"
      0
      (c) -> Object.keys(Chee).length

      "Instance has 7 properties"
      7
      (c) -> Object.keys(c).length

      "Instance `toString()` as expected"
      '[object Chee]'
      (c) -> c.toString()

      "Index `i` of first `Chee`"
      0
      (c) -> c.i

      "Index `i` of second `Chee`"
      1
      -> (new Chee).i

      "Default position"
      '0 0 0'
      (c) -> "#{c.x} #{c.y} #{c.z}"

      "Default size"
      '1 1 1'
      (c) -> "#{c.w} #{c.h} #{c.d}"

    ]

    test.is [

      "Default position and size are numbers"
      'number'
      (c) -> c.x + c.y + c.z + c.w + c.h + c.d

      "Index `i` is a number"
      'number'
      (c) -> c.i

    ]


    test.section "`Chee` Constructor Usage, Position and Size"

    test.equal [

      "Set the position during instantiation"
      21
      -> c = new Chee({ x:5, y:7, z:9 }); c.x + c.y + c.z

      "Set the size during instantiation"
      14
      -> c = new Chee({ w:2, h:4, d:8 }); c.w + c.h + c.d

      "Instantiate with some position/size defaults"
      8
      -> c = new Chee({ x:2, d:4 }); c.x + c.y + c.z + c.w + c.h + c.d

    ]



