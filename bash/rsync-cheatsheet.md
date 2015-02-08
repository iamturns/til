Rsync cheatsheet
================

## Base command

```
rsync -rvzP --delete {{src}} {{destination}}
```

* -r recursive
* -v verbose
* -z compress files
* -P show progress
* --delete remove files from destination if not present in source

## Modes

You must add _one_ of the following parameters;

### -t

Preserve and compare with file modification time

### -a

Archive mode

Preserve and compare with file permissions, ownership, symbolic links

May be overkill in many cases, and can cause permission problems

### --size-only

Compare using filesize

### -c

Compare using checksum

Super slow!


## More

### --modify-window

Reduce accuracy of compared modified times

Useful for daylight saving problems;
```
--modify-window=60
```