Git workflow cheatsheet
=======================

Works well for me :)

Begin
-----

```
git checkout -b [[feature name]]
```

Master to branch sync
---------------------

```
git fetch origin master
git rebase origin/master
```

Done
----

```
git checkout [[feature name]]
git fetch origin master
git rebase origin/master
git checkout master
git merge [[feature name]]
git push
git branch -d [[feature name]]
```
