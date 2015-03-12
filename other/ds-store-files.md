Kill .DS_Store files
====================

To see if you have '.DS_Store' files within this directory or subdirectories

```
find . -name ".DS_Store"
```

To delete them:

```
find . -name ".DS_Store" -exec rm {} \;
```

Careful running this on the `/` path, as it can traverse into shared network directories 


Asepsis
-------

Install this and never worry about these files again: http://asepsis.binaryage.com/

To migrate existing .DS_Store files from `~/`

```
asepsisctl migratein
```

From another directory, eg: /Applications

```
asepsisctl --root /Applications migratein
```
