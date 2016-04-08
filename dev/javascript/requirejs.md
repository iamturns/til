RequireJS
=========

Shims
-----

Configure dependencies, exports and custom init code

Necessary for scripts that do not support AMD/RequireJS

Shim config example:

```
requirejs.config({
  shim: {
    'scriptname': {
      deps: ['scriptdep1', 'scriptdep2'],
      exports: 'ValueToExportViaAMD',
      init: function () {
        //...
      }
    }
  }
});
```

Or the shim config value can just be an array of dependencies:

```
requirejs.config({
  shim: {
    'jquery.colorize': ['jquery'],
    'jquery.scroll': ['jquery'],
    'backbone.layoutmanager': ['backbone']
  }
});
```
