Bootstrap
=========

Requires jQuery 1.11.3

Good tips about problems across browsers: http://getbootstrap.com/getting-started/#support

CSS
===

Containers
----------

- `container` - responsive fixed with container
- `container-fluid` - full width container, spanning entire viewport width

Grid system
-----------

The flow is: container > row > col > content

### Columns

Columns are specified with a class name, eg: `col-md-4`, meaning;
- Takes up the space of 4 (always out of 12)
- Appears on medium breakpoint, and also flows into larger breakpoints (`col-lg-*`)

Sizes;
- xs
  - `< 768`
- sm
  - `>= 768`
- md
  - `>= 992`
- lg
  - `>= 1200`

Default gutter: 30px

Usually combine column classes:

```
<div class="row">
  <div class="col-xs-12 col-sm-6 col-md-8"></div>
  <div class="col-xs-6 col-md-4"></div>
</div>
```

If a row contains more than 12 columns, they will start wrapping onto new lines

### Clear fixes

Sometimes columns don't overflow properly

`<div class="clearfix visible-xs-block"></div>`

### Offset

`col-md-offset-4` = left margin of 4 columns

### Nesting

Columns can contain another row

### Ordering

- `col-md-push-*`
- `col-md-pull-*`

Typography
==========

http://getbootstrap.com/css/#type
