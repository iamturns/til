Velocity cheatsheet
===================

Replace $.animate() with $.velocity() (syntax is identical)

Speed
-----

- Does not use jQuery animation stack, rolls its own
- Better syncing between DOM and tween stack to minimize layout thrashing
- Better cache system for DOM querying

Browser support
---------------

- IE8+
- Android 2.3+

Below that, Velocity will not load, and commands alias to jQuery $.animate

Without jQuery
--------------

- Browser support changes to IE9+
- Attached itself to window object (`Velocity` not `$.Velocity`)
- Raw DOM elements passed into first parameter
- No 'queue' or 'delay' functions
  - Delegate queued logic to Velocity's 'begin' and 'complete' callbacks
  - Use 'delay' option
  
More: http://www.smashingmagazine.com/2014/09/04/animating-without-jquery/

Basics
------

```
$element.velocity({
  width: "500px",
  property2: value2
});
```

### Options

Velocity default options shown

Can be overridden with `$.Velocity.defaults`

```
$element.velocity({
  properties: {
    width: "500px",
    property2: value2
  },
  options: {
    duration: 400,
    easing: "swing",
    queue: "",
    begin: undefined,
    progress: undefined,
    complete: undefined,
    display: undefined,
    visibility: undefined,
    loop: false,
    delay: false,
    mobileHA: true
  }
});
```

### Without jQuery

```
Velocity({
  elements: $element,
  properties: {}
  options: {}
})
```

### Short hand

Properties in any order:

`$element.velocity(propertyMap [, duration] [, easing] [, complete])`

Eg:

```
$element.velocity({ width: "500px" }, 1000, "swing", function() { alert('done'); }); 
```

Or per property:

```
$element.velocity({
  width: ["500px", "swing"],
  height: ["100px", "spring"]
})
```

Properties
----------

Do not prefix properties, Velocity calculates for you

Each property animates *one numeric value* only

Chaining / queueing
-------------------

Uses queuing system - each one fires when previous has completed;

```
$element
    .velocity({ width: 75 })
    .velocity({ height: 0 });
```

Set the 'queue' option to 'false' to run in parallel

```
$element
  .velocity({ width: 75 })
  .velocity({ height: 0 }, { queue: false });
```

Easing
------

- http://easings.net/
  - Except for back, bounce, and elastic
    - These are achieved with 'spring' physics (see below)
- CSS3 bezier curves
  - Pass a four-item array of bezier points
  - http://cubic-bezier.com/
- Spring physics
  - Two item array: `[tension, friction]`
  - Tension (default 500). Higher = increase speed and bounciness
  - Friction (default: 20). Lower = increases vibration speed
  - http://codepen.io/julianshapiro/pen/hyeDg
- Step easing
  - One item array
  - https://css-tricks.com/clever-uses-step-easing/

Callbacks
---------

Callbacks are executed once per call, even if multiple elements are animated at once
 
```
{
  begin: function(element) {}
  complete: function(elements) {}
  progress: function(elements, complete, remaining, start, tweenValue) {}
}
```

More options
------------

### loop

Set to a number, or true to loop indefinitely

### delay

Milliseconds

### display

- inline
- inline-block
- block
- flex
- '' (remove property)
- auto (divs to block, spans to inline, etc)
- none (set *after* animation has completed)

### visibility

- hidden (set *after* animation has completed)
- visible
- collapse
- '' (remove property)

Commands
--------

### Fade & slide

```
$element.velocity('fadeIn')
$element.velocity('fadeOut')
$element.velocity('slideUp')
$element.velocity('slideDown')
```

### Scroll

Scroll browser to element;

```
$element.velocity('scroll')
```

Scroll element inside containing element;

```
$element.velocity('scroll', { container: $('#container') })
```

Scroll 'Y' axis by default, to change;

```
$element.velocity('scroll', { axis: 'x' })
```

There is also an 'offet' option

### stop

Stop animation and proceed to next in queue

'complete' callback and 'display' toggles skipped

To clear all animations in queue;

```
$element.velocity('stop', true)
```

### finish

Jump to end of animation

### reverse

:)

Transforms
----------

- translateX
- translateY
- scaleX
- scaleY
- rotateZ

Color
-----

```
$element.velocity({
  backgroundColor: "#ff0000", //Animate a color property to a hex value of red
  backgroundColorAlpha: 0.5, //With 50% opacity
  colorRed: "50%", //Animate the red RGB component to 50% (0.5 * 255)
  colorBlue: "+=50", //Concurrently animate to a stronger blue
  colorAlpha: 0.85 //Fade the text down to 85% opacity
});
```

Forcefeeding
------------

To avoid 'layout thrashing', the DOM is not queried for the initial value before the property is animated

Start values are forcefed as the second or third items in an array of the property value

```
element.velocity({
  translateX: [ 500, 0 ],
  opacity: [ 0, "easeInSine", 1 ]
});
```

translateX starts at 0, and opacity starts at 1

