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

Item properties
------------

These properties go onto a flex items, but can also be set and inherited from flex container

**flex-basis**

The starting size (but not guaranteed end size) of an element before grow / shrink come into play

- auto (default) = according to its content, or its `width` or `height` (and related) properties
- 0 = adhere to `flex-grow` value
- value (eg: 10em, 3px, etc)
  - override calculated width with new value (by content or width / height properties)
  - generally requires `flex-shrink` to be disabled to strictly adhere to this

**flex-grow**

Grow item relative to other items in container

- 0 (default) = do not stretch to fill available space
- 1 = stretch to fill available space
- number (eg: 3, 0.6)
  - represents growth factor of item relative to other flex items
  - eg: a `flex-grow: 2` can grow to twice as big as `flex-grow: 1` 

**flex-shrink**

- 1 (default) = shrink
  - May override specified `flex-basis` / `width` / `height`
- 0 = do not shrink below initial size

Flex shorthand
-----------

The above can be manipulated with the shorthand `flex` property

**THREE VALUES**

Shorthand

    flex: <flex-grow> <flex-shrink> <flex-basis>

**DEFAULT / INITIAL**

- Initial size respected = yep
- Grow into extra space = nope
- Shrink if needed = yep

    flex: initial
    
    OR

    flex: 0 1 auto

**FLEX AUTO**

- Grow into extra space = yep

    flex: auto
    
    OR
    
    flex: 1 1 auto
    
    OR
    
    flex-grow: 1

**FLEX NONE**

- Shrink if needed = nope

    flex: none
    
    OR
    
    flex: 0 0 auto
    
    OR
    
    flex-shrink: 0

**SINGLE NUMBER**

Shorthand to set `flex-grow` to value, and `flex-basis: 0`

- Initial size respected = nope
- Grow into extra space = yep, relative to other items flex-grow value

    flex: 5
    
    OR
    
    flex: 5 1 0 

    OR
    
    flex-grow: 5
    flex-basis: 0

Gotchas
------

The following properties have no effect on flex items:

- `float`
- `vertical-align`

### IE10-11

- 3rd param in `flex` shorthand (`flex-basis`) must be unitless
- `min-height` of parent ignored


Misc
----

- Margins of flex items do not ever collapse
- The default value of `auto` means flex cannot go below the length of the longest text. Override with `min-width: 0`.
- `display: inline-flex` on an item to prevent it from being a block, but remain flex
