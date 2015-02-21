SASS variable scope
===================

```
@mixin foo {
  $val: 'red' !default; // defined locally
}

@include foo //$val = 'red' - no global var found

.class1 {
  $val: 'green';
  @include foo; //$val = 'red' - no global var found

  color: $val //changes local var

  .class11 {
    @include foo; //$val = 'red' - no global var found
  }
}

$val: 'black'; //defined globally (for first time!)

.class2 {
  @include foo; //$val = 'black'
}

.class3 {
  $val: 'blue'; //changes global var
  @include foo; //$val = 'blue
}

.class4 {
  @include foo; //$val = 'blue' - global been set previously
}
```