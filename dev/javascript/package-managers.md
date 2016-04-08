Javascript package managers
===========================

Bower
-----

- Downloads files from github repo's, puts them in a directory
- Downloads any listed dependencies
- Throws an error if two packages require different versions of a package - does not download multiple versions of dependencies and work any magic
- That's it, leaves the rest to you. Simple solution.

Browserify
----------

Import node packages in the browser

Bundle up all your dependencies (unlike bower)

```
npm install example
var example = require('example');
browserify main.js -o bundle.js
```

jspm
----

- Uses SystemJS to load modules
  - https://github.com/systemjs/systemjs
  - Loads ES6, AMD, and CommonJS module formats
  - Works with Traceur and Babel
  - ES6 modules loaded using 'es6-module-loader'
    - https://github.com/ModuleLoader/es6-module-loader
- Aims to sit above package managers (including npm)
- Allows text, CSS and JSON into browser
  - Works by adding <link href=""> tag
- Works with both npm and github packages
- No build step!
  - Include jspm main js, a config file, and then files that use ES6, AMD, CommonJS, whatever
  - Config file maps script paths
  - The output CAN be bundled
- Embraced by Angular2 and Aurelia

Webpack
-------

- Similar to Browserify
- Has bigger momentum and community
- Support code splitting
  - Have a main package, and then further pages may request a small additional file
- Lots of plugins, eg: loading ES6, coffeescript, SCSS, CSS, etc
