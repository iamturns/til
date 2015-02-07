PHP normalize new lines
=======================

```
<?php
$text = preg_replace('/\r\n|\r|\n/', "\n", $text);
```
