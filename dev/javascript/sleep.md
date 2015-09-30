Javascript sleep
================

Only handy for testing FPS meters are working

```
let millis = 100;
var date = new Date();
var curDate = null;
do { curDate = new Date(); }
while(curDate-date < millis);
```
