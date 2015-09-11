Sass trigger transition delay
=============================

```
@for $i from 1 through 10 {
  &:nth-child(#{$i}) {
    transition-delay: 75ms * $i;
  }
}
```
