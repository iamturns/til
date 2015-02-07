Coffeescript class variable & function types
============================================

Recommended

```
class Example

  classVar = 1 #Regular class variable
  @classVar = 1 #Instance class variable
  classVar: 1 #Prototype class variable

  functionName: -> #Prototype function
  @functionName: -> #Instance function

    functionVar = 1 #Regular variable
    @functionVar = 1 #Instance variable

```

Full results

```
class Example
  varTest: 1 #Example.prototype.varTest = 1;
  @varTest: 1 #Example.varTest = 1;
  varTest = 1 #varTest1 = 1;
  @varTest = 1 #Example.varTest = 1;

  constructor: ->
    varTest: 1 #({varTest: 1});
    @varTest: 1 #Does not compile
    varTest = 1 #varTest = 1;
    @varTest = 1 #this.varTest = 1;

  functionName: -> #Example.prototype.functionName = function() {
  @functionName: -> #Example.functionName = function() {
  functionName = -> #functionName = function() {
  @functionName = -> #Example.functionName = function() {
```
