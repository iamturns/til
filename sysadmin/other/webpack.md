Webpack
=======

Summary available in `package-managers-compared.md`

Loaders
-------

```
require("loader-prefix!package-name");
require("coffee!./example.coffee");
```

List of loaders: http://webpack.github.io/docs/list-of-loaders.html

require
-------

Prefix within `require` statement, separated by `!`

```
require("jade!./template.jade");
require("!style!css!less!bootstrap/less/bootstrap.less");
require("./loader!./dir/file.txt");
```

This method is NOT recommended, as it doesn't play nice within node.js and browser environments. Use config instead;

config
------

```
{
    module: {
        loaders: [
            { test: /\.jade$/, loader: "jade" },
            // => "jade" loader is used for ".jade" files

            { test: /\.css$/, loader: "style!css" },
            // => "style" and "css" loader is used for ".css" files
            // Alternative syntax:
            { test: /\.css$/, loaders: ["style", "css"] },
        ]
    }
}
```
