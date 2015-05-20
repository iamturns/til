Flexbox
=======

Gives the ability for a container to alter its items' width and height to best fill available space

A flex container expands items to fill available free space, and shrinks to prevent overflow

Links
-----

- http://flexboxin5.com/
- https://css-tricks.com/snippets/css/a-guide-to-flexbox/

Alignment
---------

- flex-direction
  - affects children
  - 'row' (default), 'column'

- justify-content
  - for horizontal alignment / row direction
  - values;
    - flex-start (default)
    - flex-end
    - center
    - space-between
    - space-around

- align-items
  - for vertical alignment / column direction
  - values;
    - stretch (default)
    - flex-start
    - flex-end
    - center
    - baseline
    
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

- flex-grow
  - refers to size relative to other flex items in container
  - 0 = do not stretch (default value)
  - 1 = stretch
- flex-shrink
  - The opposite of flex-grow. Generally not set. 
- flex-basis
  - 'min-width' for flex items
