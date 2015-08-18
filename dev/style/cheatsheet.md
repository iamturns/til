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
    
### Root em units

The same as em, but relative to the root element, not the parent element

eg: `1rem`

#### Browser support

IE9 + IE10 = Works, but not within font shorthand, or on pseudo elements
    
### Viewport units

vh
    Percentage of viewport height
vw
    Percentage of viewport width
vmin
    Percentage of viewport width or height, whichever is smallest
vmax
    Percentage of viewport width or height, whichever is largest

#### Browser support

IE9 = `vm` instead of `vmin`
IE10 + IE11 = No vmax
