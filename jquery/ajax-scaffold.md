Jquery AJAX scaffold
====================

The most common methods:

```
$.ajax(
  {
    url: 'example/',
    type: 'POST',
    data: {
      key: 'value'
    }
  }
)
.done(function(data) {
  //...
})
.fail(function(jqXHR, textStatus, errorThrown) {
  //...
})
.always(function() {
  //...
});
```
