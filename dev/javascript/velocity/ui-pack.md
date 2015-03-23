UI pack
=======

A 3kb pack with two main functions;

- RegisterEffect
- RunSequence

And quite a few pre-registered effects


RunSequence
-----------

Prevents horizontal code for running effects in sequence, eg:

```
$element1.velocity({ translateX: 100 }, 1000, function() {
  $element2.velocity({ translateX: 200 }, 1000, function() {
    $element3.velocity({ translateX: 300 }, 1000);
  });
});
```

Becomes:

```
var mySequence = [
  { e: $element1, p: { translateX: 100 }, o: { duration: 1000 } },
  { e: $element2, p: { translateX: 200 }, o: { duration: 1000 } },
  { e: $element3, p: { translateX: 300 }, o: { duration: 1000 } }
];

$.Velocity.RunSequence(mySequence);
```

#### 'sequenceQueue' option

Run items in parallel:

```
var mySequence = [
  { e: $element1, p: { translateX: 100 }, o: { duration: 1000 } },
  /* The call below will run at the same time as the first call. */
  { e: $element2, p: { translateX: 200 }, o: { duration: 1000, sequenceQueue: false },
  /* As normal, the call below will run once the second call is complete. */
  { e: $element3, p: { translateX: 300 }, o: { duration: 1000 }
];
```
RegisterEffect
--------------

Combine multiple velocity calls into a single effect that can be referenced by name

Do NOT accept loop, easing, or progress options, nor used with `queue: false`

Better code organization and ability to package animations across projects

```
$.Velocity.RegisterEffect(name, {
  defaultDuration: duration,
  calls: [ 
    [ { property: value }, durationPercentage, { options } ],
    [ { property: value }, durationPercentage, { options } ]
  ],
  reset: { property: value, property: value }
});
```

For effect names ending with 'In' or 'Out', the 'display' option is automatically to set to 'block' and 'none'

### Options

#### defaultDuration

Percentage as decimal. Default = 1

#### calls

- properties hash
- durationPercentage (as decimal, 0 to 1)
- options - accepts only 'easing' and 'delay'

#### reset

Applied upon completion of effect

Useful if scaling element down to 0, and then can reset to scale of 1 once hidden (for next animation to use)

Call registered effect
----------------------
 
```
$element.velocity('effectName', { options });
Velocity($element, 'effectName', { options });
```

Options are regular culprits, plus a few extras;

### stagger

Successive delay on each animation element

Eg: if targeting 3 elements, and stagger is '250';

- First element: immediate animation
- Second element: animate after 250
- Third element: animate after 500

### drag

Set to 'true' - successively increase animation duration
 
### backwards

:)
