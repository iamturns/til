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
  - determines how flex items are placed in the flex container
  - values;
    - row (default)
    - column

- justify-content
  - align flex items on main axis (left and right)
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
  - align flex items on cross axis (up and down)
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

- flex-wrap
  - determines if flex items are forced into single line (default) or can wrap onto multiple lines
  - values;
    - nowrap (default)
    - wrap

- align-content
  - align multiple lines within a flex container by cross axis (up and down)
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
  - 0 (default) = do not stretch
  - 1 = stretch
  - number (eg: 3, 0.6)
    - represents growth factor of item relative to other flex items
    - eg: a `flex-grow: 2` can grow to twice as big as `flex-grow: 1`
- flex-shrink
  - 1 (default) = shrink
    - May override specified `flex-basis` / `width` / `height`
  - 0 = do not shrink (keep to minimum width)
- flex-basis
  - the starting size of an element before grow/shrink come into play
    - The 'ideal' size, but not guaranteed size
  - auto (default) = according to its content, or its `width` or `height` (and related) properties
  - 0 = adhere to `flex-grow`
  - value (eg: 10em, 3px, etc)
    - override calculated width with new value (by content or width / height properties)
    - generally requires `flex-shrink` to be disabled to strictly adhere to this

### Common flex settings

Item should squish if there isn't enough room, but not stretch any wider than it needs to be:

    // flex: 0 1 auto
    // This is the default flex settings, no code required!

Item should stretch to fill all available space, and squish if there's not enough room:

    flex: 1 1 auto
    // or
    flex: auto
    // or
    flex-grow: 1;
  
Item should not flex at all

    flex: 0 0 auto
    // or
    flex: none
    // or
    flex-shrink: 0

No effect
------

The following properties have no effect on flex items:

- `float`
- `vertical-align`

Misc
----

- Margins of flex items do not ever collapse
- The default value of `auto` means flex cannot go below the length of the longest text. Override with `min-width: 0`.
- `display: inline-flex` on an item to prevent it from being a block, but remain flex
