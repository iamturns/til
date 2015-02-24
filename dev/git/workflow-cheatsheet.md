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

One last sync;

```
git fetch origin master
git rebase origin/master
```

Merge (should do fast forward with linear history);

```
git checkout master
git merge [[feature name]]
```

That's it!

```
git push
git branch -d [[feature name]]
```
