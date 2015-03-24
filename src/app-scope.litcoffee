App Scope
=========

Define functions and variables with application-level scope. These are only 
visible to code defined in ‘/src/’. 




State the version, licence and author
-------------------------------------

Begin with a comment-block which will be preserved after compilation. 

    ###! Chee 0.0.3 // MIT licence // chee.richplastow.com // Rich Plastow //###




Define variables
----------------

#### `chees`
An array which will contain references to all `Chee` (and subclass) instances. 
The `constructor()` of each `Chee` instance records its index as `@i`:  
`@i = (chees.push @) - 1`

    chees = []


#### `integerTest`, @todo more
These objects can be used as the fourth element of a `rule`, before being 
passed to `validate()`. 

    integerTest =
      toString: -> 'integer test'
      test: (v) -> 0 == v % 1




Define helper functions
-----------------------

#### `log()`
A handy shortcut for `console.log()`. 

    log = console.log.bind console # http://stackoverflow.com/a/12945064




#### `toType()`
To detect the difference between 'null', 'array', 'regexp' and 'object' types, 
we use [Angus Croll’s one-liner](http://goo.gl/WlpBEx) instead of JavaScript’s 
familiar `typeof` operator.

    toType = (x) ->
      ({}).toString.call(x).match(/\s([a-z|A-Z]+)/)[1].toLowerCase()




#### `validate()`
Checks whether an object’s keys and values conform to a given set of rules. 

    validate = (subject, rules) ->

      if 'object' != toType subject
        return ["`subject` is type '#{toType subject}' not 'object'"]

Step through each `rule` in the `rules` array. Every `rule` must contain four 
elements:
- `key  <string> ` Specifies the key to be tested
- `mand <boolean>` Whether the key is mandatory
- `type <string> ` The expected result when `toType()` is called on the value
- `test <regexp> ` Regular expression to test the value (converted to a string) 
against. Alternatively, an object like `integerTest` can be used. 

      errors = []
      for rule in rules
        [key,mand,type,test] = rule
        value = subject[key]
        if undefined == value
          if mand then errors.push "Key '#{key}' is mandatory" else continue
        else if type != toType value
          errors.push "Key '#{key}' is type '#{toType value}' not '#{type}'"
        else if ! test.test value
          errors.push "Key '#{key}' fails #{test.toString()}"

Return `undefined` for a valid object, or else an array of error messages. 

      if errors.length then errors




