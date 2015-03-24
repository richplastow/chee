App Scope
=========

Define functions and variables with application-level scope. These are only 
visible to code defined in ‘/src/’. 




State the version, licence and author
-------------------------------------

Begin with a comment-block which will be preserved after compilation. 

    ###! Chee 0.0.2 // MIT licence // chee.richplastow.com // Rich Plastow //###




Define variables
----------------

#### `chees`
An array which will contain references to all `Chee` (and subclass) instances. 
The `constructor()` of each `Chee` instance records its index as `@i`:  
`@i = (chees.push @) - 1`

    chees = []




Define helper functions
-----------------------

#### `log()`
A handy shortcut for `console.log()`. 

    log = console.log.bind console # http://stackoverflow.com/a/12945064




