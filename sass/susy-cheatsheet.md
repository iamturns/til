SASS Susy Cheatsheet
====================

- http://susy.oddbird.net/
- http://susydocs.oddbird.net/en/latest/

All settings:

```
$susy: (
  flow: ltr,
  math: fluid, //fluid = span widths in %, static = multiples of 'column-width' setting (leave container: auto and use column-width instead)
  output: float, //float = common, isolate = fixes sub-pixel rounding, generally overkill
  gutter-position: after, //after = margin added to right, last gutter must be removed, before = opposite, split = margins added on both sides, no margins removed on edges, inside = added as padding on both sides, not removed on edges, inside-static = added as static padding on both sides, not removed on edges. LOOK AT NESTING for 'inside', 'inside-static', 'split'
  container: auto, //sets max-width, auto = calculated based on settings (fallback to 100%), <length> = 60em, 80%, etc
  container-position: center, //center, left, right, <length>
  columns: 4, //<number>, <list> for asymmetrical (1 1 2 3 5)
  gutters: .25, //MUST BE A RATIO. FIXED GUTTERS ARE TRICKY. To set explicit column and gutter widths, write as <gutter-width>/<column-width>, eg: 20px/70px
  column-width: false, //set <length> for static layouts, or used in fluid layouts to calculate max width of container. Generally set to 'false' for fluid layouts unless wanted container-width calculated
  global-box-sizing: content-box, //recommended to set entire site to use 'border-box', and then set this to 'border-box'
  last-flow: to,
  debug: (
    image: hide,
    color: rgba(#66f, .25),
    output: background,
    toggle: top right,
  ),
  use-custom: (
    background-image: true,
    background-options: false,
    box-sizing: true,
    clearfix: false,
    rem: true,
  )
);

```

This is the 'global layout'

To tweak the global layout, the following is MERGED into the existing global layout:

```
$layout-default: (
    columns: 12
);
@include layout($layout-default);
```

To TEMPORARILY tweak the layout, use:

```
@include with-layout($layout-settings) {
  //...
}
```

To fetch a setting from a layout

```
$setting: susy-get({{setting key}}, {{optional layout - defaults to global}})
```

Layouts can often be written as a shorthand single line list, instead of long hashes

These are then transformed back to longhand hashes with the `layout()` mixin

eg: `$layout: layout(auto 12 .25 inside fluid isolate);`

The pattern is: `{{grid}} {{keywords}}`

{{grid}} is composed of 'columns' setting (usually a number of columns)
and optional settings for gutters and column width

eg:

```
// 12-column grid
$grid: 12;

// 12-column grid with 1/3 gutter ratio
$grid: 12 1/3;

// 12-column grid with 60px columns and 10px gutters
$grid: 12 (60px 10px);

// asymmetrical grid with .25 gutter ratio
$grid: (1 2 3 2 1) .25;
```

And {{keywords}} is a list of any of these:

```
$global-keywords: (
  container            : auto,
  math                 : static fluid,
  output               : isolate float,
  container-position   : left center right,
  flow                 : ltr rtl,
  gutter-position      : before after split inside inside-static,
  debug: (
    image              : show hide show-columns show-baseline,
    output             : background overlay,
  ),
);

$local-keywords: (
  box-sizing           : border-box content-box,
  edge                 : first alpha last omega,
  spread               : narrow wide wider,
  gutter-override      : no-gutters/no-gutter | <length>, //remove gutter output, or override calculation width explicit width
  clear                : break nobreak,
  role                 : nest, //null by default, mark a grid element for nesting. Required for split, inside, or inside-static
);
```

Span
====

Now we have the layout set, the span is the beginning of the magic

pattern: {{span}} at {{location}} of {{layout}}`

{{span}} = unitless number (meaning # of columns), OR explicit width

{{location}} = seems to be for 'isolated' or asymmetrical grids, ignoring for now

{{context}} = same as all layout shorthand stuff above

```
.item { @include span(25%); }
.item { @include span(3); }

//Sometimes may need to mark item as the first or last, to remove gutters
@include span(last 3);
```

Context
-------

Is required when nesting grid elements inside others

Signalled by the `of` flag

```
.outer {
  @include span(5);
  .inner { @include span(2 of 5); }
}

//Implied version:

.outer {
  // out here, the context is 10
  @include span(5) {
    // in here, the context is 5
    .inner { @include span(2); }
  }
}
```

### narrow, wide, and wider

```
// grid span
.narrow { @include span(2); }
.wide { @include span(2 wide); }
.wider { @include span(2 wider); }

// width output (7 columns, .25 gutters)
// (each column is 10%, and each gutter adds 2.5%)
.narrow { width: 22.5%; }
.wide { width: 25%; }
.wider { width: 27.5%; }
```

### Other settings

- `full` = span entire context
- `break` = start a new 'Rows & Edges' by clearing previous floats (@TODO http://susydocs.oddbird.net/en/latest/toolkit/#tools-row)
- `nobreak` = clear none
- `no-gutters` = remove gutter output from individual span

Function
--------

Can also be used as a function, which returns the width value

```
.item {
  width: span(2);
  margin-left: span(3 wide);
  margin-right: span(1) + 25%;
}
```

Gutters
=======

`gutters` / `gutter` (same thing)

First param is {{span}} as described above

Function returns width:

```
// default context
margin-left: gutter();

// nested in a 10-column context
margin-left: gutter(10);
```

Mixin outputs margins and padding according to settings

```
// default gutters
.item { @include gutters; }

// explicit gutters
.item { @include gutters(3em); }

//or adjust all those settings on the fly
.item { @include gutters(3em inside); }
.item { @include gutters(10 1/3 after); }
```

Container
=========

Param is {{layout}}

```
// global settings
width: container();

// 12-column grid
$large-breakpoint: container(12);

body {
  @include container(12 center static);
}
```

Up to here:
http://susydocs.oddbird.net/en/latest/toolkit/#nested-context