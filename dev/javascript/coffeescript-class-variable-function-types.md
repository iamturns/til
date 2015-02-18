Coffeescript class variable & function types
============================================

Recommended

```
window.ClassExample = class Example

  classVar: 1 # Instance variable. Recommended. Accessed within class via `@classVar` and `instance.classVar`
  @classVar = 1 # Prototype variable. Only accessed from outside via `window.ClassExample.classVar`
  classVar = 1 # Regular variable. Only accessed within scope via `classVar`

  functionName: -> # Instance function. Recommended. Accessed within class via `@functionName()` and `instance.functionName`
  @functionName: -> # Prototype function. Only accessed from outside via `window.ClassExample.functionName`

    @functionVar = 1 # Instance variable. Recommended. Accessed within class via `@classVar` and `instance.classVar`
    functionVar = 1 # Regular variable. Only accessed within scope via `functionVar`

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
