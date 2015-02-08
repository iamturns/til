Jquery page load events
=======================

```
/**
 * Run code when HTML document is loaded and DOM is ready
 * Images and other external files may not be loaded yet
 */
$(document).ready(function() {
    //...
});

/**
 * Run code when entire page is loaded, including all frames, objects and images
 */
$(window).load(function() {
    //...
});
```