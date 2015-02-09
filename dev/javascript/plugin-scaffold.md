Jquery plugin scaffold
======================

Simple:

```
(function ($) {

    var privateValue = 'shh',
        publicValue = 'hello everyone';

    var privateFunction = function() {
        //...
    };

    var publicFunction = function() {
        //...
    };

    $.extend({
        pluginName: {
            publicValue: publicValue,
            publicFunction: publicFunction
        }
    });

})(jQuery);
```

Advanced:

```
/**
 * $.examplePlugin.globalPublicFunction()
 *
 * $('selector').examplePlugin({
 *     optionKey: 'optionValue'
 * });
 *
 * pluginInstance = $('selector').data('examplePlugin');
 *
 * $('selector')
 *     .data('examplePlugin')
 *     .instancePublicFunction()
 *     .instancePublicFunction();
 */
(function($) {

    var PLUGIN_NAME = 'examplePlugin',
        instanceDefaultOptions = {
            key: 'value'
        },
        instances = [];

    var globalApi = {
        instances: instances,
        globalPublicFunction: globalPublicFunction
    };

    function pluginInstance(el, options) {

        var options = $.extend({}, instanceDefaultOptions, options),
            $el = $(el);

        init();

        var instanceApi = {
            el: el,
            $el: $el,
            instancePublicFunction: instancePublicFunction
        };
        return instanceApi;

        function init() {
            instancePrivateFunction();
        }

        function instancePublicFunction() {
            instancePrivateFunction();
            return instanceApi; //chaining
        }

        function instancePrivateFunction()
        {
            //...
            return instanceApi; //chaining
        }

    }

    function globalPublicFunction()
    {
        globalPrivateFunction();
        return globalApi; //chaining
    }

    function globalPrivateFunction()
    {
        //...
        return globalApi; //chaining
    }

    //jQuery namespace
    $[PLUGIN_NAME] = globalApi;

    //jQuery prototype
    //Stores plugin instance within element.data(PLUGIN_NAME) and $[PLUGIN_NAME].instances
    $.fn[PLUGIN_NAME] = function(options) {
        return this.each(function() {
            var $this = $(this);
            if ($this.data(PLUGIN_NAME) === undefined) {
                var newPluginInstance = new pluginInstance(this, options);
                $this.data(PLUGIN_NAME, newPluginInstance);
                instances.push(newPluginInstance);
            }
        });
    };

})(jQuery);
```

Coffeescript:

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