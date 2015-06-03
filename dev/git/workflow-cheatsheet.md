Git workflow cheatsheet
=======================

A simple one, works well for me :)

For something more advanced, see `gitflow-cheatsheet.md`

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
