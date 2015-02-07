PHP singleton scaffold
======================

**Generally avoided due to dependency injection woes**

Using this technique allows classes to override the singleton, and getInstance() will figure out what to return.

```
<?php

class Example
{

    /**
     * @var array
     */
    protected static $_instances = array();

    /**
     * @return Example
     */
    public static function getInstance()
    {
        $class = get_called_class();
        if (!isset(self::$_instances[$class])) {
            self::$_instances[$class] = new $class();
        }
        return self::$_instances[$class];
    }

}
```