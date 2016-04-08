Coffeescript class variable & function types
============================================

Recommended

```
window.ClassExample = class Example

  classVar: 1 # Recommended. Accessed within class via `@classVar` and `instance.classVar`
  classVar = 1 # Regular variable, accessed within scope via `classVar`
  @classVar: 1 # Accessed from outside via `window.ClassExample.classVar`

  functionName: -> # Recommended. Accessed within class via `@functionName()` and `instance.functionName`
  functionName = -> # Private function. Accessed by `functionName`.
  @functionName: -> # Accessed from outside via `window.ClassExample.functionName`

```

Full results

```
class Example
  varTest: 1 #Example.prototype.varTest = 1;
  varTest = 1 #varTest1 = 1;
  @varTest: 1 #Example.varTest = 1;
  @varTest = 1 #Example.varTest = 1;

  constructor: ->
    varTest: 1 #({varTest: 1});
    varTest = 1 #varTest = 1;
    @varTest: 1 #Does not compile
    @varTest = 1 #this.varTest = 1;

  functionName: -> #Example.prototype.functionName = function() {
  functionName = -> #functionName = function() {
  @functionName: -> #Example.functionName = function() {
  @functionName = -> #Example.functionName = function() {
```
