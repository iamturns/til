Angular 2 Animations
====================

Imports
-------

```javascript
import {
  trigger,
  state,
  style,
  transition,
  animate
} from '@angular/core';
```

Example
-------

Define styles for each state, eg: 'active' and 'inactive'.

```javascript
@Component({
  animations: [
    trigger('flyInOut', [
      state('inactive', style({
        backgroundColor: '#eee',
        transform: 'scale(1)'
      })),
      state('active', style({
        backgroundColor: '#cfd8dc',
        transform: 'scale(1.1)'
      })),
      transition('inactive => active', animate('100ms ease-in')),
      transition('active => inactive', animate('100ms ease-out'))
    ])
  ]
})
```

The styles specify the *end styles* for each state.


Trigger
-------

Triggered by `@triggerName` syntax.

```html
<div @flyInOut="hero.state"></div>
```

Transitions
-----------

Same timings for multiple transitions;

```javascript
transition('state1 => state2, state2 => state3', animate('100ms'))
```

If the same transition goes in both directions;

```javascript
transition('state1 <=> state2', animate('100ms'))
```

Animate
-------

The `animate()` accepts three timing properties; duration, delay, and easing. These are all combined into one string.

* `100` - 100 milliseconds duration
* `100ms`
* `0.1s`
* `100ms 500ms` - Delay of 500ms
* `100ms 500ms ease-in-out`

Transition styles
-----------------

A transition can also add styles *only* for the transition;

```javascript
transition('state1 => state2', [
  // The below is set at the beginning of the transition
  style({
    backgroundColor: 'black'
  }),
  animate('80ms ease-in', style({
      // Styles below will be animated too (in addition to state styles)
      backgroundColor: 'green'
  });
]);
```

Wildcards
---------

Self explanatory;

* `active => *`
* `* => active`
* `* => *`

Void
----

`void` state is triggered when the element is not attached to a view

Automatic property calculation
------------------------------

For style properties that aren't known until runtime.

Use the `*` wildcard for the style property, and it will be populated with the current value.

```javascript
animations: [
  trigger('shrinkOut', [
    state('in', style({height: '*'})),
    transition('* => void', [
      style({height: '*'}),
      animate(250, style({height: 0}))
    ])
  ])
]
```

Keyframes
---------

Instead of passing in `style()` to animate, can pass in `keyframes()`

Keyframes is a collection fo styles to animate at particular points on the timeline.

Each keyframe sets an offset, between 0 (beginning) and 1 (end).

```javascript
animations: [
  trigger('flyInOut', [
    state('in', style({transform: 'translateX(0)'})),
    transition('void => *', [
      animate(300, keyframes([
        style({opacity: 0, transform: 'translateX(-100%)', offset: 0}),
        style({opacity: 1, transform: 'translateX(15px)',  offset: 0.3}),
        style({opacity: 1, transform: 'translateX(0)',     offset: 1.0})
      ]))
    ]),
    transition('* => void', [
      animate(300, keyframes([
        style({opacity: 1, transform: 'translateX(0)',     offset: 0}),
        style({opacity: 1, transform: 'translateX(-15px)', offset: 0.7}),
        style({opacity: 0, transform: 'translateX(100%)',  offset: 1.0})
      ]))
    ])
  ])
]
```

Groups
------

Animate things at the same time using `group()`, which takes a collection of `animate()` or `keyframes()`

```javascript
animations: [
  trigger('flyInOut', [
    state('in', style({width: 120, transform: 'translateX(0)', opacity: 1})),
    transition('void => *', [
      style({width: 10, transform: 'translateX(50px)', opacity: 0}),
      group([
        animate('0.3s 0.1s ease', style({
          transform: 'translateX(0)',
          width: 120
        })),
        animate('0.3s ease', style({
          opacity: 1
        }))
      ])
    ]),
    transition('* => void', [
      group([
        animate('0.3s ease', style({
          transform: 'translateX(50px)',
          width: 10
        })),
        animate('0.3s 0.2s ease', style({
          opacity: 0
        }))
      ])
    ])
  ])
]
```
