Drupal using latest jquery
==========================

Some scripts require the latest version of jQuery, AND, they use the '$' or 'jQuery' reference - noConflict() mode won't help here

This example should explain it all;

```
scripts[] = js/lib/jquerylatest/jquerylatest.preload.js
scripts[] = js/lib/jquery/1.11.0/jquery.min.js
scripts[] = js/lib/script-using-latest-jquery-1.js
scripts[] = js/lib/script-using-latest-jquery-2.js
scripts[] = js/lib/script-using-latest-jquery-3.js
scripts[] = js/lib/jquerylatest/jquerylatest.postload.js
scripts[] = js/back-to-regular-drupal-jquery.js
```

After postload, scripts will have access to `jQueryLatest` and `$latest`
