Google maps - show world
========================

```
var bounds = new google.maps.LatLngBounds(
  new google.maps.LatLng(85, -180), //top left corner of entire map
  new google.maps.LatLng(-85, 180) //bottom right corner of entire map
);

map.fitBounds(bounds);
map.setCenter(bounds.getCenter());
```
