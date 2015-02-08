PHP array_merge vs +
====================

array_merge
-----------

If array contains same string key: value overwritten by latest input
If array contains same numerical key: value appended by latest input

+
-

If array contains same key, left hand takes precedence

tldr
----

You want to use `array_merge` most of the time

`+` is only good for associate arrays
