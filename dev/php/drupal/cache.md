Drupal cache
============

Surprised Drupal requires you to manually check for cache expiry? Me too. Here's some helpers;

```
/**
 * Does not return expired items
 * @param string $id
 * @return mixed false if not available
 */
function cache_get($id)
{
    $cache = cache_get($id, 'cache');
    if ($cache === false) {
        return false;
    }
    if ($cache->expire > 0 && $cache->expire < REQUEST_TIME) {
        return false;
    }
    return $cache->data;
}

/**
 * Allows expiry set in seconds
 * @param string $id
 * @param mixed $data
 * @param int $expire in seconds, CACHE_PERMANENT or CACHE_TEMPORARY
 */
function cache_set($id, $data, $expire)
{
    if ($expire !== CACHE_PERMANENT && $expire !== CACHE_TEMPORARY) {
        $expire = REQUEST_TIME + $expire;
    }
    cache_set($id, $data, 'cache', $expire);
}
```