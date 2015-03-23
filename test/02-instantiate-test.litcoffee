Instantiate `test`
==================

Create an instance of `DoTest`, to add tests to. 

    test = new DoTest


Expose the `DoTest` instance’s `do()` method as a property of `Chee`. This will 
allow tests to be run using `Chee.doTest()`. 

    Chee.doTest = test.do




