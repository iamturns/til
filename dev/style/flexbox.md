Flexbox
=======

Gives the ability for a container to alter its items' width and height to best fill available space

A flex container expands items to fill available free space, and shrinks to prevent overflow

Links
-----

- http://flexboxin5.com/
- https://css-tricks.com/snippets/css/a-guide-to-flexbox/
- http://jonibologna.com/content/images/flexboxsheet.pdf
- https://github.com/philipwalton/flexbugs
- https://philipwalton.github.io/solved-by-flexbox/


Axis
----


`       CROSS AXIS        `
`|           |           |`
`|           |           |`
`| - - - MAIN AXIS - - - |`
`|           |           |`
`|           |           |`
 
Activate
--------

```
display: flex;
```

This is now the 'flex container'

Its children are now 'flex items'
 
Alignment
---------

- flex-direction
  - values;
    - row (default)
    - column

- flex-wrap
  - nowrap (default)
    - Fit onto one line
  - wrap

- justify-content
  - align items across the main axis
  - values;
    - flex-start (default)
      - `| * * *         |`
    - flex-end
      - `|         * * * |`
    - center
      - `|     * * *     |`
    - space-between
      - `| *     *     * |`
    - space-around
      - `|   *   *   *   |`

- align-items
  - align flex items on cross axis
  - values;
    - stretch (default)
      - `| * * * |`
      - `| * * * |`
      - `| * * * |`
      - `| * * * |`
    - flex-start
      - `| * * * |`
      - `| *   * |`
      - `|     * |`
    - flex-end
      - `|     * |`
      - `| *   * |`
      - `| * * * |`
    - center
      - `|     * |`
      - `| * * * |`
      - `|     * |`

- align-content
  - align multiple lines within a flex container by cross axis
  - values;
    - stretch (default)
    - flex-start
    - flex-end
    - center
    - space-between
    - space-around
  
Align single items
------------------

Use `align-self` or `margin`

```
.left {
   align-self: flex-start;
}

.right {
   margin-left: auto;
}
```

Flexible sizes
--------------

Shortcut;

    flex: @@flex-grow@@ @@flex-shrink@@ @@flex-basis@@

- flex-grow
  - refers to size relative to other flex items in container
  - 0 = do not stretch (default value)
  - 1 = stretch
- flex-shrink
  - 1 = shrink (default)
  - 0 = do not shrink (keep to minimum width)
- flex-basis
  - the starting size of an element before grow/shrink come into play
  - set to `auto` by default
      - meaning: use width, max-width, min-width, etc
  - generally ruires `flex-shrink` to be disabled to strictly adhere to this values