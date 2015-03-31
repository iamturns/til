Coffeescript: Cache function result as local variable
=====================================================

```
class ExampleClass
  _something: undefined

  usage: ->
    something = @get_something()

  get_something: ->
    if not @_something?
      @_something = @_get_something()
    @_something

  _get_something: ->
    //expensive operation

```
