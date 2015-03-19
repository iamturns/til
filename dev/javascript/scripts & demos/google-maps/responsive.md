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

You can also adjust the zoom based on the browser width;

```
function getZoomLevel()
{
    return Math.round(Math.log($(window).width() / 512)) + 1;
}

google.maps.event.addDomListener(
  window,
  'resize',
  function() {
    var zoomLevel = getZoomLevel();
    map.setZoom(zoomLevel);
  }
);
```
