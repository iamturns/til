Jquery public & private methods with namespacing
================================================

Call public method: `jQuery.publicMethodExample()`

```
(function($) {

  $.publicMethodExample = function() {
      privateMethodExample();
  }

  function privateMethodExample() {
      //...
  }

})(jQuery);
```

With a namespace, call public method: `jQuery.namespace.publicMethodExample()`

```
(function($) {

  $.namespace = {}
  $.namespace.publicMethodExample = function() {
    privateMethodExample();
  }

  //Alternative method (personal preference choice)
  $.extend({
    namespace: {
      publicMethodExample: function() {
        privateMethodExample();
      }
    }
  });

  function privateMethodExample() {
    //...
  }

})(jQuery);
```
