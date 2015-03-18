SASS placeholder problem
========================

If you structure like this;

- modules/placeholder.scss
- partials/some-base-theme-stuff.scss
- partials/something-that-uses-module-placeholder.scss

The placeholder output will be spat out before the `some-base-theme-stuff.scss` (probably not what you want)
 