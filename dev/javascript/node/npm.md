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

Added within `scripts` section of `package.json`;

```
"scripts": {
    "example": "command",
}
```

```
npm run example
```

To see all scripts available;

```
npm run
```

### Shortcuts

The following are the same as running `npm run [[shortcut]]`

- npm test
- npm start
- npm stop

This provides a standard interface

It's also common for scripts to provide;

- npm clean

### Hooks

npm will automatically run any script named pre{{task}} and post{{task}}

Works for some internal commands;
- install
- uninstall
- publish
- update

### Arguments

`npm run {{task}} -- {{args}}`

### Config

All config options are exposed as environment variables prefixed with `npm_package_config_`

    "config": {
      "reporter": "xunit"
    },
    "scripts": {
      "test": "mocha test/ --reporter $npm_package_config_reporter"
    }

Or can be checked within javascript using: `process.env.npm_package_config_reporter`

#### Override

`npm config set {{package name}}:{{config key}} {{value}}`

`npm config delete {{package name}}:{{config key}}`

This can be saved within `~/.npmrc`

Version bumping
---------------

```
npm version patch
npm version minor
npm version major
```

Will commit and tag package, then;

```
git publish
npm publish
```
