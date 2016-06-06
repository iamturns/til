Zone.js
=======

- Zones are in Dart. Zone.js is a port.
- Similar to 'thread locals' in Java.
- Written and maintained by the Angular team.
- A zone is an "execution context".
- Zone.js makes async tasks run in the same 'zone' as they were registered. Eg: `setTimeout`, `addEventListener`, `onClick`.
- It also provides hooks that execute on events, including async events. Eg: can provide a full stacktrace of async events.
- Used in Angular 2 for dirty checking, so there is no need for `$rootScope.apply()` anymore.

Example
-------

```javascript
startTimer()
a()
setTimeout(b, 0)
setTimeout(c, 0)
d()
endTimer()
```

The time of b() and c() will be missed from the timer.

Solved with Zone.js;

```javascript
var timedZone = zone.fork({
  beforeTask: function() {
    startTimer();  
  },
  afterTask: function() {
    endTimer();  
  },
})

timedZone.run(function() {
  a();
  setTimeout(b, 0)
  setTimeout(c, 0)
  d()
});
```
