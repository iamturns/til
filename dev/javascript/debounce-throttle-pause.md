Javascript debounce / throttle / pause
======================================

To avoid firing too many requests for noisy events

Quick example implementation below;

```
resize_timeout = null
resize_throttle = 250

$(window).on 'resize', ->
  clearTimeout(resize_timeout)
  window.resize_timeout = setTimeout(->
    do_something_here()
  , resize_throttle);
```

If you want something a little better;

- https://github.com/cowboy/jquery-throttle-debounce/
- http://underscorejs.org/#debounce
- http://mootools.net/more/docs/1.5.1/Class/Events.Pseudos#Pseudos:throttle
- http://mootools.net/more/docs/1.5.1/Class/Events.Pseudos#Pseudos:pause
