Symfony xdebug setup
====================

Add to the top of `web/app_dev.php`

```
$isXdebug = (isset($_COOKIE['XDEBUG_SESSION']));
```

---

Replace:

```
require_once __DIR__ . '/../app/bootstrap.php.cache';
```

With:

```
if ($isXdebug) {
    require_once __DIR__ . '/../app/autoload.php';
} else {
    require_once __DIR__ . '/../app/bootstrap.php.cache';
}
```
---

Replace:

```
$kernel->loadClassCache();
```

With:

```
if (!$isXdebug) {
    $kernel->loadClassCache();
}
```
