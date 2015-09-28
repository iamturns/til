Animation libraries
===================

Velocity
--------

https://github.com/julianshapiro/velocity

Can be used with or without jQuery

Same as jQuery syntax. Animations are sped up by reducing read/writes.

Can also apply values on translateX, translateY, etc

Calculates easing etc in javascript, sets them on the element

'Stagger' is v nice, but could probably be implemented easily with some JS and CSS3

Personally, I've had some performance problems on mobile with this

Transit
-------

http://ricostacruz.com/jquery.transit/

Adds CSS3 transitions support to jQuery

Supports fallback to jQuery frame-based animation if unsupported browser

Effeckt.css
-----------

Performance based CSS3 lib

Aims to perform at 60fps

https://github.com/h5bp/Effeckt.css

Docs suck, not even sure how to use it

(Banner on top says it's not quite ready for prime time)

Bounce.js
---------

Web tool to generate CSS3 animation code

http://bouncejs.com/

Or, generate the animations via javascript, and apply directly to elements, wow!

https://github.com/tictail/bounce.js/

Animate.css
-----------

http://daneden.github.io/animate.css/

Very popular, predefined transitions

Just add the animation class to object, eg: 'bounceOutLeft'

And then apply 'animated', using javascript if you like, to trigger it

Other
=====

Javascript vs CSS
-----------------

Javascript benefits;

- Queue animations
- Trigger events after animations finish
- Greater control (play, rewind, etc)
- Interrupt
- Cancel animation

CSS benefits;

- Easier to debug (just add a class)
  - Eg: javascript triggers animation on hover, crazy hard to debug 

Links;

- http://davidwalsh.name/css-js-animation
- http://www.extreme-creations.co.uk/blog/velocity-js-vs-animate-css-which-is-faster-smoother-more-controllable/

Performance comparison
----------------------

- http://codepen.io/GreenSock/pen/pmknI

Detect when CSS3 animation ends
-------------------------------

```
$('#yourElement').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', doSomething);
```

Prevent flickers
----------------

```
-webkit-backface-visibility: hidden;
```

- http://stackoverflow.com/questions/3461441/prevent-flicker-on-webkit-transition-of-webkit-transform

Text flickering / antialias problem
-----------------------------------

```
-webkit-transition: translate3d(0,0,0);
```

- http://davidwalsh.name/translate3d
- http://cubiq.org/you-shall-not-flicker

