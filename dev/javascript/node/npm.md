NPM
===

Dependencies
------------

- `dependencies`
  - List of packages required to run
  - Installed with `npm install` from directory that contains `package.json`
  - Installed with `npm install [[package]]` from any other directory
- `devDependencies`
  - List of packages required to develop (eg: unit testing, JS transpilation, minification, etc)
  - Installed with `npm install` from directory that contains `package.json`
    - Unless you pass the `--production` flag
  - NOT installed with `npm install [[package]]`
    - Unless you pass in the `--dev` flag
- `bundledDependencies`
  - List of packages that are bundled within module
  - Useful when want to use a third party library that doesn't come from npm, or has been modified

Scripts
-------

Best explained with an example

`package.json`;

```
"scripts": {
    "postinstall": "bower install",

    "prestart": "npm install",
    "start": "http-server -a 0.0.0.0 -p 8000",
    
    "preupdate-webdriver": "npm install",
    "update-webdriver": "webdriver-manager update"
}
```

```
npm install
npm start
npm run update-webdriver
```
