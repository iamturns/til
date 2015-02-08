PHP exception to string
=======================

```
<?php
sprintf(
  "Exception '%s' with message '%s' in %s:%s",
  get_class($exception),
  $exception->getMessage(),
  $exception->getFile(),
  $exception->getLine()
);
```
