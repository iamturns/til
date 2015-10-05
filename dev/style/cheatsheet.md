Style cheatsheet
================

Selectors
=========

div > p
    p elements with an immediate parent of div
div + p
    p elements *immediately* after div elements
div ~ p
    p elements *anywhere* after div elements, within the same parent

[attribute="value"]
[attribute^="value"]
    Begins with
[attribute$="value"]
    End with
[attribute*="value"]
    Contains
[attribute~=value]
    Contains word (space delimited)
    
p:first-child
    p elements that are the first child of its parent
p:first-of-type
    p elements that are the first p element of its parent
p:last-child
    p elements that are the last child of its parent
p:last-of-type
    p elements that are the last p element of its parent
p:nth-child(2)
    p elements that is the second of its parent

jQuery
------

aka Sizzle engine

### Features

- Full CSS3 selectors, EXCEPT for;
    - `:hover`
    - `:active`
    - `:visited`
    - `:link`
    
- Multiple selectors
    - eg: `(selector1, selector, selector3)`

- Full selector lists in `:not()`
    - eg: `:not(a.b)`, `:not(div > p)`

- Nested pseudo selectors
    - eg: `:not(:has(div:first-child))`

- `[attribute!=value]`
    - Does not equal
- `:contains(value)`
- `:header`
    - h1 - h6
- `:parent`
    - Elements with at least one child node
- `:empty`
    - The inverse of `:parent`
- `:only-child`
    - Selector is only child of their parent
    
### Forms
    
- `:input`
    - All input elements
- `:checkbox`, `:file`, `:image`, `:password`, `:radio`, `:reset`, `:submit`, `:text`
    - Input elements of a certain type
- `:checked`, `:selected`
- `:enabled`, `:disabled`

### Positional

- `:first`, `:last`
- `:even`, `:odd`
- `:eq(val)`, `:nth(val)`
- `:lt(val)`, `:gt(val)`
    - Position is less than or greater than value

Units
=====

Root em
-------

The same as em, but relative to the root element, not the parent element

eg: `1rem`

### Browser support

IE9 + IE10 = Works, but not within font shorthand, or on pseudo elements
    
Viewport
--------

vh
    Percentage of viewport height
vw
    Percentage of viewport width
vmin
    Percentage of viewport width or height, whichever is smallest
vmax
    Percentage of viewport width or height, whichever is largest

### Browser support

IE9 = `vm` instead of `vmin`
IE10 + IE11 = No vmax
