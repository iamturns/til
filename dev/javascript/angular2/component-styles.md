Angular 2 Component Styles
==========================

:host
-----

Target the element that hosts the component

:host-context(selector)
-----------------------

Look for any selector match across all ancestors

```css
:host-context(.theme--light) h2 {
  background-color: #eef;
}
```

The above applies CSS to `<h2>` *within* the component, if any ancestor (perhaps `<body>`) has `.theme--light`

/deep/
------

Alias: `>>>`

Force a style down into all child components

Eg, all h3 elements are italic;

```css
:host /deep/ h3 {
  font-style: italic;
}
```
