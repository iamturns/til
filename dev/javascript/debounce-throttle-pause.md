Javascript debounce / throttle
==============================

Throttle will call function at beginning, and then again every Xms if the event is still firing.

Debounce will wait Xms has elapsed until function is called.


- https://github.com/cowboy/jquery-throttle-debounce/
- http://underscorejs.org/#debounce
- http://mootools.net/more/docs/1.5.1/Class/Events.Pseudos#Pseudos:throttle
- http://mootools.net/more/docs/1.5.1/Class/Events.Pseudos#Pseudos:pause

Custom
------

```
resize_timeout = null
resize_throttle = 250

$(window).on 'resize', ->
  clearTimeout(resize_timeout)
  window.resize_timeout = setTimeout(->
    do_something_here()
  , resize_throttle);
```
