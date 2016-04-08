Git FTP
=======

https://github.com/git-ftp/git-ftp

**Config**

```
git config git-ftp.[scope].url xxx
git config git-ftp.[scope].user xxx
git config git-ftp.[scope].password xxx
```

Match scope name with your branch name

**Init**

```
git ftp init -s
```

OR manually upload everything, then

```
git ftp catchup -s
```

**Push**

```
git ftp push -s
```

**Misc**

Some handy parameters:
* `-D` dry run
* `-v` verbose
* `-vv` very verbose