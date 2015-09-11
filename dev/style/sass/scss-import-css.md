SCSS import CSS using NPM
=========================

You cannot @import css files into scss :(

Some packages may only provide CSS files, which ruin your SCSS flow

Add this to `package.json` to automatically create the .scss files you need;

```
"scripts": {
  "postinstall": "cp ./node_modules/path/to/file.css ./node_modules/path/to/file.scss"
}
```

Not a great solution, but the best we have until scss allows css import: https://github.com/sass/sass/issues/193
