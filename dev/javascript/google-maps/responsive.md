Responsive google maps
======================

Map centers on window resize

```
var center;

google.maps.event.addDomListener(
  map,
  'idle',
  function() {
    center = map.getCenter();
  }
);

google.maps.event.addDomListener(
  window,
  'resize',
  function() {
    map.setCenter(center);
  }
);
```
