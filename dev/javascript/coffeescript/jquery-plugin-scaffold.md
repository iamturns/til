Coffeescript jQuery plugin scaffold
===================================

```
window.ExampleClass = class ExampleClass
  defaultOptions: {}

  constructor: (@el, @$el, options = {}) ->
    @options = $.extend @defaultOptions, options

# jQuery interface

(($) ->
  $.fn.exampleClass = (options = {}) ->
    return @each () ->
      el = @
      $el = $(el)
      newPluginInstance = new window.ExampleClass(el, $el, options)
      $el.data('exampleClass', newPluginInstance)
)(jQuery)

# Site implementation

(($) ->

  $ ->
    $('element').exampleClass()

    $('element').exampleClass
      optionKey: 'option value'

)(jQuery)
```
