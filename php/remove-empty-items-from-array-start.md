PHP remove empty items from start of array
==========================================

```
<?php

while (
    isset($array[0])
    && empty($array[0])
) {
    $array = array_slice($array, 1);
}
```
