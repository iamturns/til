Date parsing
============

Usually done with `strtotime()`

If the separator is a slash (/), then the American m/d/y is assumed

Whereas a dash (-) or (.) is the European d-m-y format

To avoid ambiguity, it's advised to use ISO 8601 (YYYY-MM-DD) dates

Or, if you have PHP 5.3;

```
DateTime::createFromFormat('!d/m/Y', '23/05/2010')->getTimestamp();
```
