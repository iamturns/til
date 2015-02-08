Run command on all subdirectories
=================================

```
find . -type d -exec sh -c '( do-what-you-want-with {} )' \;
```

Where {} contains the directory path

Example:
```
find . -type d -exec sh -c '(cd "{}" && filenametodatetaken)' \;
```
