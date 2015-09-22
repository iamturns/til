Javascript modules
==================

A file written with a particular syntax, allowing things (classes, functions, etc) to be exported, and then imported by other modules.

- global
  - `window.namespace` or `this.namespace`
  - Gross
- amd
  - `define(['dep'], function(dep) {})`
  - RequireJS
  - Async
- commonjs
  - `require('dep')`
  - `module.exports`
  - NodeJS / npm
  - Synchronous
- es6
  - `export` and `import`
