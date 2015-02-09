Javascript event on escape key
==============================

Coffeescript:

```
$(document).on 'keyup', (e) =>
    e = e || window.event;
    isEscapeKey = (e.keyCode == 27)
    return unless isEscapeKey
    # ...
```

Javascript:

```
$(document).on('keyup', function(e) {
  e = e || window.event;
  var isEscapeKey = e.keyCode === 27;
  if (!isEscapeKey) {
    return;
  }
  // ...
});
```
