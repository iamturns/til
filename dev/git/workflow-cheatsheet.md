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
git checkout master
git pull --rebase
git checkout [[feature name]]
git rebase master
```

Done
----

Perform one last sync (as above)

The merge below should perform a fast forward with linear history:

```
git checkout master
git merge [[feature name]]
```

That's it!

```
git push
git branch -d [[feature name]]
```
