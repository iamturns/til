Jquery - stop event behaviour cheatsheet
========================================

```
$('selector').click(function(e) {
    e.preventDefault();
    e.stopPropagation(); //stop event propagation to parent elements
    e.stopImmediatePropagation(); //stop event propagation to parent elements AND this element
});
```
