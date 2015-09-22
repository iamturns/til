JSPM
====

Summary available in `package-managers-compared.md`

Setup
-----

Install

```
npm install jspm -g
```

Lock down to version to project, too

```
cd my-project
npm install jspm --save-dev
```

Start

```
jspm init
```

Install packages
----------------

```
jspm install jquery
jspm install npm:lodash-node
jspm install github:components/jquery
jspm install myname=npm:underscore
```

Stored within `package.json` within 'jspm' block

Small registry of popular packages to install by name:

https://github.com/jspm/registry/blob/master/registry.json

Generally, prefer 'npm' style to 'github' style. Github is more of a fallback option for packages not available as npm.

Browser
-------

```
<!doctype html>
<script src="jspm_packages/system.js"></script>
<script src="config.js"></script>
<script>
System.import('lib/main');
</script>
```

@TODO
-----

- http://dailyjs.com/2014/03/20/jspm/
- http://www.joezimjs.com/javascript/simplifying-the-es6-workflow-with-jspm/
- http://javascriptplayground.com/blog/2014/11/js-modules-jspm-systemjs/
- http://ilikekillnerds.com/2015/07/jspm-vs-webpack/
- http://stackoverflow.com/questions/25416813/package-manager-bower-vs-jspm

